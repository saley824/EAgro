import 'dart:developer';

import '../../../helpers/http_api.dart';
import '../orders_models/order_model.dart';

class OrderService {
  static Future<List<OrderModel>> getOrders(String userId) async {
    List<OrderModel> orders = [];
    try {
      final res = await HttpAPI.makeAPIcall(
        ApiMethod.get,
        'orders/$userId',
      );

      for (var element in (res.responseData["order"])) {
        orders.add(OrderModel.fromJson(element));
      }
    } catch (e) {
      log('EXCEPTION: $e  getOrdersTAG');
    }
    return orders;
  }
}
