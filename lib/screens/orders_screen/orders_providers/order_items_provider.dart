import 'package:flutter/material.dart';

import '../../../models/cart_model/cart_item_model.dart';

class OrderItemsProvider extends ChangeNotifier {
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
