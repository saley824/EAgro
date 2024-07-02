import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/bottom_sheet/agro_bottom_sheet.dart';
import '../widgets/buttons/agro_add_button.dart';
import 'shop_screens/add_discount.dart/add_discount_bottom_sheet.dart';
import 'shop_screens/add_discount.dart/add_discount_providers/add_discount_provider.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AgroAddButton(
            text: "Add discount",
            onTap: () {
              AgroBottomSheet.showBottomSheet(
                title: "Add discount",
                context: context,
                child: ChangeNotifierProvider(
                    create: (context) => AddDiscountProvider(),
                    child: const AddDiscountBottomSheet()),
              );
            },
          )
        ],
      ),
    );
  }
}
