import 'dart:async';

import 'package:flutter/material.dart';

import '/models/products_model/product_list_model.dart';
import '/services/product_service.dart';
import '../../../models/products_model/product_filter_model.dart';
import '../../../models/products_model/products_list_response_model.dart';
import '../../../widgets/radio_button_group/radio_button_model.dart';
import '../products_list_models/sort_model.dart';

class ProductsListProvider extends ChangeNotifier {
  final ProductFilterModel initProductFilter;
  final SortModel initSortModel;
  ProductsListProvider({
    required this.initProductFilter,
    required this.initSortModel,
  }) {
    productFilter =initProductFilter.copyWith(
      category: initProductFilter.category,
      fromPrice: initProductFilter.fromPrice,
      hasDiscount: initProductFilter.hasDiscount,
      searchTerm: initProductFilter.searchTerm,
      superCategory: initProductFilter.superCategory,
      toPrice: initProductFilter.toPrice,
    
    );
    sortModel = initSortModel;
  }
  Timer? _searchDebounce;

  late ProductFilterModel productFilter;
  late SortModel sortModel;
  final searchController = TextEditingController();
  bool hasMoreProducts = false;
  bool isLoadingMoreProducts = false;
  int page = 1;

  List<ProductListModel> products = [];

  setProductFilter(ProductFilterModel value) async {
    productFilter = value;
    await getInitProducts();
    notifyListeners();
  }

  setSort(SortModel value) async {
    sortModel = value;
    await getInitProducts();
    notifyListeners();
  }

  void searchProducts() async {
    if (_searchDebounce?.isActive ?? false) _searchDebounce!.cancel();
    _searchDebounce = Timer(const Duration(milliseconds: 700), () async {
      clearData();
      page++;
      final productResponse = await getProductsResponse();
      products.addAll(productResponse?.products ?? []);
      notifyListeners();
    });
  }

  void clearData() {
    products.clear();
    page = 1;
  }

  Future<void> getInitProducts({bool notify = false}) async {
    clearData();
    final productResponse = await getProductsResponse();
    products = productResponse?.products ?? [];
    hasMoreProducts = productResponse?.hasNext ?? false;
    if (notify) notifyListeners();
  }

  Future<ProductsListResponseModel?> getProductsResponse() async {
    return await ProductService.getProducts(
      productFilterModel: productFilter,
      sortModel: sortModel,
      searchTerm: searchController.text,
      page: page++,
    );
  }

  void getMoreProducts() async {
    isLoadingMoreProducts = true;
    notifyListeners();
      await Future.delayed(const Duration(milliseconds: 500));
    final productResponse = await getProductsResponse();
    products.addAll(productResponse?.products ?? []);
    hasMoreProducts = productResponse?.hasNext ?? false;
    isLoadingMoreProducts = false;
    notifyListeners();
  }

  List<RadioButtonModel> sorts = [
    RadioButtonModel(
      id: "priceAsc",
      value: SortModel(
        sortBy: "price",
        orderBy: "asc",
      ),
      text: "Price ascending",
      icon: Icons.arrow_upward,
    ),
    RadioButtonModel(
      id: "priceDesc",
      value: SortModel(
        sortBy: "price",
        orderBy: "desc",
      ),
      text: "Price descending",
      icon: Icons.arrow_downward,
    ),
    RadioButtonModel(
      id: "createdAsc",
      value: SortModel(sortBy: "createdAt", orderBy: "asc"),
      text: "Date ascending",
      icon: Icons.arrow_upward,
    ),
    RadioButtonModel(
        id: "createdDesc",
        value: SortModel(sortBy: "createdAt", orderBy: "desc"),
        text: "Date descending",
        icon: Icons.arrow_downward),
    RadioButtonModel(
        id: "discountAsc",
        value: SortModel(sortBy: "discount", orderBy: "asc"),
        text: "Discount ascending",
        icon: Icons.arrow_upward),
    RadioButtonModel(
        id: "discountDesc",
        value: SortModel(sortBy: "discount", orderBy: "desc"),
        text: "Discount descending",
        icon: Icons.arrow_downward),
  ];
}
