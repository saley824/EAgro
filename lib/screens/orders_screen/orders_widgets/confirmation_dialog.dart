import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:eagro/helpers/helper_functions.dart';
import 'package:eagro/helpers/snack_bar_messages.dart';
import 'package:eagro/widgets/buttons/agro_button.dart';
import 'package:provider/provider.dart';

import '../../../providers/main_provider.dart';
import '../orders_models/order_model.dart';
import '../orders_providers/order_provider.dart';

class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog({
    super.key,
    required this.order,
  });
  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    bool isShop = context.read<MainProvider>().user?.isShop ?? false;
    final orderProvider = context.read<OrdersProvider>();

    return Column(
      children: [
        Text(
          textAlign: TextAlign.center,
          "Change order status",
          style: textTheme.headlineSmall,
        ),
        const Gap(16),
        Text(
          isShop
              ? "What do you want to do with the new order?"
              : "Do you want to mark the order as finished?",
          style: textTheme.bodyLarge,
        ),
        const Gap(16),
        Row(
          children: [
            if (isShop) ...[
              Flexible(
                child: AgroButton(
                  onTap: () {
                    bool success = false;
                    HelperFunctions.callMethodWithLoadingDialog(
                        context: context,
                        callback: () async {
                          success = await orderProvider.changeOrderStatus(
                              "SENT", order.id);
                        },
                        onFinished: () {
                          if (success) {
                            SnackBarMessage.showMessage(
                              context: context,
                              text: "Order is sent!",
                              isError: false,
                            );
                            Navigator.of(context).pop();
                          }
                        });
                  },
                  text: "Send",
                  buttonColor: ButtonColor.yellow,
                ),
              ),
              const Gap(12),
              Flexible(
                child: AgroButton(
                  onTap: () {
                    bool success = false;
                    HelperFunctions.callMethodWithLoadingDialog(
                        context: context,
                        callback: () async {
                          success = await orderProvider.changeOrderStatus(
                              "REJECTED", order.id);
                        },
                        onFinished: () {
                          if (success) {
                            SnackBarMessage.showMessage(
                              context: context,
                              text: "Order is rejected!",
                              isError: false,
                            );
                            Navigator.of(context).pop();
                          }
                        });
                  },
                  text: "Reject",
                  buttonColor: ButtonColor.red,
                ),
              ),
            ] else
              Flexible(
                child: AgroButton(
                  onTap: () {
                    bool success = false;
                    HelperFunctions.callMethodWithLoadingDialog(
                        context: context,
                        callback: () async {
                          success = await orderProvider.changeOrderStatus(
                              "FINISHED", order.id);
                        },
                        onFinished: () {
                          if (success) {
                            SnackBarMessage.showMessage(
                              context: context,
                              text: "Order is finished!",
                              isError: false,
                            );
                            Navigator.of(context).pop();
                          }
                        });
                  },
                  text: "Finish",
                  buttonColor: ButtonColor.blue,
                ),
              ),
          ],
        )
      ],
    );
  }
}
