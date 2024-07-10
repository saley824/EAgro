import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../models/products_model/product_list_model.dart';
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
    log('DEV LOG------------------------------------------------------------------');
    log(productsList.length.toString());
    final textTheme = Theme.of(context).textTheme;
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
            Row(
              children: [
                const Gap(12),
                Text(
                  title,
                  style: textTheme.titleMedium!.copyWith(fontSize: 18),
                ),
              ],
            ),
            Row(
              children: [
                ViewMoreButton(
                  productFilterModel: productFilterModel,
                  sortModel: sortModel,
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
                // productsList
                //     .expand((product) => [
                //           if (productsList.first == product) const Gap(16),
                //           Padding(
                //             padding: EdgeInsets.only(
                //               right: productsList.last != product ? 0 : 16,
                //             ),
                //             child: EcommProduct(data: product),
                //           ),
                //           if (productsList.last != product) const Gap(16),
                //         ])
                //     .toList(),
                ))
      ],
    );
  }
}
