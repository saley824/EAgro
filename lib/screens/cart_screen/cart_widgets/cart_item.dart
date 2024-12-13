import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '/helpers/helper_functions.dart';
import '/models/cart_model/cart_item_model.dart';
import '/screens/cart_screen/cart_providers/cart_provider.dart';
import '/screens/cart_screen/cart_widgets/minus_item.dart';
import '/screens/cart_screen/cart_widgets/plus_item.dart';
import '../../../helpers/constants/custom_colors.dart';
import '../../../widgets/products/discount_badge.dart';

class CartItem extends StatelessWidget {
  final bool isOrder;
  final CartItemModel cartItemModel;
  const CartItem({
    super.key,
    this.isOrder = true,
    required this.cartItemModel,
  });

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);

    final textTheme = Theme.of(context).textTheme;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
          decoration: BoxDecoration(
            color: CustomColors.productPreviewBgColor.withOpacity(0.6),
            borderRadius: BorderRadius.circular(8),
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
                    errorBuilder: (context, error, stackTrace) {
                      return const SizedBox(
                        height: 100,
                        width: 100,
                        child: Icon(Icons.photo),
                      );
                    },
                    height: 100,
                    width: 100,
                    cartItemModel.image ?? "",
                    // "https://images.pexels.com/photos/90946/pexels-photo-90946.jpeg",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
        ),

        // Container(
        //   padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
        //   decoration: BoxDecoration(
        //     color: CustomColors.productPreviewBgColor.withOpacity(0.6),
        //     borderRadius: BorderRadius.circular(24),
        //   ),
        //   child: Column(
        //     children: [
        //       if (cartItemModel.discountedPrice != null) ...[
        //         const Gap(4),
        //         Row(
        //           mainAxisAlignment: MainAxisAlignment.end,
        //           children: [
        //             DiscountBadge(
        //               percentage: cartItemModel.percentage!,
        //             ),
        //           ],
        //         ),
        //         const Gap(4)
        //       ] else
        //         const Gap(32),
        //       Padding(
        //         padding: const EdgeInsets.fromLTRB(16, 0, 8, 32),
        //         child: ClipRRect(
        //           borderRadius: const BorderRadius.all(Radius.circular(8)),
        //           child: Image.network(
        //             errorBuilder: (context, error, stackTrace) {
        //               return const SizedBox(
        //                 height: 80,
        //                 width: 100,
        //                 child: Icon(Icons.photo),
        //               );
        //             },
        //             height: 80,
        //             width: 100,
        //             cartItemModel.image ?? "",
        //             fit: BoxFit.fill,
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
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
                    Flexible(child: Text(cartItemModel.name)),
                    const Gap(4),
                    IconButton(
                      onPressed: () {
                        HelperFunctions.callMethodWithLoadingDialog(
                            context: context,
                            callback: () async {
                              cartProvider.removeCartItem(
                                productUuid: cartItemModel.productId,
                              );
                            });
                      },
                      icon: Icon(
                        Icons.close,
                        color: CustomColors.gray[400],
                      ),
                    ),
                  ],
                ),
                Text("Dostupno: ${cartItemModel.totalAmount}",
                    style: textTheme.bodyMedium!.copyWith(
                      color: CustomColors.gray[400],
                    )),
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
                          onTap: () {
                            HelperFunctions.callMethodWithLoadingDialog(
                                context: context,
                                callback: () async {
                                  cartProvider.increment(
                                    productUuid: cartItemModel.productId,
                                    isIncrement: "false",
                                  );
                                });
                          },
                        ),
                        const Gap(8),
                        Text(
                          cartItemModel.quantity.toString(),
                          style: textTheme.bodyLarge,
                        ),
                        const Gap(8),
                        PlusItem(
                          onTap: () {
                            HelperFunctions.callMethodWithLoadingDialog(
                                context: context,
                                callback: () async {
                                  cartProvider.increment(
                                    productUuid: cartItemModel.productId,
                                    isIncrement: "true",
                                  );
                                });
                          },
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
                      "Cijena stavke:",
                      style: textTheme.bodySmall,
                    ),
                    Text(
                      cartItemModel.cartItemTotalPrice.toString(),
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
