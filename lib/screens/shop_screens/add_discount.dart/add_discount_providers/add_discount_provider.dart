import 'package:flutter/material.dart';
import 'package:eagro/providers/main_provider.dart';
import 'package:eagro/screens/product_screen/product_providers/product_provider.dart';
import 'package:provider/provider.dart';

import '/models/products_model/product_discount.dart';
import '../../../../models/products_model/product_model.dart';
import 'add_discount_service.dart';

class AddDiscountProvider extends ChangeNotifier {
  final ProductModel product;

  AddDiscountProvider(
    this.product,
  ) {
    from = product.productDiscount?.from;
    to = product.productDiscount?.to;
    percentageController.text =
        product.productDiscount?.percentage.toString() ?? "";
  }
  DateTime? from;
  DateTime? to;
  final percentageController = TextEditingController();
  bool isButtonEnabled = false;

  setFrom(value) {
    from = value;
    notifyListeners();
  }

  setTo(value) {
    to = value;
  }

  Future<bool> updateDiscount() {
    return DiscountService.updateDiscount(
      productUuid: product.id,
      productDiscount: ProductDiscountModel(
          percentage: int.parse(percentageController.text),
          from: from!,
          to: to!),
    );
  }

  Future<bool> addDiscount() async {
    bool success = await DiscountService.addDiscount(
      productUuid: product.id,
      productDiscount: ProductDiscountModel(
          percentage: int.parse(percentageController.text),
          from: from!,
          to: to!),
    );

    if (success) {}
    return success;
  }

  Future<bool> onActionDiscount() async {
    return product.productDiscount != null
        ? await updateDiscount()
        : await addDiscount();
  }

//TODO ADD ID
  Future<bool> deleteDiscount() {
    return DiscountService.deleteDiscount(product.id);
  }

  enableButton() {
    isButtonEnabled =
        from != null && to != null && percentageController.text.isNotEmpty;
    notifyListeners();
  }

  refreshData(BuildContext context) {
    context.read<ProductProvider>().refresh();
    context.read<MainProvider>().refresh();
  }
}
