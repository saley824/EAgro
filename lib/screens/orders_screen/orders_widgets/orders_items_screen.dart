import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:msan/screens/orders_screen/orders_providers/order_items_provider.dart';
import 'package:provider/provider.dart';

import '/helpers/helper_functions.dart';
import '/widgets/divider/divider.dart';
import 'order_item.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ordersProvider =
        Provider.of<OrderItemsProvider>(context, listen: false);
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: HelperFunctions.getSubAppBar(context, "Order"),
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
                    OrderItem(),
                    OrderItem(),
                    OrderItem(),
                    OrderItem(),
                    OrderItem(),
                    OrderItem(),
                    OrderItem(),
                    OrderItem(),
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
          ],
        ),
      ),
    );
  }
}
