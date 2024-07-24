import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '/helpers/helper_functions.dart';
import '/screens/cart_screen/cart_widgets/cart_item.dart';
import '/widgets/buttons/agro_button.dart';
import '/widgets/divider/divider.dart';
import 'cart_providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: HelperFunctions.getSubAppBar(context, "Cart"),
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
        ),
        color: Colors.white,
        child: Column(
          children: [
            const Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Gap(8),
                    CartItem(),
                    Gap(12),
                    CartItem(),
                    CartItem(),
                    CartItem(),
                    CartItem(),
                    CartItem(),
                    CartItem(),
                    CartItem(),
                  ],
                ),
              ),
            ),
            const Gap(8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total price:",
                  style: textTheme.bodyMedium,
                ),
                Text(
                  "279,99KM",
                  style: textTheme.titleMedium,
                ),
              ],
            ),
            const Gap(8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Number of items:",
                  style: textTheme.bodyMedium,
                ),
                Text(
                  "10",
                  style: textTheme.titleMedium,
                ),
              ],
            ),
            const AgroDivider(margin: EdgeInsets.symmetric(vertical: 16)),
            AgroButton(
              text: "Finish",
              onTap: () {},
              buttonColor: ButtonColor.jadeGreen,
            )
          ],
        ),
      ),
    );
  }
}
