import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '/helpers/navigator_helper.dart';

import '/helpers/helper_functions.dart';
import '/services/product_service.dart';
import '/widgets/buttons/agro_button.dart';
import '/helpers/snack_bar_messages.dart';
import '/models/products_model/product_model.dart';

class DeleteProductModal extends StatelessWidget {
  final ProductModel? product;
  const DeleteProductModal({super.key, this.product});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Text(
          "Are you sure you want to delete ${product?.name}?",
          style: textTheme.labelLarge,
        ),
        const Gap(16),
        AgroButton(
          onTap: () {
            bool success = false;

            HelperFunctions.callMethodWithLoadingDialog(
                context: context,
                callback: () async {
                  success =
                      await ProductService.deleteProductById(product?.id ?? "");
                },
                onFinished: () {
                  if (success) {
                    SnackBarMessage.showMessage(
                        context: context,
                        text: "${product?.name} is successfully deleted",
                        isError: false);

                    NavigatorHelper.navigateToHome(context);
                  }
                });
          },
          text: "Delete",
          buttonColor: ButtonColor.red,
        ),
      ],
    );
  }
}
