import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '/helpers/datetime_parser.dart';
import '/screens/orders_screen/orders_providers/order_items_provider.dart';
import '/screens/orders_screen/orders_widgets/orders_items_screen.dart';
import '../../../helpers/constants/custom_colors.dart';
import '../../../providers/main_provider.dart';
import '../../../widgets/modals/agro_modal.dart';
import '../orders_models/order_model.dart';
import '../orders_providers/order_provider.dart';
import 'confirmation_dialog.dart';
import 'order_status_badge.dart';

class SingleOrder extends StatelessWidget {
  const SingleOrder({
    super.key,
    required this.order,
  });
  final OrderModel order;
  @override
  Widget build(BuildContext context) {
    bool isShop = context.read<MainProvider>().user?.isShop ?? false;
    final orderProvider = context.read<OrdersProvider>();

    final textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
            create: (context) => OrderItemsProvider(),
            child: OrderItemsScreen(
              order: order,
            ),
          ),
        ));
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: CustomColors.gray[950]!.withOpacity(0.08),
          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: CustomColors.gray.withOpacity(0.06),
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
            BoxShadow(
              color: CustomColors.gray.withOpacity(0.1),
              blurRadius: 3,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Column(
          children: [
            if (isShop) ...[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Buyer name",
                    style: textTheme.labelLarge,
                  ),
                  const Gap(8),
                  Flexible(
                    child: Text(
                      "${order.user?.name ?? ""} ${order.user?.lastName ?? ""}",
                      style: textTheme.bodyLarge,
                    ),
                  ),
                ],
              ),
      
              if(order.user?.address != null)...[
                    const Gap(16),     Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    textAlign: TextAlign.right,
                    "Buyer address",
                    style: textTheme.labelLarge,
                  ),
                  const Gap(60),
                  Flexible(
                    child: Text(
                      order.user?.address.toString()  ?? "",
                      style: textTheme.bodyLarge,
                    ),
                  ),
                ],
              ),
              ]
          ,
              const Gap(16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Buyer email",
                    style: textTheme.labelLarge,
                  ),
                  const Gap(8),
                  Flexible(
                    child: Text(
                      order.user?.email.toString() ?? "",
                      style: textTheme.bodyLarge,
                    ),
                  ),
                ],
              ),
              const Gap(16),
            ],
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total price",
                  style: textTheme.labelLarge,
                ),
                const Gap(8),
                Text(
                  order.totalPrice.toString(),
                  style: textTheme.bodyLarge,
                ),
              ],
            ),
            const Gap(16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _getDesc(order),
                  style: textTheme.labelLarge,
                ),
                const Gap(8),
                Text(
                  DateTimeParser.toClassicDate(_getDate(order)),
                  style: textTheme.bodyLarge,
                ),
              ],
            ),
            const Gap(16),
            InkWell(
              onTap: () {
                if (order.status == "NEW" && isShop) {
                  AgroModal.showECommDialog(
                    padding: const EdgeInsets.symmetric(
                        vertical: 24, horizontal: 24),
                    context: context,
                    child: ChangeNotifierProvider.value(
                        value: orderProvider,
                        child: ConfirmationDialog(
                          order: order,
                        )),
                  );
                }
                if (order.status == "SENT" && !isShop) {
                  AgroModal.showECommDialog(
                      padding: const EdgeInsets.symmetric(
                          vertical: 24, horizontal: 24),
                      context: context,
                      child: ChangeNotifierProvider.value(
                          value: orderProvider,
                          child: ConfirmationDialog(
                            order: order,
                          )));
                }
              },
              child: OrderStatusBadge(
                orderStatus: _getValue(order),
              ),
            ),
          ],
        ),
      ),
    );
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

  String _getDesc(OrderModel order) {
    String? desc;
    switch (order.status) {
      case "NEW":
        desc = "Create date";
        break;
      case "SENT":
        desc = "Sent date";
        break;
      case "FINISHED":
        desc = "Finished date";
        break;
      case "REJECTED":
        desc = "Rejected date";
        break;
      default:
    }

    return desc!;
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
}
