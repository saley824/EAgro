import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '/models/products_model/product_model.dart';
import '/widgets/buttons/agro_button.dart';

class DeleteDiscountModal extends StatelessWidget {
  final ProductModel? product;
  final VoidCallback? onTap;

  const DeleteDiscountModal({
    super.key,
    this.product,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        Text(
          "Are you sure you want to delete ${product?.name} discount?",
          style: textTheme.labelLarge,
        ),
        const Gap(16),
        AgroButton(
          onTap: onTap,
          text: "Delete discount",
          buttonColor: ButtonColor.red,
        ),
      ],
    );
  }
}
