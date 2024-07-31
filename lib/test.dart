import 'package:flutter/material.dart';

import 'helpers/helper_functions.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HelperFunctions.getAppBar(context),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 50),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Wrap(
                spacing: 16,
                runSpacing: 8,
                children: [
                  //     ProductPreview(
                  //       hasDiscount: true,
                  //     ),
                  //     ProductPreview(),
                  //     ProductPreview(),
                  //   ],
                  // ),
                  // HomeProductHorizontal(
                  //   title: "Products",
                  //   productsList: [
                  //     ProductPreview(
                  //       hasDiscount: true,
                  //     ),
                  //     ProductPreview(),
                  //     ProductPreview(),
                  //     ProductPreview(
                  //       hasDiscount: true,
                  //     ),
                  //     ProductPreview(),
                  //     ProductPreview(),
                  //     ProductPreview(
                  //       hasDiscount: true,
                  //     ),
                  //     ProductPreview(),
                  //     ProductPreview(),
                  //     ProductPreview(
                  //       hasDiscount: true,
                  //     ),
                  //     ProductPreview(),
                  //     ProductPreview(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
