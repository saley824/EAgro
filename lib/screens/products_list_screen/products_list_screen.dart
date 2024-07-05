import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:msan/widgets/input_fields/agro_input_field.dart';
import 'package:provider/provider.dart';

import '../../helpers/constants/custom_icons.dart';
import '../../helpers/helper_functions.dart';
import '/screens/products_list_screen/filter_bottom_sheet/filter_bottom_sheet.dart';
import '/screens/products_list_screen/filter_bottom_sheet/filter_providers/filter_provider.dart';
import '/screens/products_list_screen/products_list_providers/products_list_provider.dart';
import '/widgets/bottom_sheet/agro_bottom_sheet.dart';
import '/widgets/products/product_preview/product_preview.dart';
import '/widgets/radio_button_group/radio_button_group.dart';

class ProductsListScreen extends StatelessWidget {
  const ProductsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productsListProvider = context.read<ProductsListProvider>();
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: HelperFunctions.getAppBar(context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  const AgroInputField(
                    prefixIcon: Icon(Icons.search),
                    hintText: "Search",
                  ),
                  const Gap(18),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            AgroBottomSheet.showBottomSheet(
                              context: context,
                              child: RadioButtonGroup(
                                  radioButtons: productsListProvider.sorts),
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
                                create: (context) => FilterProvider(),
                                child: const FilterBottomSheet(),
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
                  const Wrap(
                    spacing: 36,
                    runSpacing: 8,
                    children: [
                      ProductPreview(
                        hasDiscount: true,
                      ),
                      ProductPreview(),
                      ProductPreview(
                        hasDiscount: true,
                      ),
                      ProductPreview(),
                      ProductPreview(),
                      ProductPreview(
                        hasDiscount: true,
                      ),
                      ProductPreview(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
