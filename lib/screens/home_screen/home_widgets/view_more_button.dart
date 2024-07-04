import 'package:flutter/material.dart';
import 'package:msan/screens/products_list_screen/products_list_screen.dart';

import '/helpers/constants/custom_colors.dart';

class ViewMoreButton extends StatelessWidget {
  const ViewMoreButton({super.key});

  @override
  Widget build(BuildContext context) {
    final globalAppNavigator = Navigator.of(context);
    final textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: () {
        globalAppNavigator.push(MaterialPageRoute(
          builder: (context) => const ProductsListScreen(),
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
