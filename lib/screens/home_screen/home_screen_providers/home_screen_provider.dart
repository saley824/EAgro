import 'package:flutter/material.dart';
import 'package:msan/services/category_service.dart';

import '../../../models/category_model/category_model.dart';
import '../../../models/products_model/product_filter_model.dart';
import '../../../models/products_model/product_list_model.dart';
import '../../../services/product_service.dart';
import '../../products_list_screen/products_list_models/sort_model.dart';

class HomeScreenProvider extends ChangeNotifier {
  List<ProductListModel> lastAddedProducts = [];
  SortModel lastAddedSort = SortModel(sortBy: "createdAt", orderBy: "desc");

  List<ProductListModel> byRandomCategory = [];

  List<ProductListModel> productsWithBiggestDiscount = [];
  SortModel biggestDiscountSort =
      SortModel(sortBy: "discount", orderBy: "desc");
  ProductFilterModel biggestDiscountFilter = ProductFilterModel(
    hasDiscount: true,
  );

  List<CategoryModel> superCategories = [];
  CategoryModel? selectedCategory;

  getAll() async {
    await getByRandomCategory();
    await getLastAddedProducts();
    await getProductsWithBiggestDiscount();
  }

  getByRandomCategory() async {
    superCategories = await CategoryService.getSuperCategories();
    selectedCategory = superCategories[0];
    final productsResponse = await ProductService.getProducts(
      productFilterModel: ProductFilterModel(superCategory: selectedCategory),
      sortModel: SortModel(sortBy: "createdAt", orderBy: "desc"),
    );
    byRandomCategory = productsResponse?.products ?? [];
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
