import 'package:eagro/screens/orders_screen/orders_providers/orders_service.dart';
import 'package:flutter/material.dart';

import '/models/cart_model/cart_model.dart';
import '/services/cart_service.dart';

class CartProvider extends ChangeNotifier {
  final String userUuid;
  CartModel? cart;

  CartProvider({required this.userUuid});

  fetchCart() async {
    cart = await CartService.getCart(userUuid);
  }

  void increment(
      {required String productUuid, required String isIncrement}) async {
    await CartService.increment(
        productUuid: productUuid, userUuid: userUuid, isIncrement: isIncrement);

    notifyListeners();
  }

  void removeCartItem({
    required String productUuid,
  }) async {
    bool success = await CartService.removeCartItem(
      productUuid: productUuid,
      userUuid: userUuid,
    );

    notifyListeners();
  }

  Future<bool> createOrder() async {
    bool success = await OrderService.createOrder(userId: userUuid);
    return success;
  }

  void clear() async {
    cart?.cartItemsDetails.clear();
    notifyListeners();
  }
}
