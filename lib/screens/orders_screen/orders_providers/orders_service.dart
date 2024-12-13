import 'dart:developer';

import 'package:eagro/models/category_model/category_model.dart';
import 'package:eagro/screens/orders_screen/orders_models/order_item_model.dart';

import '../../../helpers/http_api.dart';
import '../orders_models/most_used_category_model.dart';
import '../orders_models/order_model.dart';

class OrderService {
  static Future<List<OrderModel>> getOrders(String userId, bool isShop) async {
    List<OrderModel> orders = [];
    try {
      final res = isShop
          ? await HttpAPI.makeAPIcall(
              ApiMethod.get,
              'orders/',
            )
          : await HttpAPI.makeAPIcall(
              ApiMethod.get,
              'orders/?userId=$userId',
            );

      if (res.success) {
        for (var element in (res.responseData["order"])) {
          orders.add(OrderModel.fromJson(element));
        }
      }
    } catch (e) {
      log('EXCEPTION: $e  getOrdersTAG');
    }
    return orders;
  }

  static Future<bool> changeOrderStatus({
    required final int orderId,
    required final String orderStatus,
  }) async {
    bool success = false;
    try {
      final res = await HttpAPI.makeAPIcall(
        ApiMethod.put,
        'orders/changeStatus',
        body: {
          "orderId": orderId,
          "orderStatus": orderStatus,
        },
      );
      success = res.success;
    } catch (e) {
      log('EXCEPTION: $e  changeOrderStatusTAG');
    }
    return success;
  }

  static Future<List<OrderItemModel>> getOrderItems(int orderId) async {
    List<OrderItemModel> orders = [];
    try {
      final res = await HttpAPI.makeAPIcall(
        ApiMethod.get,
        'orders/orderItems/$orderId',
      );

      if (res.success) {
        for (var element in (res.responseData["orderItems"])) {
          orders.add(OrderItemModel.fromJson(element));
        }
      }
    } catch (e) {
      log('EXCEPTION: $e  getOrderItemsTAG');
    }
    return orders;
  }

  static Future<bool> createOrder({
    required final String userId,
  }) async {
    bool success = false;
    try {
      final res = await HttpAPI.makeAPIcall(
        ApiMethod.post,
        'orders/createOrder/$userId',
      );
      success = res.success;
    } catch (e) {
      log('EXCEPTION: $e  createOrderTAG');
    }
    return success;
  }

    static Future<CategoryModel?> getMostUsedCategory(String userId) async {
     CategoryModel? category;

    try {
      final res = await HttpAPI.makeAPIcall(
        ApiMethod.get,
        'orders/mostUsedCategory/$userId',
      );

      category = CategoryModel.fromJson(res.responseData);
    } catch (e) {
      log('EXCEPTION: $e  getMostUsedCategory');
    }
    return category;
  }
}
