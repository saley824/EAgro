import 'package:eagro/helpers/constants/custom_colors.dart';
import 'package:flutter/material.dart';

import 'helpers/helper_functions.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HelperFunctions.getAppBar(context),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 50),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  const Text(
                    "Prikaz nekog teksta",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      backgroundColor: Colors.black45,
                      fontSize: 14,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // neka akcija
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text("Dugme"),
                  ),
                ],
              ),
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

