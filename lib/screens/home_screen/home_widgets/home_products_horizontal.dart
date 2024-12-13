import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../models/products_model/product_list_model.dart';
import '../../products_list_screen/products_list_providers/products_list_provider.dart';
import '../../products_list_screen/products_list_screen.dart';
import '/models/products_model/product_filter_model.dart';
import '/screens/products_list_screen/products_list_models/sort_model.dart';
import '/widgets/products/product_preview/product_preview.dart';
import 'view_more_button.dart';

class HomeProductHorizontal extends StatelessWidget {
  final SortModel sortModel;
  final ProductFilterModel productFilterModel;

  /// section of more items from the shop of the current listing
  const HomeProductHorizontal({
    super.key,
    required this.title,
    required this.productsList,
    required this.sortModel,
    required this.productFilterModel,
    // this.onViewAll,
  });
  final String title;
  final List<ProductListModel> productsList;
  // final VoidCallback? onViewAll;

  @override
  Widget build(BuildContext context) {
    log(productsList.length.toString());
    
    final textTheme = Theme.of(context).textTheme;
        final globalAppNavigator = Navigator.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // EcommSectionHeader(
        //   title: title,
        //   onTap: onViewAll,
        // ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Row(
                children: [
                  const Gap(12),
                  Flexible(
                    child: Text(
                      title,
                      style: textTheme.titleMedium!.copyWith(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                ViewMoreButton(
                  onTap: () {
                        globalAppNavigator.push(MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
            create: (context) => ProductsListProvider(
              initProductFilter: productFilterModel,
              initSortModel: sortModel,
            ),
            child: const ProductsListScreen(),
          ),
        ),);
                  },
                  
                ),
                const Gap(12),
              ],
            ),
          ],
        ),
        const Gap(12),
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              ...productsList.map((e) {
                return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: ProductPreview(
                      product: e,
                    ));
              })
            ]

                ))
      ],
    );
  }
}
