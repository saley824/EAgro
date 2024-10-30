import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../product_providers/product_provider.dart';

class Description extends StatelessWidget {
  const Description({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
      final productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Description",
            style: textTheme.labelMedium,
          ),
          const Gap(4),
          Text(
            productProvider.product?.description ?? "",
            style: textTheme.bodyMedium!.copyWith(),
          ),
        ],
      ),
    );
  }
}
