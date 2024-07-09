import 'dart:developer';

import '/models/products_model/product_discount.dart';

import '/helpers/http_api.dart';

class DiscountService {
  static Future<bool> updateDiscount({
    required String productUuid,
    required ProductDiscountModel productDiscount,
  }) async {
    bool success = false;
    try {
      final res = await HttpAPI.makeAPIcall(
        ApiMethod.put,
        'discount/updateDiscount/$productUuid',
        body: {
          "productId": productUuid,
          "from": productDiscount.from,
          "to": productDiscount.to,
          "percentage": productDiscount.percentage,
        },
      );
      success = res.success;
    } catch (e) {
      log("EXCEPTION updateDiscountTAG : $e");
    }
    return success;
  }

  static Future<bool> deleteDiscount(final String productUuid) async {
    bool success = false;
    try {
      final res = await HttpAPI.makeAPIcall(
        ApiMethod.delete,
        'discount/deleteDiscount/$productUuid',
      );
      success = res.success;
    } catch (e) {
      log('EXCEPTION: $e  deleteDiscountTAG');
    }
    return success;
  }
}
