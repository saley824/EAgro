import 'package:flutter/material.dart';
import 'package:eagro/screens/orders_screen/orders_providers/orders_service.dart';

import '../../../models/cart_model/cart_item_model.dart';
import '../orders_models/order_item_model.dart';

class OrderItemsProvider extends ChangeNotifier {
  List<OrderItemModel> orderItems = [];
  Future<void> getOrderItems(int orderId) async {
    orderItems = await OrderService.getOrderItems(orderId);
  }

  CartItemModel cartItem = CartItemModel(
    name: "XBOX",
    productId: "aaa",
    quantity: 3,
    totalAmount: 22,
    price: 11.99,
    discountedPrice: 10.00,
    cartItemTotalPrice: 30,
    percentage: 15,
    image: null,
  );
}
