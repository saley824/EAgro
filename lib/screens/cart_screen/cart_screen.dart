import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '/helpers/helper_functions.dart';
import '/helpers/snack_bar_messages.dart';
import '/screens/cart_screen/cart_widgets/cart_item.dart';
import '/widgets/buttons/agro_button.dart';
import '/widgets/divider/divider.dart';
import '/widgets/loading_indicator/agro_loading_indicator.dart';
import '../../providers/main_provider.dart';
import '../../widgets/no_results.dart';
import 'cart_providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    final textTheme = Theme.of(context).textTheme;
    final mainProvider = Provider.of<MainProvider>(context, listen: false);
    return PopScope(
        onPopInvokedWithResult: (didPop, result) => {
      if(didPop){
          mainProvider.getCountCart()
      }
     },
      child: Scaffold(
        appBar: HelperFunctions.getSubAppBar(context:  context, title: "Korpa", onTap: () {
          mainProvider.getCountCart();
        },),
        body: SafeArea(
          child: Consumer<CartProvider>(
            builder: (_, __, ___) => FutureBuilder(
              future: cartProvider.fetchCart(),
              builder: (context, snapshot) => snapshot.connectionState ==
                      ConnectionState.waiting
                  ? const AgroLoadingIndicator()
                  : cartProvider.cart != null &&
                          cartProvider.cart!.cartItemsDetails.isEmpty
                      ? const NoResults(
                          text: "Korpa je prazna",
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                            ),
                            color: Colors.white,
                            child: Column(
                              children: [
                                Expanded(
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        ...cartProvider.cart!.cartItemsDetails
                                            .map(
                                          (e) => Padding(
                                            padding: const EdgeInsets.fromLTRB(4, 8, 4, 8),
                                            child: CartItem(
                                              cartItemModel: e,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const Gap(8),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Ukupna cijena:",
                                      style: textTheme.bodyMedium,
                                    ),
                                    Text(
                                      cartProvider.cart?.totalPrice.toString() ??
                                          "0.0",
                                      style: textTheme.titleMedium,
                                    ),
                                  ],
                                ),
                                const Gap(8),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Broj stavki:",
                                      style: textTheme.bodyMedium,
                                    ),
                                    Text(
                                      cartProvider.cart?.count.toString() ?? "0",
                                      style: textTheme.titleMedium,
                                    ),
                                  ],
                                ),
                                const AgroDivider(
                                    margin: EdgeInsets.symmetric(vertical: 16)),
                                AgroButton(
                                  text: "Završi",
                                  onTap: () {
                                    bool success = false;
                                    HelperFunctions.callMethodWithLoadingDialog(
                                        context: context,
                                        callback: () async {
                                          success =
                                              await cartProvider.createOrder();
                                        },
                                        onFinished: () {
                                          if (success) {
                                            cartProvider.clear();
                                            SnackBarMessage.showMessage(
                                              context: context,
                                              text: "Narudžba je kreirana!",
                                              isError: false,
                                            );
                                          }
                                        });
                                  },
                                  buttonColor: ButtonColor.jadeGreen,
                                )
                              ],
                            ),
                          ),
                        ),
            ),
          ),
        ),
      ),
    );
  }
}
