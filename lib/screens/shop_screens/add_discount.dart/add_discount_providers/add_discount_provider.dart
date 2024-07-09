import 'package:flutter/material.dart';

import '/models/products_model/product_discount.dart';
import 'add_discount_service.dart';

class AddDiscountProvider extends ChangeNotifier {
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
      productUuid: "6ac41b51-12b8-4d90-91ea-66aace421a0d",
      productDiscount: ProductDiscountModel(
          percentage: int.parse(percentageController.text),
          from: from!,
          to: to!),
    );
  }

//TODO ADD ID
  Future<bool> deleteDiscount() {
    return DiscountService.deleteDiscount("sss");
  }

  enableButton() {
    isButtonEnabled =
        from != null && to != null && percentageController.text.isNotEmpty;
    notifyListeners();
  }
}
