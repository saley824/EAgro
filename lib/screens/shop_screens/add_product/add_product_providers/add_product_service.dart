import 'dart:developer';

import '../../../../helpers/http_api.dart';

class AddProductService {
  static Future<bool> addProduct({
    required String categoryId,
    required String name,
    required String description,
    required double price,
    required int totalAmount,
    required double quantity,
    required String unit,
  }) async {
    bool success = false;
    try {
      final res = await HttpAPI.makeAPIcall(
        ApiMethod.post,
        'products/',
        body: {
          "name": name,
          "categoryId": categoryId,
          "description": description,
          "price": price,
          "totalAmount": totalAmount,
          "unit": unit,
          "quantity": quantity,
        },
      );
      success = res.success;
    } catch (e) {
      log("EXCEPTION addProductTAG : $e");
    }

    log(success.toString());
    return success;
  }

  static Future<bool> updateProduct({
    required String productId,
    required String categoryId,
    required String name,
    required String description,
    required double price,
    required int totalAmount,
    required double quantity,
    required String unit,
  }) async {
    bool success = false;
    try {
      final res = await HttpAPI.makeAPIcall(
        ApiMethod.post,
        'products/$productId',
        body: {
          "name": name,
          "categoryId": categoryId,
          "description": description,
          "price": price,
          "totalAmount": totalAmount,
          "unit": unit,
          "quantity": quantity,
        },
      );
      success = res.success;
    } catch (e) {
      log("EXCEPTION updateProductTAG : $e");
    }

    log(success.toString());
    return success;
  }
}
