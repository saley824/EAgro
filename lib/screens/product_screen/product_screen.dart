import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gap/gap.dart';
import 'package:msan/widgets/buttons/agro_button.dart';
import 'package:provider/provider.dart';

import '/helpers/snack_bar_messages.dart';
import '/screens/product_screen/product_screen_widgets/info_field.dart';
import '/widgets/loading_indicator/agro_loading_indicator.dart';
import '/widgets/modals/agro_modal.dart';
import '../../helpers/constants/custom_colors.dart';
import '../../helpers/helper_functions.dart';
import '../../providers/main_provider.dart';
import '../../widgets/bottom_sheet/agro_bottom_sheet.dart';
import '../../widgets/buttons/agro_add_button.dart';
import '../shop_screens/add_discount.dart/add_discount_bottom_sheet.dart';
import '../shop_screens/add_discount.dart/add_discount_providers/add_discount_provider.dart';
import 'product_providers/product_provider.dart';
import 'product_screen_widgets/price_history.dart';
import 'product_screen_widgets/rating_bottom_sheet.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    final textTheme = Theme.of(context).textTheme;
    final mainProvider = Provider.of<MainProvider>(context, listen: false);

    return Scaffold(
      appBar: HelperFunctions.getAppBar(context),
      body: Consumer<ProductProvider>(
        builder: (_, __, ___) => FutureBuilder(
          future: productProvider.getData(),
          builder: (context, snapshot) => snapshot.connectionState ==
                  ConnectionState.waiting
              ? const AgroLoadingIndicator()
              : Builder(builder: (context) {
                  return SingleChildScrollView(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 4,
                            color: Color(0x3600000F),
                            offset: Offset(0, 2),
                          )
                        ],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(0),
                                    bottomRight: Radius.circular(0),
                                    topLeft: Radius.circular(8),
                                    topRight: Radius.circular(8),
                                  ),
                                  child: Image.network(
                                    "https://firebasestorage.googleapis.com/v0/b/diplomski-fc1d8.appspot.com/o/images%2Ftatum.jpg?alt=media&token=1711d5da-9eac-4d98-a576-693958a84d0a",
                                    width: 100,
                                    height: 150,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 16),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: const []),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          productProvider.product!.name
                                              .toString(),
                                          style: textTheme.headlineSmall,
                                        ),
                                        const Gap(8),
                                        InkWell(
                                          onTap: () {
                                            AgroBottomSheet.showBottomSheet(
                                                title: "Review",
                                                context: context,
                                                child: ChangeNotifierProvider.value(
                                                    value: productProvider,
                                                    child:
                                                        // ignore: prefer_const_constructors
                                                        RatingBottomSheet()));
                                          },
                                          child: Row(
                                            children: [
                                              Row(
                                                children: [
                                                  RatingBarIndicator(
                                                    rating: productProvider
                                                            .product!
                                                            .avgReview ??
                                                        0.0,
                                                    itemCount: 5,
                                                    itemSize: 16,
                                                    itemBuilder: (_, __) =>
                                                        Icon(
                                                      Icons.star,
                                                      color: CustomColors
                                                          .yellow.shade500,
                                                    ),
                                                  ),
                                                  const Gap(2),
                                                  Text(
                                                    "(${productProvider.product!.countReview.round()})",
                                                    style: textTheme.bodyLarge!
                                                        .copyWith(
                                                      color: CustomColors
                                                          .gray[500],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        const Spacer(),
                                        productProvider.isProductSaved
                                            ? InkWell(
                                                onTap: () {
                                                  bool success = false;
                                                  HelperFunctions
                                                      .callMethodWithLoadingDialog(
                                                          context: context,
                                                          callback: () async {
                                                            success =
                                                                await productProvider
                                                                    .deleteSavedProductById();
                                                          },
                                                          onFinished: () {
                                                            if (success) {
                                                              SnackBarMessage
                                                                  .showMessage(
                                                                      context:
                                                                          context,
                                                                      text:
                                                                          "Product is removed from saved list!",
                                                                      isError:
                                                                          false);
                                                            }
                                                          });
                                                },
                                                child: const Icon(
                                                  Icons.favorite_rounded,
                                                  color: CustomColors.jadeGreen,
                                                  size: 32,
                                                ),
                                              )
                                            : InkWell(
                                                onTap: () {
                                                  bool success = false;
                                                  HelperFunctions
                                                      .callMethodWithLoadingDialog(
                                                          context: context,
                                                          callback: () async {
                                                            success =
                                                                await productProvider
                                                                    .saveProduct();
                                                          },
                                                          onFinished: () {
                                                            if (success) {
                                                              SnackBarMessage
                                                                  .showMessage(
                                                                      context:
                                                                          context,
                                                                      text:
                                                                          "Product is saved!",
                                                                      isError:
                                                                          false);
                                                            }
                                                          });
                                                },
                                                child: const Icon(
                                                  Icons.favorite_border,
                                                  color: CustomColors.jadeGreen,
                                                  size: 32,
                                                ),
                                              ),
                                      ],
                                    ),
                                    //  TextSpan(
                                    //                                 text: "(${product.countReview.round()})",
                                    //                                 style: textTheme.bodyLarge!.copyWith(
                                    //                                   color: CustomColors.gray[500],
                                    //                                 ),
                                    //                               ),
                                    //                 productProvider.product.productDiscount == null
                                    // ? Text("${product.price} KM",
                                    //     style: textTheme.bodyLarge!.copyWith(
                                    //       fontWeight: FontWeight.w500,
                                    //       fontSize: 18,
                                    //     ))
                                    // : Column(
                                    //     crossAxisAlignment: CrossAxisAlignment.start,
                                    //     children: [
                                    //       Text("${product.discountedPrice} KM",
                                    //           style: textTheme.bodyLarge!.copyWith(
                                    //             fontWeight: FontWeight.w500,
                                    //             fontSize: 18,
                                    //             color: CustomColors.red[600],
                                    //           )),
                                    //       Text("${product.price} KM",
                                    //           style: textTheme.bodyLarge!.copyWith(
                                    //             fontWeight: FontWeight.w500,
                                    //             fontSize: 14,
                                    //             decoration: TextDecoration.lineThrough,
                                    //             color: CustomColors.gray[400],
                                    //           )),
                                    //     ],
                                    //   )
                                    Row(
                                      children: [
                                        Text(
                                          "${productProvider.product!.price} KM",
                                          style: textTheme.labelLarge,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            AgroModal.showECommDialog(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 12,
                                                        horizontal: 24),
                                                context: context,
                                                child: PriceHistory(
                                                  productPriceHistory:
                                                      productProvider.product!
                                                          .productPriceHistory,
                                                ));
                                          },
                                          child: const Padding(
                                              padding: EdgeInsets.all(4),
                                              child:
                                                  Icon(Icons.history_rounded)),
                                        )
                                      ],
                                    ),

                                    const Gap(8),
                                    InfoField(
                                        property: "Category",
                                        value: productProvider
                                            .product!.category.name),
                                    const Gap(8),
                                    InfoField(
                                      property: "Created at",
                                      value: productProvider.product!.createdAt
                                          .toString()
                                          .substring(0, 10),
                                    ),
                                    const Gap(8),
                                    InfoField(
                                        property: "Total amount",
                                        value: productProvider
                                            .product!.totalAmount
                                            .toString()),

                                    if (productProvider.product!.quantity !=
                                        null) ...[
                                      const Gap(8),
                                      InfoField(
                                        property: "Quantity",
                                        value:
                                            "${productProvider.product!.quantity} ${productProvider.product!.unit!}",
                                      ),
                                    ]
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Description",
                                  style: textTheme.labelMedium,
                                ),
                                const Gap(4),
                                Text(
                                  "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy.",
                                  style: textTheme.bodyMedium!.copyWith(),
                                ),
                              ],
                            ),
                          ),
                          const Gap(12),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                            ),
                            child: AgroButton(
                              text: "Add to cart",
                              buttonColor: ButtonColor.jadeGreen,
                              onTap: () {
                                HelperFunctions.callMethodWithLoadingDialog(
                                    context: context,
                                    callback: () async {
                                      await productProvider.addToCart();
                                    },
                                    onFinished: () {
                                      SnackBarMessage.showMessage(
                                          context: context,
                                          text: "Product is added to cart!",
                                          isError: false);
                                    });
                              },
                            ),
                          ),
                          AgroAddButton(
                            text: "Add discount",
                            onTap: () {
                              AgroBottomSheet.showBottomSheet(
                                title: "Add discount",
                                context: context,
                                child: ChangeNotifierProvider(
                                  create: (context) => AddDiscountProvider(),
                                  child: const AddDiscountBottomSheet(),
                                ),
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  );
                }),
        ),
      ),
    );
  }
}
