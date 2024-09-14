import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:eagro/helpers/snack_bar_messages.dart';
import 'package:eagro/widgets/loading_indicator/agro_loading_indicator.dart';
import 'package:provider/provider.dart';

import '../../widgets/no_results.dart';
import '/helpers/helper_functions.dart';
import '/screens/cart_screen/cart_widgets/cart_item.dart';
import '/widgets/buttons/agro_button.dart';
import '/widgets/divider/divider.dart';
import 'cart_providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: HelperFunctions.getSubAppBar(context:  context, title: "Cart"),
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
                        text: "Cart is empty",
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
                                          padding: const EdgeInsets.all(8),
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
                                    "Total price:",
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
                                    "Number of items:",
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
                                text: "Finish",
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
                                            text: "Order is created!",
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
    );
  }
}
