import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:msan/models/cart_model/cart_item_model.dart';
import 'package:msan/screens/cart_screen/cart_providers/cart_provider.dart';
import 'package:provider/provider.dart';

import '../../../helpers/constants/custom_colors.dart';
import '../../../providers/main_provider.dart';
import '../../../widgets/products/discount_badge.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    CartItemModel cartItemModel = cartProvider.cartItem;
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
          decoration: BoxDecoration(
            color: CustomColors.productPreviewBgColor.withOpacity(0.6),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              if (cartItemModel.discountedPrice != null) ...[
                const Gap(4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    DiscountBadge(
                      percentage: product.productDiscount!.percentage,
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
      ],
    );
  }
}
