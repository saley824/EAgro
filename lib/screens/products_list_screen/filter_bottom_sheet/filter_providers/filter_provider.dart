import 'package:flutter/material.dart';

import '/models/category_model/category_model.dart';
import '/models/products_model/product_filter_model.dart';
import '/services/category_service.dart';
import '/widgets/drop_down/drop_down_model/agro_dropdown_model.dart';

class FilterProvider extends ChangeNotifier {
  final ProductFilterModel productFilter;

  FilterProvider({
    required this.productFilter,
  }) {
    fromPriceController.text = productFilter.fromPrice != null
        ? productFilter.fromPrice.toString()
        : "";
    toPriceController.text =
        productFilter.toPrice != null ? productFilter.toPrice.toString() : "";
    hasDiscount = productFilter.hasDiscount;

    if (productFilter.superCategory != null) {
      selectedSuperCategory = AgroDropdownModel(
        id: productFilter.superCategory!.id,
        text: productFilter.superCategory!.name,
        value: productFilter.superCategory,
      );
      getSubCategories(productFilter.superCategory!.id);
    }
    if (productFilter.category != null) {
      selectedSubCategory = AgroDropdownModel(
        id: productFilter.category!.id,
        text: productFilter.category!.name,
        value: productFilter.category,
      );
    }
  }

  final fromPriceController = TextEditingController();
  final toPriceController = TextEditingController();

  bool hasDiscount = false;

  setHasDiscount(value) {
    hasDiscount = value;
  }

  bool isButtonEnabled = false;

  AgroDropdownModel? selectedSuperCategory;
  AgroDropdownModel? selectedSubCategory;

  Future<void> getInitData() async {
    await getSuperCategories();
  }

  List<CategoryModel> _superCategories = [];
  List<AgroDropdownModel> get superCategories => _superCategories
      .map((model) => AgroDropdownModel(
            id: model.id,
            text: model.name,
            value: model,
          ))
      .toList();

  List<AgroDropdownModel>? subCategories;

  setSuperCategory(value) async {
    selectedSuperCategory = value;
    await getSubCategories(selectedSuperCategory!.id);
    selectedSubCategory = null;

    notifyListeners();
  }

  setSubCategory(value) {
    selectedSubCategory = value;
  }

  getSuperCategories() async {
    _superCategories = await CategoryService.getSuperCategories();
  }

  getSubCategories(String categoryId) async {
    List<CategoryModel> subCategoriesTemp =
        await CategoryService.getSubCategoriesById(categoryId);
    subCategories = subCategoriesTemp
        .map((model) => AgroDropdownModel(
              id: model.id,
              text: model.name,
              value: model,
            ))
        .toList();
    notifyListeners();
  }

  setFilter() {
    productFilter.category = selectedSubCategory?.value;
    productFilter.superCategory = selectedSuperCategory?.value;
    productFilter.fromPrice = fromPriceController.text.isNotEmpty
        ? double.parse(fromPriceController.text)
        : null;
    productFilter.toPrice = toPriceController.text.isNotEmpty
        ? double.parse(toPriceController.text)
        : null;

    productFilter.hasDiscount = hasDiscount;
  }

  resetFilter() {
    fromPriceController.text = "";
    toPriceController.text = "";
    hasDiscount = false;
    selectedSuperCategory = null;
    selectedSubCategory = null;
    subCategories = [];
    notifyListeners();
  }

  enableButton() {}
}
