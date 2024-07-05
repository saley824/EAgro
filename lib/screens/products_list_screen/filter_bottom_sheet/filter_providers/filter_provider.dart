import 'package:flutter/material.dart';

import '../../../../models/category_model/category_model.dart';
import '../../../../services/category_service.dart';
import '../../../../widgets/drop_down/drop_down_model/agro_dropdown_model.dart';

class FilterProvider extends ChangeNotifier {
  final fromPriceController = TextEditingController();
  final toPriceController = TextEditingController();

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

  enableButton() {}
}
