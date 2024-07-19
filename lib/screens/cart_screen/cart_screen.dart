import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '/screens/cart_screen/cart_widgets/cart_item.dart';
import 'package:provider/provider.dart';

import 'cart_providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    return const Column(
      children: [
        Gap(40),
        CartItem(),
      ],
    );
  }
}
