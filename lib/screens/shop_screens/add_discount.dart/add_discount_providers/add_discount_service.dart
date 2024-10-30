import 'dart:developer';

import 'package:eagro/helpers/datetime_parser.dart';

import '/helpers/http_api.dart';
import '/models/products_model/product_discount.dart';

class DiscountService {
  static Future<bool> updateDiscount({
    required String productUuid,
    required ProductDiscountModel productDiscount,
  }) async {
   
    bool success = false;
    log('--------------$productUuid------------DEV LOG--------------------------');
    log('-------------${DateTimeParser.toDashDate(productDiscount.from)}-------------DEV LOG--------------------------');
    log('---------${DateTimeParser.toDashDate(productDiscount.to)}-----------------DEV LOG--------------------------');
    log('--------${productDiscount.percentage}------------------DEV LOG--------------------------');
    log('--------------------------DEV LOG--------------------------');
    try {
      final res = await HttpAPI.makeAPIcall(
        ApiMethod.put,
        'productDiscount/discount/updateDiscount/$productUuid',
        body: {
          "productId": productUuid,
         "from": DateTimeParser.toDashDate(productDiscount.from),
          "to": DateTimeParser.toDashDate(productDiscount.to),
          "percentage": productDiscount.percentage,
        },
      );
      success = res.success;
    } catch (e) {
      log("EXCEPTION updateDiscountTAG : $e");
    }
    return success;
  }

  static Future<bool> addDiscount({
    required String productUuid,
    required ProductDiscountModel productDiscount,
  }) async {
    bool success = false;
    try {
      final res = await HttpAPI.makeAPIcall(
        ApiMethod.post,
        'productDiscount/discount/addDiscount',
        body: {
          "productId": productUuid,
          "from": DateTimeParser.toDashDate(productDiscount.from),
          "to": DateTimeParser.toDashDate(productDiscount.to),
          "percentage": productDiscount.percentage,
        },
      );
      success = res.success;
    } catch (e) {
      log("EXCEPTION addDiscountTAG : $e");
    }
    return success;
  }

  static Future<bool> deleteDiscount(final String productUuid) async {
    bool success = false;
    try {
      final res = await HttpAPI.makeAPIcall(
        ApiMethod.delete,
        'productDiscount/discount/deleteDiscount/$productUuid',
      );
      success = res.success;
    } catch (e) {
      log('EXCEPTION: $e  deleteDiscountTAG');
    }
    return success;
  }
}
