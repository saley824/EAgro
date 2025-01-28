import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '/screens/product_screen/product_screen_widgets/description.dart';
import '/screens/product_screen/product_screen_widgets/save_icon.dart';
import '/services/product_service.dart';
import '/widgets/buttons/agro_button.dart';
import '/widgets/loading_indicator/agro_loading_indicator.dart';
import '/widgets/modals/agro_modal.dart';
import '../../helpers/helper_functions.dart';
import '../../helpers/photo_helper.dart';
import '../../models/products_model/product_discount.dart';
import '../../providers/main_provider.dart';
import '../../widgets/bottom_sheet/agro_bottom_sheet.dart';
import '../../widgets/buttons/text_icon_button.dart';
import '../shop_screens/add_discount.dart/add_discount_bottom_sheet.dart';
import '../shop_screens/add_discount.dart/add_discount_providers/add_discount_provider.dart';
import '../shop_screens/add_product/add_product_providers/add_product_provider.dart';
import '../shop_screens/add_product/add_product_screen.dart';
import 'product_providers/product_provider.dart';
import 'product_screen_helper.dart';
import 'product_screen_widgets/delete_product_modal.dart';
import 'product_screen_widgets/price.dart';
import 'product_screen_widgets/product_details.dart';
import 'product_screen_widgets/rating.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    final mainProvider = Provider.of<MainProvider>(context, listen: false);
    final isShop = mainProvider.isShop();
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      bottomNavigationBar: HelperFunctions.getBottomBar(context),
      appBar: HelperFunctions.getSubAppBar(
          context: context, title: "Pregled proizvoda"),
      body: SafeArea(
        child: Consumer<ProductProvider>(
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
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CachedNetworkImage(
                              imageUrl:
                                  // "https://t4.ftcdn.net/jpg/07/23/14s/93/360_F_723149335_tA0Fo8zefrHzYlSgXRMYHmBQk7CuWrRd.jpg",
                                  //todo sasa
                                  productProvider.product?.image ?? "",

                              errorWidget: (context, error, stackTrace) {
                                return const SizedBox(
                                  height: 120,
                                  width: 120,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.photo),
                                      Text("Nema slike"),
                                    ],
                                  ),
                                );
                              },
                              // "https://firebasestorage.googleapis.com/v0/b/diplomski-fc1d8.appspot.com/o/images%2Ftatum.jpg?alt=media&token=1711d5da-9eac-4d98-a576-693958a84d0a",
                              height: 300,
                              width: double.infinity,
                              fit: BoxFit.fill,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              productProvider.product!.name
                                                  .toString(),
                                              style: textTheme.headlineSmall,
                                            ),
                                          ),
                                          const Gap(8),
                                          const Rating(),
                                          const Gap(8),
                                          // const Spacer(),
                                          if (!isShop) const SaveIcon(),
                                        ],
                                      ),
                                      const Price(),
                                      const Gap(8),
                                      const ProductDetails(),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const Description(),
                            const Gap(12),
                            if (!isShop) ...[
                              AgroButton(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                ),
                                text: "Dodaj u korpu",
                                buttonColor: ButtonColor.jadeGreen,
                                onTap: () {
                                  ProductScreenHelper.onAddToCart(context);
                                },
                              ),
                              const Gap(24)
                            ],
                            if (isShop) ...[
                              const Gap(8),
                              TextIconButton(
                                icon: Icons.add,
                                text: _getPhotoButtonText(null),
                                onTap: () async {
                                  File? selectedImage =
                                      await PhotoUploadHelper.selectFile();
                                  if (selectedImage != null) {
                                    bool success =
                                        await ProductService.uploadProductImage(
                                            productProvider.id, selectedImage);
                                    if (success) {
                                      productProvider.refresh();
                                      mainProvider.refresh();
                                    }
                                  }
                                },
                              ),
                              TextIconButton(
                                icon: Icons.add,
                                text: _getDiscountButtonText(
                                    productProvider.product?.productDiscount),
                                onTap: () {
                                  AgroBottomSheet.showBottomSheet(
                                      title: _getDiscountButtonText(
                                          productProvider
                                              .product?.productDiscount),
                                      context: context,
                                      child: MultiProvider(
                                        providers: [
                                          ChangeNotifierProvider(
                                            create: (context) =>
                                                AddDiscountProvider(
                                              productProvider.product!,
                                            ),
                                            child:
                                                const AddDiscountBottomSheet(),
                                          ),
                                          ChangeNotifierProvider.value(
                                              value: productProvider)
                                        ],
                                        child: const AddDiscountBottomSheet(),
                                      ));
                                },
                              ),
                              TextIconButton(
                                icon: Icons.edit,
                                text: "Izmijeni proizvod",
                                onTap: () {
                                  Navigator.of(context)
                                      .push(MaterialPageRoute(
                                    builder: (context) =>
                                        ChangeNotifierProvider(
                                      create: (context) => AddProductProvider(
                                        product: productProvider.product,
                                      ),
                                      child: const AddProductScreen(),
                                    ),
                                  ))
                                      .then((value) {
                                    if (value) {
                                      productProvider.refresh();
                                    }
                                  });
                                },
                              ),
                              TextIconButton(
                                color: Colors.red[500],
                                icon: Icons.delete,
                                text: "Obriši proizvod",
                                onTap: () {
                                  AgroModal.showECommDialog(
                                    child: DeleteProductModal(
                                      product: productProvider.product,
                                    ),
                                    context: context,
                                  );
                                },
                              )
                            ]
                          ],
                        ),
                      ),
                    );
                  }),
          ),
        ),
      ),
    );
  }

  String _getDiscountButtonText(ProductDiscountModel? discount) {
    return discount != null ? "Izmijeni sniženje" : "Dodaj sniženje";
  }

  String _getPhotoButtonText(bool? isEdit) {
    return isEdit ?? false ? "Izmijeni sliku" : "Dodaj sliku";
  }
}
