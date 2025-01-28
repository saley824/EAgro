import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:eagro/screens/orders_screen/orders_models/order_item_model.dart';

import '../../../helpers/constants/custom_colors.dart';

class OrderItem extends StatelessWidget {
  final OrderItemModel orderItem;
  const OrderItem({
    super.key,
    required this.orderItem,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
          decoration: BoxDecoration(
            color: CustomColors.productPreviewBgColor.withOpacity(0.6),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Gap(32),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 8, 32),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  child: CachedNetworkImage(
                    //todo sasa
                    imageUrl:
                        // "https://t4.ftcdn.net/jpg/07/23/14/93/360_F_723149335_tA0Fo8zefrHzYlSgXRMYHmBQk7CuWrRd.jpg",
                        orderItem.img ?? "",
                    errorWidget: (context, error, stackTrace) {
                      return const SizedBox(
                        height: 80,
                        width: 100,
                        child: Icon(Icons.photo),
                      );
                    },
                    height: 80,
                    width: 100,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
        ),
        const Gap(4),
        Expanded(
          child: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      orderItem.name,
                      style: textTheme.labelLarge
                          ?.copyWith(fontWeight: FontWeight.w600),
                    ),
                    const Gap(4),
                  ],
                ),
                const Gap(8),
                orderItem.discountedPrice == null
                    ? Text("${orderItem.price} KM",
                        style: textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ))
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${orderItem.discountedPrice} KM",
                              style: textTheme.bodyLarge!.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: CustomColors.red[600],
                              )),
                          Text("${orderItem.price} KM",
                              style: textTheme.bodyLarge!.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                decoration: TextDecoration.lineThrough,
                                color: CustomColors.gray[400],
                              )),
                        ],
                      ),
                orderItem.discountedPrice == null
                    ? const Gap(24)
                    : const Gap(8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Cijena stavke:",
                      style: textTheme.bodyMedium,
                    ),
                    Text(
                      orderItem.totalPrice.toString(),
                      style: textTheme.titleMedium,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Količina",
                      style: textTheme.bodyMedium,
                    ),
                    Text(
                      orderItem.quantity.toString(),
                      style: textTheme.titleMedium,
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
