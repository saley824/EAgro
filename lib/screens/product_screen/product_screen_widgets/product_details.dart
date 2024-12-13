import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../product_providers/product_provider.dart';
import 'info_field.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    return Column(
      children: [
        InfoField(
            property: "Kategorija",
            value: productProvider.product!.category.name),
        const Gap(8),
        InfoField(
          property: "Dodano",
          value: productProvider.product!.createdAt.toString().substring(0, 10),
        ),
        const Gap(8),
        InfoField(
            property: "Trenutno na stanju",
            value: productProvider.product!.totalAmount.toString()),
        if (productProvider.product!.quantity != null) ...[
          const Gap(8),
          InfoField(
            property: "Količina",
            value:
                "${productProvider.product!.quantity} ${productProvider.product!.unit!}",
          ),
        ]
      ],
    );
  }
}
