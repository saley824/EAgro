import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '/helpers/constants/custom_colors.dart';
import '/screens/product_screen/product_screen.dart';
import '/widgets/products/discount_badge.dart';
import '/models/products_model/product_list_model.dart';
import '../../../providers/main_provider.dart';
import '../../../screens/product_screen/product_providers/product_provider.dart';

class ProductPreview extends StatelessWidget {
  final bool hasDiscount;
  final int? discountPercentage;
  final ProductListModel product;
  final bool pushAndPop;
  final Function()? refresh;
  const ProductPreview({
    super.key,
    required this.product,
    this.hasDiscount = false,
    this.discountPercentage,
    this.pushAndPop = false,
    this.refresh,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final globalAppNavigator = Navigator.of(context);
    final mainProvider = Provider.of<MainProvider>(context, listen: false);

    return InkWell(
      onTap: () {
        pushAndPop
            ? globalAppNavigator.pushReplacement(MaterialPageRoute(
                builder: (context) => ChangeNotifierProvider(
                  create: (context) =>
                      ProductProvider(product.id, mainProvider.user!.id),
                  child: const ProductScreen(),
                ),
              ))
            : globalAppNavigator
                .push(MaterialPageRoute(
                builder: (context) => ChangeNotifierProvider(
                  create: (context) =>
                      ProductProvider(product.id, mainProvider.user!.id),
                  child: const ProductScreen(),
                ),
              ))
                .then(
                (value) {
                  if (value && refresh != null) {
                    refresh!();
                  }
                },
              );
      },
      child: SizedBox(
        width: 140,
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
                  if (product.productDiscount != null &&
                      product.productDiscount!.hasDiscount) ...[
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
                      child: CachedNetworkImage(
                        // todo sasa
                        imageUrl:
                            "https://t4.ftcdn.net/jpg/07/23/14/93/360_F_723149335_tA0Fo8zefrHzYlSgXRMYsmBQk7CuWrRd.jpg",

                        // product.image ?? "",

                        errorWidget: (context, error, stackTrace) {
                          return const SizedBox(
                            height: 120,
                            width: 120,
                            child: Icon(Icons.photo),
                          );
                        },
                        height: 120,
                        width: 120,
                        // "https://images.pexels.com/photos/90946/pexels-photo-90946.jpeg",
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(
                    product.name,
                    style: textTheme.bodyMedium!
                        .copyWith(color: CustomColors.gray[500]),
                    overflow: TextOverflow.visible,
                  ),
                ),
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star,
                        size: 16,
                        color: CustomColors.yellow[500],
                      ),
                      const Gap(2),
                      Flexible(
                        child: RichText(
                          textAlign: TextAlign.start,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    "${product.avgReview != null ? product.avgReview!.toStringAsFixed(2) : "0.0"} ",
                                style: textTheme.bodyLarge,
                              ),
                              TextSpan(
                                text: "(${product.countReview.round()})",
                                style: textTheme.bodyLarge!.copyWith(
                                  color: CustomColors.gray[500],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Gap(4),
            product.productDiscount != null &&
                    product.productDiscount!.hasDiscount
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${product.discountedPrice} KM",
                          style: textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: CustomColors.red[600],
                          )),
                      Text("${product.price} KM",
                          style: textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            decoration: TextDecoration.lineThrough,
                            color: CustomColors.gray[400],
                          )),
                    ],
                  )
                : Text(
                    "${product.price} KM",
                    style: textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
