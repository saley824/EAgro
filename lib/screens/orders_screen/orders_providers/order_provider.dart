import 'package:flutter/material.dart';
import 'package:msan/screens/orders_screen/orders_providers/orders_service.dart';

import '../orders_models/order_model.dart';

class OrdersProvider extends ChangeNotifier {
  final String userId;
  List<OrderModel> orders = [];

  OrdersProvider({required this.userId});

  Future<void> getOrders() async {
    orders = await OrderService.getOrders(userId);
  }

  Future<bool> changeOrderStatus(String orderStatus, String orderId) async {
    bool success = await OrderService.changeOrderStatus(
        orderId: orderId, orderStatus: orderStatus);
    notifyListeners();
    return success;
  }
}
