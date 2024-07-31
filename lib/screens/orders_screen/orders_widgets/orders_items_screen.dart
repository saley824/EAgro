import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '/helpers/datetime_parser.dart';
import '/helpers/helper_functions.dart';
import '/screens/orders_screen/orders_providers/order_items_provider.dart';
import '/widgets/loading_indicator/agro_loading_indicator.dart';
import '../orders_models/order_model.dart';
import 'order_item.dart';
import 'order_status_badge.dart';

class OrderItemsScreen extends StatelessWidget {
  final OrderModel order;

  const OrderItemsScreen({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final orderItemsProvider =
        Provider.of<OrderItemsProvider>(context, listen: false);
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: HelperFunctions.getSubAppBar(context, "Order"),
      body: FutureBuilder(
        future: orderItemsProvider.getOrderItems(order.id),
        builder: (context, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? const AgroLoadingIndicator()
            : Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 8,
                ),
                color: Colors.white,
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const Gap(8),
                            ...orderItemsProvider.orderItems.map(
                              (orderItem) {
                                return Padding(
                                    padding: const EdgeInsets.only(bottom: 12),
                                    child: OrderItem(orderItem: orderItem));
                              },
                            )
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
                          style: textTheme.bodyLarge,
                        ),
                        Text(
                          order.totalPrice.toString(),
                          style: textTheme.titleMedium,
                        ),
                      ],
                    ),
                    const Gap(12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Date",
                          style: textTheme.bodyLarge,
                        ),
                        Text(
                          DateTimeParser.toClassicDate(_getDate(order)),
                          style: textTheme.titleMedium,
                        ),
                      ],
                    ),
                    const Gap(8),
                    OrderStatusBadge(
                      orderStatus: _getValue(order),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  OrderStatus _getValue(OrderModel order) {
    OrderStatus? status;
    switch (order.status) {
      case "NEW":
        status = OrderStatus.NEW;
        break;
      case "SENT":
        status = OrderStatus.SENT;

        break;
      case "FINISHED":
        status = OrderStatus.FINISHED;

        break;
      case "REJECTED":
        status = OrderStatus.REJECTED;

        break;
      default:
    }

    return status!;
  }

  DateTime _getDate(OrderModel order) {
    DateTime? date;
    switch (order.status) {
      case "NEW":
        date = order.createdAt;
        break;
      case "SENT":
        date = order.sentTime;
        break;
      case "FINISHED":
        date = order.finishedTime;
        break;
      case "REJECTED":
        date = order.rejectedTime;
        break;
      default:
    }

    return date!;
  }
}
