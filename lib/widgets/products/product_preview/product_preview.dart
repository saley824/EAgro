import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../helpers/constants/custom_colors.dart';

class ProductPreview extends StatelessWidget {
  final bool hasDiscount;
  const ProductPreview({
    super.key,
    this.hasDiscount = false,
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
            padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
            decoration: BoxDecoration(
              color: CustomColors.productPreviewBgColor.withOpacity(0.6),
              borderRadius: BorderRadius.circular(8),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              child: Image.network(
                height: 120,
                width: 120,
                "https://firebasestorage.googleapis.com/v0/b/diplomski-fc1d8.appspot.com/o/images%2Ftatum.jpg?alt=media&token=1711d5da-9eac-4d98-a576-693958a84d0a",
                fit: BoxFit.fill,
              ),
            ),
          ),
          const Gap(4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text("AirPods",
                    style: textTheme.bodyMedium!
                        .copyWith(color: CustomColors.gray[400])),
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
