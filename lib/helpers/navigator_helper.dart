import 'package:flutter/material.dart';
import 'package:msan/models/products_model/product_filter_model.dart';
import 'package:msan/screens/products_list_screen/products_list_models/sort_model.dart';
import 'package:provider/provider.dart';

import '../screens/home_screen/home_screen.dart';
import '../screens/home_screen/home_screen_providers/home_screen_provider.dart';
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
          productFilter: ProductFilterModel(),
          sortModel: SortModel(sortBy: "createdAt", orderBy: "desc"),
        ),
        child: const ProductsListScreen(),
      ),
    ));
  }
}
