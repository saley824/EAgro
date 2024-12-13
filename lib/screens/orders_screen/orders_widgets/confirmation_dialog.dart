import 'package:flutter/material.dart';
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
          "Promijeni stanje narudžbe",
          style: textTheme.headlineSmall,
        ),
        const Gap(16),
        Text(
          isShop
              ? "Šta želite da uradite sa narudžbom?"
              : "Da li želite da označite narudžbu kao dostavljenu?",
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
                              text: "Narudžba je poslana!",
                              isError: false,
                            );
                            Navigator.of(context).pop();
                          }
                        });
                  },
                  text: "Označi kao poslanu",
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
                              text: "Narudžba je odbijena!",
                              isError: false,
                            );
                            Navigator.of(context).pop();
                          }
                        });
                  },
                  text: "Odbij",
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
                              text: "Narudžba je dostavljena!",
                              isError: false,
                            );
                            Navigator.of(context).pop();
                          }
                        });
                  },
                  text: "Označi kao dostavljenu",
                  buttonColor: ButtonColor.blue,
                ),
              ),
          ],
        )
      ],
    );
  }
}
