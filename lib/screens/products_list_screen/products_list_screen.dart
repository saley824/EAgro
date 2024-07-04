import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:msan/widgets/drop_down/agro_dropdown.dart';
import 'package:msan/widgets/drop_down/drop_down_model/agro_dropdown_model.dart';
import 'package:msan/widgets/products/product_preview/product_preview.dart';

import '../../helpers/constants/custom_icons.dart';
import '../../helpers/helper_functions.dart';

class ProductsListScreen extends StatelessWidget {
  const ProductsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HelperFunctions.getAppBar(context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.sort),
                          Gap(4),
                          Text("Sort"),
                        ],
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            CustomIcons.filter,
                            width: 24,
                            height: 24,
                          ),
                          const Gap(4),
                          const Text("Filter"),
                        ],
                      ),
                    ],
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
