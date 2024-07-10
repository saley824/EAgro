import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:msan/helpers/helper_functions.dart';
import 'package:msan/models/products_model/product_filter_model.dart';
import 'package:msan/widgets/loading_indicator/agro_loading_indicator.dart';
import 'package:provider/provider.dart';

import '../../providers/main_provider.dart';
import 'home_screen_providers/home_screen_provider.dart';
import 'home_widgets/home_products_horizontal.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeScreenProvider =
        Provider.of<HomeScreenProvider>(context, listen: false);

    return Scaffold(
        appBar: HelperFunctions.getAppBar(context),
        body: FutureBuilder(
          future: homeScreenProvider.getAll(),
          builder: (context, snapshot) => snapshot.connectionState ==
                  ConnectionState.waiting
              ? const AgroLoadingIndicator()
              : Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const Text("HomeScreen"),
                            HomeProductHorizontal(
                              title: "Products on discount",
                              productsList: homeScreenProvider
                                  .productsWithBiggestDiscount,
                              productFilterModel:
                                  homeScreenProvider.biggestDiscountFilter,
                              sortModel: homeScreenProvider.biggestDiscountSort,
                            ),
                            const Gap(16),
                            HomeProductHorizontal(
                              title: "New Products",
                              productsList:
                                  homeScreenProvider.lastAddedProducts,
                              productFilterModel: ProductFilterModel(
                                superCategory:
                                    homeScreenProvider.selectedCategory,
                              ),
                              sortModel: homeScreenProvider.lastAddedSort,
                            ),
                            const Gap(16),
                            HomeProductHorizontal(
                              title: "Some category",
                              productsList: homeScreenProvider.byRandomCategory,
                              productFilterModel: ProductFilterModel(
                                superCategory:
                                    homeScreenProvider.selectedCategory,
                              ),
                              sortModel: homeScreenProvider.lastAddedSort,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
        ));
  }
}
