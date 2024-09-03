// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../providers/main_provider.dart';
import '../add_product_models/product_body_dto.dart';
import '/models/category_model/category_model.dart';
import '/screens/shop_screens/add_product/add_product_providers/add_product_service.dart';
import '/services/category_service.dart';
import '../../../../models/products_model/product_model.dart';
import '../../../../widgets/drop_down/drop_down_model/agro_dropdown_model.dart';

enum UnitType {
  LITER,
  KG,
  PIECE,
}

class AddProductProvider extends ChangeNotifier {
  final ProductModel? product;

  AddProductProvider(this.product) {
    if (product != null) {
      nameController.text = product!.name;
      descriptionController.text = product!.description;
      priceController.text = product!.price.toString();
      totalAmountController.text = product!.totalAmount.toString();
      quantityController.text = product!.quantity.toString();
    }

    //    id: model.id,
    // text: model.name,
    // value: model,
    // final descriptionController = TextEditingController();
    // final priceController = TextEditingController();
    // final totalAmountController = TextEditingController();
    // final quantityController = TextEditingController();
  }

  List<AgroDropdownModel> unitTypes = [
    AgroDropdownModel(
        id: UnitType.KG.name, text: UnitType.KG.name, value: UnitType.KG.name),
    AgroDropdownModel(
        id: UnitType.LITER.name,
        text: UnitType.LITER.name,
        value: UnitType.LITER.name),
    AgroDropdownModel(
      id: UnitType.PIECE.name,
      text: UnitType.PIECE.name,
      value: UnitType.PIECE.name,
    )
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

  setSuperCategory(value, bool notify) {
    selectedSuperCategory = value;
    getSubCategories(selectedSuperCategory!.id);
    selectedSubCategory = null;

    if (notify) {
      notifyListeners();
    }
  }

  setSubCategory(value) {
    selectedSubCategory = value;
    notifyListeners();
  }

  setUnit(value) {
    selectedUnit = value;
  }

  getSuperCategories() async {
    _superCategories = await CategoryService.getSuperCategories();

    if (product != null) {
      setSuperCategory(
          AgroDropdownModel(
              id: product!.category.superCategory?.id ?? "",
              value: product!.category.superCategory,
              text: product!.category.superCategory?.name ?? ""),
          false);

      setSubCategory(AgroDropdownModel(
          id: product!.category.id,
          value: product!.category,
          text: product!.category.name));

      setUnit(AgroDropdownModel(
          id: product!.unit ?? "",
          value: product!.unit ?? "",
          text: product!.unit ?? ""));

      notifyListeners();
      // selectedSuperCategory = AgroDropdownModel(
      //     id: product!.category.superCategory?.id ?? "",
      //     value: product!.category.superCategory,
      //     text: product!.category.superCategory?.name ?? "");
    }
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

  Future<bool> onAddOrEdit() async {
    ProductBodyDto productBodyDto = ProductBodyDto(
      categoryId: selectedSubCategory!.id,
      name: nameController.text,
      description: descriptionController.text,
      price: double.parse(priceController.text),
      totalAmount: int.parse(totalAmountController.text),
      quantity: double.parse(quantityController.text),
      unit: selectedUnit!.text,
    );
    return product != null
        ? await AddProductService.updateProduct(
            body: productBodyDto, productUuid: product?.id ?? '')
        : await AddProductService.addProduct(productBodyDto);
  }

  refreshData(BuildContext context) {
    context.read<MainProvider>().refresh();
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


