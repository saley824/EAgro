import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/products_model/product_filter_model.dart';
import '../../products_list_screen/products_list_models/sort_model.dart';
import '/helpers/constants/custom_colors.dart';
import '/screens/products_list_screen/products_list_providers/products_list_provider.dart';
import '/screens/products_list_screen/products_list_screen.dart';

class ViewMoreButton extends StatelessWidget {
  final SortModel sortModel;
  final ProductFilterModel productFilterModel;
  const ViewMoreButton(
      {super.key, required this.sortModel, required this.productFilterModel});

  @override
  Widget build(BuildContext context) {
    final globalAppNavigator = Navigator.of(context);
    final textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: () {
        globalAppNavigator.push(MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
            create: (context) => ProductsListProvider(
              productFilter: productFilterModel,
              sortModel: sortModel,
            ),
            child: const ProductsListScreen(),
          ),
        ));
      },
      child: Container(
        width: 88,
        height: 24,
        decoration: BoxDecoration(
          border: Border.all(
            color: CustomColors.gray[950]!.withOpacity(0.12),
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        child: Center(
          child: Text(
            "View more",
            style:
                textTheme.bodyMedium!.copyWith(color: CustomColors.gray[700]),
          ),
        ),
      ),
    );
  }
}
