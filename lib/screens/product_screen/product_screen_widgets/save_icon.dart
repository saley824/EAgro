import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../helpers/constants/custom_colors.dart';
import '../../../helpers/helper_functions.dart';
import '../../../helpers/snack_bar_messages.dart';
import '../product_providers/product_provider.dart';

class SaveIcon extends StatelessWidget {
  const SaveIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    return productProvider.isProductSaved
        ? InkWell(
            onTap: () {
              bool success = false;
              HelperFunctions.callMethodWithLoadingDialog(
                  context: context,
                  callback: () async {
                    success = await productProvider.deleteSavedProductById();
                  },
                  onFinished: () {
                    if (success) {
                      SnackBarMessage.showMessage(
                          context: context,
                          text: "Proizvod je uklonjen iz liste sačuvanih proizvoda!",
                          isError: false);
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
              HelperFunctions.callMethodWithLoadingDialog(
                  context: context,
                  callback: () async {
                    success = await productProvider.saveProduct();
                  },
                  onFinished: () {
                    if (success) {
                      SnackBarMessage.showMessage(
                          context: context,
                          text: "Proizvod je sačuvan!",
                          isError: false);
                    }
                  });
            },
            child: const Icon(
              Icons.favorite_border,
              color: CustomColors.jadeGreen,
              size: 32,
            ),
          );
  }
}
