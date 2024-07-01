import 'dart:developer';

import '/helpers/http_api.dart';

class DiscountService {
  static Future<bool> updateDiscount({
    required String productUuid,
    required DateTime from,
    required DateTime to,
    required int percentage,
  }) async {
    bool success = false;
    try {
      final res = await HttpAPI.makeAPIcall(
        ApiMethod.put,
        'discount/updateDiscount/$productUuid',
        body: {
          "productId": productUuid,
          "from": from,
          "to": to,
          "percentage": percentage,
        },
      );
      success = res.success;
    } catch (e) {
      log("EXCEPTION updateDiscountTAG : $e");
    }
    return success;
  }
}
