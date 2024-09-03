import 'dart:developer';

import '/screens/shop_screens/add_product/add_product_models/product_body_dto.dart';
import '../../../../helpers/http_api.dart';

class AddProductService {
  static Future<bool> addProduct(
    ProductBodyDto body,
  ) async {
    bool success = false;
    try {
      final res = await HttpAPI.makeAPIcall(ApiMethod.post, 'products/',
          body: body.toJson());
      success = res.success;
    } catch (e) {
      log("EXCEPTION addProductTAG : $e");
    }

    log(success.toString());
    return success;
  }

  static Future<bool> updateProduct(
      {required ProductBodyDto body, required String productUuid}) async {
    bool success = false;
    try {
      final res = await HttpAPI.makeAPIcall(
        ApiMethod.put,
        'products/$productUuid',
        body: body.toJson(),
      );
      success = res.success;
    } catch (e) {
      log("EXCEPTION updateProductTAG : $e");
    }

    log(success.toString());
    return success;
  }
}
