import 'package:flutter/material.dart';
import 'package:msan/models/category_model/category_model.dart';
import 'package:provider/provider.dart';

import '../../../models/products_model/product_filter_model.dart';
import '../../products_list_screen/products_list_models/sort_model.dart';
import '/helpers/constants/custom_colors.dart';
import '/screens/products_list_screen/products_list_providers/products_list_provider.dart';
import '/screens/products_list_screen/products_list_screen.dart';

class ViewMoreButton extends StatelessWidget {
  const ViewMoreButton({super.key});

  @override
  Widget build(BuildContext context) {
    final globalAppNavigator = Navigator.of(context);
    final textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: () {
        globalAppNavigator.push(MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
            create: (context) => ProductsListProvider(
              productFilter: ProductFilterModel(
                  fromPrice: 10,
                  toPrice: 1000,
                  hasDiscount: true,
                  superCategory: CategoryModel(
                      id: "be2597cb-f543-4bea-bd35-a95baa01b6b1",
                      name: "Kategorija1"),
                  category: CategoryModel(
                      id: "fc418cb3-fa3d-4507-882b-a20c93784fbb",
                      name: "Kategorija22")),
              sortModel: SortModel(sortBy: "createdAt", orderBy: "desc"),
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
