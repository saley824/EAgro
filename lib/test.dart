import 'package:flutter/material.dart';
import 'package:msan/widgets/products/product_preview/product_preview.dart';

import 'helpers/helper_functions.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HelperFunctions.getAppBar(context),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 50),
        child: Wrap(
          spacing: 16,
          runSpacing: 8,
          children: [
            ProductPreview(
              hasDiscount: true,
            ),
            ProductPreview(),
            ProductPreview(),
          ],
        ),
      ),
    );
  }
}
