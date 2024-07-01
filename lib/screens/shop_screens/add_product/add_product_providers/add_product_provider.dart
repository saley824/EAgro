// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

import '../../../../widgets/drop_down/drop_down_model/agro_dropdown_model.dart';
import '/models/category_model/category_model.dart';
import '/screens/shop_screens/add_product/add_product_providers/add_product_service.dart';
import '/services/category_service.dart';

enum UnitType {
  LITER,
  KG,
  PIECE,
}

class AddProductProvider extends ChangeNotifier {
  List<AgroDropdownModel> unitTypes = [
    AgroDropdownModel(id: "1", text: UnitType.KG.name, value: UnitType.KG),
    AgroDropdownModel(
        id: "2", text: UnitType.LITER.name, value: UnitType.LITER),
    AgroDropdownModel(id: "3", text: UnitType.PIECE.name, value: UnitType.PIECE)
  ];

  Future<void> getInitData() async {
    await getSuperCategories();
  }

  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  final totalAmountController = TextEditingController();
  final quantityController = TextEditingController();

  AgroDropdownModel? selectedSuperCategory;
  AgroDropdownModel? selectedSubCategory;

  AgroDropdownModel? selectedUnit;

  List<CategoryModel> _superCategories = [];
  List<AgroDropdownModel> get superCategories => _superCategories
      .map((model) => AgroDropdownModel(
            id: model.id,
            text: model.name,
            value: model,
          ))
      .toList();

  List<AgroDropdownModel>? subCategories;

  setSuperCategory(value) {
    selectedSuperCategory = value;
    getSubCategories(selectedSuperCategory!.id);
    selectedSubCategory = null;

    notifyListeners();
  }

  setSubCategory(value) {
    selectedSubCategory = value;
  }

  setUnit(value) {
    selectedUnit = value;
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

  Future<bool> addProduct() async {
    return await AddProductService.addProduct(
      categoryId: selectedSubCategory!.id,
      name: nameController.text,
      description: descriptionController.text,
      price: double.parse(priceController.text),
      totalAmount: int.parse(totalAmountController.text),
      quantity: double.parse(quantityController.text),
      unit: selectedUnit!.text,
    );
  }
}

// void enableButton() {
//   if (nameController.text.isNotEmpty &&
//       descriptionController.text.isNotEmpty &&
//       priceController.text.isNotEmpty &&
//       quantityController.text.isNotEmpty &&
//       emailController.text.isNotEmpty &&
//       arePasswordMatched()) {
//     isButtonEnabled = true;
//     notifyListeners();
//     return;
//   }
//   isButtonEnabled = false;
//   notifyListeners();
// }

// bool arePasswordMatched() {
//   return passwordController.text == confirmPasswordController.text;
// }


