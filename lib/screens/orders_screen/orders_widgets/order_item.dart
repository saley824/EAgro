import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:msan/screens/orders_screen/orders_providers/order_items_provider.dart';
import 'package:provider/provider.dart';

import '/models/cart_model/cart_item_model.dart';
import '../../../helpers/constants/custom_colors.dart';
import '../../../widgets/products/discount_badge.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final orderProvider =
        Provider.of<OrderItemsProvider>(context, listen: false);
    CartItemModel cartItemModel = orderProvider.cartItem;
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
              if (cartItemModel.discountedPrice != null) ...[
                const Gap(4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    DiscountBadge(
                      percentage: cartItemModel.percentage!,
                    ),
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
                    height: 80,
                    width: 100,
                    "https://images.pexels.com/photos/90946/pexels-photo-90946.jpeg",
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
                    Text(cartItemModel.name),
                    const Gap(4),
                  ],
                ),
                const Gap(8),
                cartItemModel.discountedPrice == null
                    ? Text("${cartItemModel.price} KM",
                        style: textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                        ))
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${cartItemModel.discountedPrice} KM",
                              style: textTheme.bodyLarge!.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: CustomColors.red[600],
                              )),
                          Text("${cartItemModel.price} KM",
                              style: textTheme.bodyLarge!.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                                decoration: TextDecoration.lineThrough,
                                color: CustomColors.gray[400],
                              )),
                        ],
                      ),
                const Gap(8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Cart item price:",
                      style: textTheme.bodySmall,
                    ),
                    Text(
                      "279,99KM",
                      style: textTheme.titleSmall,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Quantity",
                      style: textTheme.bodySmall,
                    ),
                    Text(
                      "279,99KM",
                      style: textTheme.titleSmall,
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
