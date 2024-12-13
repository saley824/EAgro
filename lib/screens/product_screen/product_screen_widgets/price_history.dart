import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '/helpers/datetime_parser.dart';
import '/widgets/divider/divider.dart';
import '../../../models/products_model/product_price_history.dart';

class PriceHistory extends StatelessWidget {
  final List<ProductPriceHistory>? productPriceHistory;
  const PriceHistory({super.key, this.productPriceHistory});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      width: 200,
      child: Column(
        children: [
          Text(
            "Istorija promjene cijene",
            style: textTheme.labelLarge,
          ),
          const Gap(24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Datum",
                style: textTheme.labelMedium,
              ),
              Text(
                "Cijena",
                style: textTheme.labelMedium,
              ),
            ],
          ),
          const Gap(12),
          const AgroDivider(margin: EdgeInsets.only(bottom: 12)),
          ...productPriceHistory!.map(
            (priceHistory) => Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      DateTimeParser.toClassicDate(priceHistory.changeDate),
                      style: textTheme.bodyLarge,
                    ),
                    Text(
                      priceHistory.newPrice.toString(),
                      style: textTheme.bodyLarge,
                    ),
                  ],
                ),
                const AgroDivider(margin: EdgeInsets.symmetric(vertical: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
