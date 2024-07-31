import 'package:flutter/material.dart';

import '/helpers/constants/custom_colors.dart';

class PlusItem extends StatelessWidget {
  final VoidCallback onTap;

  const PlusItem({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
              border: Border.all(
                color: CustomColors.jadeGreen[400]!,
              ),
            ),
            child: Icon(
              Icons.add,
              color: CustomColors.jadeGreen[400],
            )));
  }
}
