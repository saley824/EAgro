import 'package:flutter/material.dart';
import 'package:eagro/screens/orders_screen/orders_providers/orders_service.dart';

import '../orders_models/order_model.dart';

class OrdersProvider extends ChangeNotifier {
  final String userId;
  final bool isShop;
  List<OrderModel> orders = [];

  OrdersProvider({
    required this.userId,
    required this.isShop,
  });

  Future< List<OrderModel>> getOrders() async {
    orders = await OrderService.getOrders(userId, isShop);
    return orders;
  }

  Future<bool> changeOrderStatus(String orderStatus, String orderId) async {
    bool success = await OrderService.changeOrderStatus(
        orderId: orderId, orderStatus: orderStatus);
    notifyListeners();
    return success;
  }
}
