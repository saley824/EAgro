import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../helpers/helper_functions.dart';
import '../../helpers/snack_bar_messages.dart';
import '../../providers/main_provider.dart';
import 'product_providers/product_provider.dart';

class ProductScreenHelper {
  static void onAddToCart(BuildContext context) {
    final mainProvider = Provider.of<MainProvider>(context, listen: false);
    bool success = false;
    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    HelperFunctions.callMethodWithLoadingDialog(
        context: context,
        callback: () async {
         success = await productProvider.addToCart();
        },
        onFinished: () {
            if(success){
                    mainProvider.incrementCartCount();
                SnackBarMessage.showMessage(
              context: context,
              text: "Proizvod je dodan u korpu!",
              isError: false,);
            }
    
        
        });
  }
}
