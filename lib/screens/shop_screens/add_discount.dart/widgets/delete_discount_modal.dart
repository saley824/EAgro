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
          "Jeste li sigurni da želite obrisati sniženje na ${product?.name}?",
          style: textTheme.labelLarge,
        ),
        const Gap(16),
        AgroButton(
          onTap: onTap,
          text: "Ukloni sniženje",
          buttonColor: ButtonColor.red,
        ),
      ],
    );
  }
}
