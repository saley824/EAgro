import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../helpers/constants/custom_colors.dart';
import '../../../widgets/modals/agro_modal.dart';
import '../product_providers/product_provider.dart';
import 'price_history.dart';

class Price extends StatelessWidget {
  const Price({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    final textTheme = Theme.of(context).textTheme;
    return Row(
      children: [
        productProvider.product?.discountedPrice != null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      "${productProvider.product?.discountedPrice ?? "0.0"} KM",
                      style: textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: CustomColors.red[600],
                      )),
                  Text("${productProvider.product?.price ?? "0.0"} KM",
                      style: textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        decoration: TextDecoration.lineThrough,
                        color: CustomColors.gray[400],
                      )),
                ],
              )
            : Text(
                "${productProvider.product!.price} KM",
                style: textTheme.labelLarge,
              ),
        InkWell(
          onTap: () {
            AgroModal.showECommDialog(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                context: context,
                child: PriceHistory(
                  productPriceHistory:
                      productProvider.product!.productPriceHistory,
                ));
          },
          child: const Padding(
              padding: EdgeInsets.all(4), child: Icon(Icons.history_rounded)),
        )
      ],
    );
  }
}
