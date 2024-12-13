import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/models/products_model/product_filter_model.dart';
import '/screens/forgot_password/forgot_password_providers/forgot_password_provider.dart';
import '/screens/forgot_password/forgot_password_screen.dart';
import '/screens/forgot_password/reset_password/reset_password_provider.dart';
import '/screens/products_list_screen/products_list_models/sort_model.dart';
import '../screens/forgot_password/reset_password/reset_password_screen.dart';
import '../screens/home_screen/home_screen.dart';
import '../screens/home_screen/home_screen_providers/home_screen_provider.dart';
import '../screens/login_screen/login_providers/login_provider.dart';
import '../screens/login_screen/login_screen.dart';
import '../screens/products_list_screen/products_list_providers/products_list_provider.dart';
import '../screens/products_list_screen/products_list_screen.dart';

class NavigatorHelper {
  static void navigateToHome(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
                create: (context) => HomeScreenProvider(),
                child: const HomeScreen(),
              )),
      (Route<dynamic> route) => false,
    );
  }

  static void navigateToProductsList(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => ChangeNotifierProvider(
        create: (context) => ProductsListProvider(
          initProductFilter: ProductFilterModel(),
          initSortModel: SortModel(sortBy: "createdAt", orderBy: "desc"),
        ),
        child: const ProductsListScreen(),
      ),
    ));
  }

  static void navigateToResetPassword(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => ChangeNotifierProvider(
        create: (context) => ResetPasswordProvider(),
        child: const ResetPasswordScreen(),
      ),
    ));
  }

  static void navigateToForgotPassword(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => ChangeNotifierProvider(
        create: (context) => ForgotPasswordProvider(),
        child: const ForgotPasswordScreen(),
      ),
    ));
  }

  static void navigateToLogin(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => ChangeNotifierProvider(
          create: (context) => LoginProvider(),
          child: const LoginScreen(),
        ),
      ),
    );
  }
}
