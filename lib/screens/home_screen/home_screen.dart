import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:msan/helpers/helper_functions.dart';
import 'package:provider/provider.dart';

import '../../providers/main_provider.dart';
import '../../widgets/products/product_preview/product_preview.dart';
import 'home_widgets/home_products_horizontal.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mainProvider = Provider.of<MainProvider>(context, listen: false);

    return Scaffold(
        appBar: HelperFunctions.getAppBar(context),
        body: const SingleChildScrollView(
          child: Column(
            children: [
              Text("HomeScreen"),
              HomeProductHorizontal(
                title: "Products",
                productsList: [
                  ProductPreview(
                    hasDiscount: true,
                  ),
                  ProductPreview(),
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
                  ProductPreview(),
                  ProductPreview(
                    hasDiscount: true,
                  ),
                  ProductPreview(),
                  ProductPreview(),
                ],
              ),
              HomeProductHorizontal(
                title: "Products",
                productsList: [
                  ProductPreview(
                    hasDiscount: true,
                  ),
                  ProductPreview(),
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
                  ProductPreview(),
                  ProductPreview(
                    hasDiscount: true,
                  ),
                  ProductPreview(),
                  ProductPreview(),
                ],
              ),
              HomeProductHorizontal(
                title: "Products",
                productsList: [
                  ProductPreview(
                    hasDiscount: true,
                  ),
                  ProductPreview(),
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
                  ProductPreview(),
                  ProductPreview(
                    hasDiscount: true,
                  ),
                  ProductPreview(),
                  ProductPreview(),
                ],
              ),
            ],
          ),
        ));
  }
}
