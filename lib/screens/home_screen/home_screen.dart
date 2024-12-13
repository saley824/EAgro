import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '/helpers/helper_functions.dart';
import '/models/products_model/product_filter_model.dart';
import '/providers/main_provider.dart';
import '/widgets/loading_indicator/agro_loading_indicator.dart';
import '../products_list_screen/products_list_models/sort_model.dart';
import 'home_screen_providers/home_screen_provider.dart';
import 'home_widgets/home_products_horizontal.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeScreenProvider =
        Provider.of<HomeScreenProvider>(context, listen: false);

    return Scaffold(
        bottomNavigationBar: HelperFunctions.getBottomBar(context),
        appBar: HelperFunctions.getAppBar(context),
        body: Consumer<MainProvider>(
          builder: (_, __, ___) => FutureBuilder(
            future: homeScreenProvider.getAll(context),
            builder: (context, snapshot) =>
                snapshot.connectionState == ConnectionState.waiting
                    ? const AgroLoadingIndicator()
                    : Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Column(
                          children: [
                            Expanded(
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    HomeProductHorizontal(
                                      title: "Proizvodi na sniženju",
                                      productsList: homeScreenProvider
                                          .productsWithBiggestDiscount,
                                      productFilterModel: ProductFilterModel(
                                        hasDiscount: true,
                                      ),
                                      sortModel:
                                          homeScreenProvider.biggestDiscountSort,
                                    ),
                                    const Gap(16),
                                    HomeProductHorizontal(
                                      title: "Novi proizvodi",
                                      productsList:
                                          homeScreenProvider.lastAddedProducts,
                                      productFilterModel: ProductFilterModel(),
                                      sortModel: SortModel(
                                          sortBy: "createdAt", orderBy: "desc"),
                                    ),
                                    const Gap(16),
                      
                                    if(homeScreenProvider.recommendedCategory!= null)
                                    HomeProductHorizontal(
                                      title: "Preporučena kategorija: ${homeScreenProvider.recommendedCategory?.name}",
                                      productsList:
                                          homeScreenProvider.productsByRecommendedCategory,
                                      productFilterModel: ProductFilterModel(
                                        superCategory:
                                            homeScreenProvider.recommendedCategory!.superCategory,
                                            category:     homeScreenProvider.recommendedCategory,
                                      ),
                                      sortModel: SortModel(
                                          sortBy: "createdAt", orderBy: "desc"),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                    ),
          ),
        ));
  }
}
