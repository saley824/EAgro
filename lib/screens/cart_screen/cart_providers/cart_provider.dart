import 'package:flutter/material.dart';
import 'package:msan/models/cart_model/cart_item_model.dart';
import 'package:msan/models/products_model/product_model.dart';

class CartProvider extends ChangeNotifier {
  CartItemModel cartItem = CartItemModel(
      name: "XBOX",
      productId: "aaa",
      quantity: 3,
      totalAmount: 22,
      price: 11.99,
      discountedPrice: 10.00,
      cartItemTotalPrice: 30);
}
