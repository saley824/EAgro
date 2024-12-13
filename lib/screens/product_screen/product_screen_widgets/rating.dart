import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gap/gap.dart';
import 'package:eagro/providers/main_provider.dart';
import 'package:provider/provider.dart';

import '/helpers/constants/custom_colors.dart';
import '/widgets/bottom_sheet/agro_bottom_sheet.dart';
import '../product_providers/product_provider.dart';
import 'rating_bottom_sheet.dart';

class Rating extends StatelessWidget {
  const Rating({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    final mainProvider = Provider.of<MainProvider>(context, listen: false);
    return InkWell(
      onTap: () {
        if (!mainProvider.isShop()) {
          AgroBottomSheet.showBottomSheet(
              title: "Ocijeni proizvod",
              context: context,
              child: ChangeNotifierProvider.value(
                  value: productProvider,
                  child:
                      // ignore: prefer_const_constructors
                      RatingBottomSheet()));
        }
      },
      child: Row(
        children: [
          RatingBarIndicator(
            rating: productProvider.product!.avgReview ?? 0.0,
            itemCount: 5,
            itemSize: 16,
            itemBuilder: (_, __) => Icon(
              Icons.star,
              color: CustomColors.yellow.shade500,
            ),
          ),
          const Gap(2),
          Text(
            "(${productProvider.product!.countReview.round()})",
            style: textTheme.bodyLarge!.copyWith(
              color: CustomColors.gray[500],
            ),
          ),
        ],
      ),
    );
  }
}
