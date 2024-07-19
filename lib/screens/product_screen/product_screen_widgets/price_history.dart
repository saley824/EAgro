import 'package:flutter/material.dart';
import 'package:msan/helpers/datetime_parser.dart';
import 'package:msan/widgets/divider/divider.dart';

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
            "History of price changes",
            style: textTheme.labelLarge,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Date",
                style: textTheme.labelMedium,
              ),
              Text(
                "Price",
                style: textTheme.labelMedium,
              ),
            ],
          ),
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
