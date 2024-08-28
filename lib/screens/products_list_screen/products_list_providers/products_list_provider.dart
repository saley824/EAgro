import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../models/products_model/products_list_response_model.dart';
import '/models/products_model/product_list_model.dart';
import '/services/product_service.dart';
import '../../../models/products_model/product_filter_model.dart';
import '../../../widgets/radio_button_group/radio_button_model.dart';
import '../products_list_models/sort_model.dart';

class ProductsListProvider extends ChangeNotifier {
  ProductFilterModel productFilter;
  SortModel sortModel;
  ProductsListProvider({
    required this.productFilter,
    required this.sortModel,
  });
  Timer? _searchDebounce;

  final searchController = TextEditingController();
  bool hasMoreProducts = false;
  bool isLoadingMoreProducts = false;
  int page = 1;

  List<ProductListModel> products = [];

  setProductFilter(ProductFilterModel value) {
    productFilter = value;
    notifyListeners();
  }

  setSort(SortModel value) {
    sortModel = value;
    notifyListeners();
  }

  void searchSellers() async {
    log('DEV LOG----------------------------aa--------------------------------------');
    log('DEV LOG------------------------------------------------------------------');
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
    page = 0;
  }

  Future<void> getInitProducts() async {
    final productResponse = await getProductsResponse();
    products = productResponse?.products ?? [];
    hasMoreProducts = productResponse?.hasNext ?? false;
  }

  Future<ProductsListResponseModel?> getProductsResponse() async {
    return await ProductService.getProducts(
      productFilterModel: productFilter,
      sortModel: sortModel,
      searchTerm: searchController.text,
      page: page,
    );
  }

  void getMoreProducts() async {
    isLoadingMoreProducts = true;
    notifyListeners();
    page++;
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
