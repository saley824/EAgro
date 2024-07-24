import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '/models/cart_model/cart_item_model.dart';
import '/screens/cart_screen/cart_providers/cart_provider.dart';
import '/screens/cart_screen/cart_widgets/minus_item.dart';
import '/screens/cart_screen/cart_widgets/plus_item.dart';
import '../../../helpers/constants/custom_colors.dart';
import '../../../widgets/products/discount_badge.dart';

class CartItem extends StatelessWidget {
  final bool isOrder;
  const CartItem({
    super.key,
    this.isOrder = true,
  });

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    CartItemModel cartItemModel = cartProvider.cartItem;
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(cartItemModel.name),
                        const Gap(4),
                        Text("Available: ${cartItemModel.totalAmount}",
                            style: textTheme.bodyMedium!.copyWith(
                              color: CustomColors.gray[400],
                            )),
                      ],
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.close,
                        color: CustomColors.gray[400],
                      ),
                    ),
                  ],
                ),
                const Gap(8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
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
                    Row(
                      children: [
                        MinusItem(
                          onTap: () {},
                        ),
                        const Gap(8),
                        Text(
                          "1",
                          style: textTheme.bodyLarge,
                        ),
                        const Gap(8),
                        PlusItem(
                          onTap: () {},
                        ),
                        const Gap(8)
                      ],
                    ),
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
              ],
            ),
          ),
        )
      ],
    );
  }
}
