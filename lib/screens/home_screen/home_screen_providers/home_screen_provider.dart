import 'dart:developer';

import 'package:eagro/screens/orders_screen/orders_providers/orders_service.dart';
import 'package:flutter/material.dart';
import 'package:eagro/services/category_service.dart';
import 'package:provider/provider.dart';

import '../../../models/category_model/category_model.dart';
import '../../../models/products_model/product_filter_model.dart';
import '../../../models/products_model/product_list_model.dart';
import '../../../providers/main_provider.dart';
import '../../../services/product_service.dart';
import '../../products_list_screen/products_list_models/sort_model.dart';

class HomeScreenProvider extends ChangeNotifier {
  List<ProductListModel> lastAddedProducts = [];
  SortModel lastAddedSort = SortModel(sortBy: "createdAt", orderBy: "desc");

  List<ProductListModel> productsByRecommendedCategory = [];
  CategoryModel? recommendedCategory;

  List<ProductListModel> productsWithBiggestDiscount = [];
  SortModel biggestDiscountSort =
      SortModel(sortBy: "discount", orderBy: "desc");
  ProductFilterModel biggestDiscountFilter = ProductFilterModel(
    hasDiscount: true,
  );

  List<CategoryModel> superCategories = [];
  CategoryModel? selectedCategory;

  getAll(BuildContext context) async {
    await getRecommendedCategory(context);
    await getLastAddedProducts();
    await getProductsWithBiggestDiscount();
  }

  getRecommendedCategory(BuildContext context) async {
    final mainProvider = Provider.of<MainProvider>(context, listen: false);
    recommendedCategory =
        await OrderService.getMostUsedCategory(mainProvider.user?.id ?? "");

    if (recommendedCategory != null) {
      final recommendedParentCategory = await CategoryService.getCategoryById(
          recommendedCategory!.superCategory!.id);
      final productsResponse = await ProductService.getProducts(
        productFilterModel: ProductFilterModel(
            superCategory: recommendedParentCategory,
            category: recommendedCategory),
        sortModel: SortModel(sortBy: "createdAt", orderBy: "desc"),
      );
      productsByRecommendedCategory = productsResponse?.products ?? [];
    }
  }

  getLastAddedProducts() async {
    final productsResponse = await ProductService.getProducts(
        productFilterModel: ProductFilterModel(),
        sortModel: SortModel(sortBy: "createdAt", orderBy: "desc"));

    lastAddedProducts = productsResponse?.products ?? [];
  }

  getProductsWithBiggestDiscount() async {
    final productsResponse = await ProductService.getProducts(
      productFilterModel: ProductFilterModel(
        hasDiscount: true,
      ),
      sortModel: SortModel(sortBy: "discount", orderBy: "desc"),
    );
    productsWithBiggestDiscount = productsResponse?.products ?? [];
  }

  void refresh() {
    notifyListeners();
  }
}
