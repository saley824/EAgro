import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../screens/shop_screens/add_product/add_product_providers/add_product_provider.dart';
import '../screens/shop_screens/add_product/add_product_screen.dart';
import '/helpers/constants/custom_colors.dart';
import '/helpers/navigator_helper.dart';
import '/providers/main_provider.dart';
import '/screens/saved_products/saved_products_provider/saved_products_provider.dart';
import '/screens/user_info_screen.dart/user_info_providers/user_info_provider.dart';
import '/screens/user_info_screen.dart/user_info_screen.dart';
import '../screens/orders_screen/orders_providers/order_provider.dart';
import '../screens/orders_screen/orders_screen.dart';
import '../screens/saved_products/saved_products_screen.dart';
import '../widgets/cart_icon.dart';

class HelperFunctions {
  static getAppBar(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final mainProvider = context.read<MainProvider>();
    return AppBar(
      title: InkWell(
        onTap: () {
          NavigatorHelper.navigateToHome(context);
        },
        child: Text(
          "EAgro",
          style: textTheme.headlineLarge!.copyWith(color: Colors.white),
        ),
      ),
      backgroundColor: CustomColors.jadeGreen[600],
      leading: InkWell(
        onTap: () {
          final globalAppNavigator = Navigator.of(context);
          globalAppNavigator.push(MaterialPageRoute(
              builder: (context) => ChangeNotifierProvider(
                    create: (context) => SavedProductsProvider(),
                    child: const SavedProductsScreen(),
                  )));
        },
        child: const Icon(
          Icons.favorite,
          color: Colors.white,
          size: 32,
        ),
      ),
      actions: [
        InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ChangeNotifierProvider(
                    create: (context) => UserInfoProvider(
                          context: context,
                          isEdit: true,
                          userId: mainProvider.user?.id ?? "",
                        ),
                    child: const UserInfoScreen()),
              ),
            );
          },
          child: const Padding(
              padding: EdgeInsets.only(
                right: 8,
              ),
              child: Icon(
                Icons.menu,
                color: Colors.white,
                size: 36,
              )),
        ),
        // Icon(Icons.local_grocery_store, color: Colors.white),
      ],
    );
  }

  static Widget getBottomBar(BuildContext context) {
    final mainProvider = context.read<MainProvider>();

    return Container(
      padding: const EdgeInsets.all(4),
      color: CustomColors.jadeGreen[600],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ChangeNotifierProvider(
                    create: (context) => OrdersProvider(
                      userId: mainProvider.getId(),
                      isShop: mainProvider.isShop(),
                    ),
                    child: const OrdersScreen(),
                  ),
                ),
              );
            },
            child: const Padding(
                padding: EdgeInsets.only(
                  right: 8,
                ),
                child: Icon(
                  Icons.receipt_long,
                  color: Colors.white,
                  size: 36,
                )),
          ),

            mainProvider.isShop() ?
                  InkWell(
            onTap: () {
                 Navigator.of(context)
                                      .push(MaterialPageRoute(
                                    builder: (context) =>
                                        ChangeNotifierProvider(
                                      create: (context) => AddProductProvider(
                                          ),
                                      child: const AddProductScreen(),
                                    ),
                                  ))
                                      .then((value) {
                                    if (value) {
                                     //refresh
                                    }
                                  });
              
            },
            child: const Padding(
                padding: EdgeInsets.only(
                  right: 8,
                ),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 36,
                )),
          ):
          const CartIcon(),

          InkWell(
            onTap: () {
              NavigatorHelper.navigateToProductsList(context);
            },
            child: const Padding(
                padding: EdgeInsets.only(
                  right: 8,
                ),
                child: Icon(
                  Icons.shopping_bag,
                  color: Colors.white,
                  size: 36,
                )),
          ),
        ],
      ),
    );
  }

  static getSubAppBar(BuildContext context, String title) {
    final textTheme = Theme.of(context).textTheme;
    return AppBar(
      title: Text(
        title,
        style: textTheme.headlineLarge!.copyWith(color: Colors.white),
      ),
      backgroundColor: CustomColors.jadeGreen[600],
      leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 32,
          )),
    );
  }

  static getBackGroundGradient() {
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        CustomColors.jadeGreen[300]!,
        CustomColors.jadeGreen[200]!,
        CustomColors.jadeGreen[100]!,
      ],
    );
  }

  static callMethodWithLoadingDialog({
    required BuildContext context,
    required Function callback,
    Function? onFinished,
    bool barrierDismissible = false,
    String message = "Loading",
  }) async {
    showDialog(
        barrierDismissible: barrierDismissible,
        context: context,
        builder: (_) => PopScope(
              canPop: false,
              child: Center(
                child: Material(
                  color: Colors.transparent,
                  child: Container(
                    height: 140,
                    width: 200,
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          message,
                          style: TextStyle(
                              fontSize: 25, color: CustomColors.jadeGreen[500]),
                        ),
                        const SizedBox(height: 12),
                        SpinKitWaveSpinner(
                          color: CustomColors.jadeGreen[500]!,
                          size: 56.0,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ));

    await callback();
    // ignore: use_build_context_synchronously
    Navigator.of(context).pop();

    if (onFinished != null) {
      onFinished();
    }
  }
}
