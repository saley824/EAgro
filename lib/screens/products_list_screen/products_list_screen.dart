import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../widgets/no_results.dart';
import '/providers/main_provider.dart';
import '/screens/products_list_screen/filter_bottom_sheet/filter_bottom_sheet.dart';
import '/screens/products_list_screen/filter_bottom_sheet/filter_providers/filter_provider.dart';
import '/screens/products_list_screen/products_list_providers/products_list_provider.dart';
import '/widgets/bottom_sheet/agro_bottom_sheet.dart';
import '/widgets/input_fields/agro_input_field.dart';
import '/widgets/loading_indicator/agro_loading_indicator.dart';
import '/widgets/products/product_preview/product_preview.dart';
import '/widgets/radio_button_group/radio_button_group.dart';
import '../../helpers/constants/custom_icons.dart';
import '../../helpers/helper_functions.dart';

class ProductsListScreen extends StatelessWidget {
  const ProductsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productsListProvider = context.read<ProductsListProvider>();
    final globalAppNavigator = Navigator.of(context);
    final scrollController = ScrollController();

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
          productsListProvider.hasMoreProducts &&
          !productsListProvider.isLoadingMoreProducts) {
        productsListProvider.getMoreProducts();
      }
    });
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: HelperFunctions.getSubAppBar(
        context : context,
       title:  "Products",
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          child: Consumer<MainProvider>(
            builder: (_, __, ___) => FutureBuilder(
              future: productsListProvider.getInitProducts(),
              builder: (context, snapshot) => snapshot.connectionState ==
                      ConnectionState.waiting
                  ? const AgroLoadingIndicator()  
                  : Consumer<ProductsListProvider>(
                      builder: (_, __, ___) => SingleChildScrollView(
                        controller: scrollController,
                        child: Center(
                          child: Column(
                            children: [
                              AgroInputField(
                                textEditingController:
                                    productsListProvider.searchController,
                                prefixIcon: const Icon(Icons.search),
                                hintText: "Search",
                                onInputChanged: () {
                                  productsListProvider.searchProducts();
                                },
                              ),
                              const Gap(18),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        AgroBottomSheet.showBottomSheet(
                                          context: context,
                                          child: RadioButtonGroup(
                                            initValue:
                                                productsListProvider.sortModel,
                                            radioButtons:
                                                productsListProvider.sorts,
                                            onChange: (selected) {
                                              productsListProvider
                                                  .setSort(selected.value);
                                              globalAppNavigator.pop();
                                            },
                                          ),
                                        );
                                      },
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.sort,
                                            size: 32,
                                          ),
                                          const Gap(4),
                                          Text(
                                            "Sort",
                                            style: textTheme.bodyLarge,
                                          ),
                                        ],
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        AgroBottomSheet.showBottomSheet(
                                          title: "Filter products",
                                          context: context,
                                          child: ChangeNotifierProvider(
                                            create: (context) => FilterProvider(
                                                productFilter:
                                                    productsListProvider
                                                        .productFilter),
                                            child: FilterBottomSheet(
                                              onSelect: (selectedFilter) {
                                                productsListProvider
                                                    .setProductFilter(
                                                        selectedFilter);
                                              },
                                            ),
                                          ),
                                        );
                                      },
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(
                                            CustomIcons.filter,
                                            width: 28,
                                            height: 28,
                                          ),
                                          const Gap(8),
                                          Text(
                                            "Filter",
                                            style: textTheme.bodyLarge,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Gap(16),
                              
                productsListProvider.products.isEmpty ?
             const NoResults(text:"There are no products matching your filters and search!") :
                              Wrap(
                                spacing: 36,
                                runSpacing: 8,
                                children: [
                                  ...productsListProvider.products.map(
                                      (data) => ProductPreview(product: data))
                                ],
                              ),
                              if (productsListProvider.isLoadingMoreProducts)
                                const Positioned(
                                  bottom: 20,
                                  left: 0,
                                  right: 0,
                                  child: AgroLoadingIndicator(
                                    size: Size.medium,
                                  ),
                                ),
                            ],
                          ),
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
