import 'package:flutter/material.dart';

import '/models/cart_model/cart_item_model.dart';
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
    await CartService.removeCartItem(
      productUuid: productUuid,
      userUuid: userUuid,
    );

    notifyListeners();
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
