import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:msan/widgets/buttons/agro_button.dart';

import 'view_more_button.dart';

class HomeProductHorizontal extends StatelessWidget {
  /// section of more items from the shop of the current listing
  const HomeProductHorizontal({
    super.key,
    required this.title,
    required this.productsList,
    // this.onViewAll,
  });
  final String title;
  final List<Widget> productsList;
  // final VoidCallback? onViewAll;

  @override
  Widget build(BuildContext context) {
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
            const Row(
              children: [
                ViewMoreButton(),
                Gap(12),
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
                    child: e);
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
