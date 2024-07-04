import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:msan/widgets/products/discount_badge.dart';

import '/helpers/constants/custom_colors.dart';

class ProductPreview extends StatelessWidget {
  final bool hasDiscount;
  final int? discountPercentage;
  const ProductPreview({
    super.key,
    this.hasDiscount = false,
    this.discountPercentage,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      width: 152,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
            decoration: BoxDecoration(
              color: CustomColors.productPreviewBgColor.withOpacity(0.6),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                if (hasDiscount) ...[
                  const Gap(4),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      DiscountBadge(),
                    ],
                  ),
                  const Gap(4)
                ] else
                  const Gap(32),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 8, 32),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    child: Image.network(
                      height: 120,
                      width: 120,
                      "https://images.pexels.com/photos/90946/pexels-photo-90946.jpeg",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Gap(4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text("AirPods",
                    style: textTheme.bodyMedium!
                        .copyWith(color: CustomColors.gray[500])),
              ),
              Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.star,
                      size: 16,
                      color: CustomColors.yellow[500],
                    ),
                    const Gap(2),
                    Flexible(child: Text("4.9", style: textTheme.bodyLarge!)),
                  ],
                ),
              ),
            ],
          ),
          const Gap(4),
          !hasDiscount
              ? Text("132.00 KM",
                  style: textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ))
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("99.99 KM",
                        style: textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: CustomColors.red[600],
                        )),
                    Text("132.00 KM",
                        style: textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          decoration: TextDecoration.lineThrough,
                          color: CustomColors.gray[400],
                        )),
                  ],
                )
        ],
      ),
    );
  }
}
