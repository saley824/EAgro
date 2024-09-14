import 'package:flutter/material.dart';
import 'package:eagro/widgets/no_results.dart';
import 'package:provider/provider.dart';

import '/helpers/helper_functions.dart';
import '/screens/orders_screen/orders_providers/order_provider.dart';
import '/widgets/loading_indicator/agro_loading_indicator.dart';
import 'orders_widgets/single_order.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orderProvider = context.read<OrdersProvider>();
    return Scaffold(
      appBar: HelperFunctions.getSubAppBar(context:  context, title:  "Orders"),
      body: Consumer<OrdersProvider>(
        builder: (_, __, ___) => FutureBuilder(
            future: orderProvider.getOrders(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const AgroLoadingIndicator();
              } else if (snapshot.data?.isEmpty ?? false) {
                return const NoResults(text: "There are no orders!");
              } else {
                return SingleChildScrollView(
                  child: Container(
                    color: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    child: Column(
                      children: [
                        ...orderProvider.orders.map(
                          (order) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: SingleOrder(
                                order: order,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              }
            }),
      ),
    );
  }
}
