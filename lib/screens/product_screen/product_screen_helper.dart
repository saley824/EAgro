import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../helpers/helper_functions.dart';
import '../../helpers/snack_bar_messages.dart';
import 'product_providers/product_provider.dart';

class ProductScreenHelper {
  static void onAddToCart(BuildContext context) {
    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);
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
  }
}
