import 'package:flutter/material.dart';

import '../../../helpers/constants/custom_colors.dart';

class MinusItem extends StatelessWidget {
  final VoidCallback onTap;
  const MinusItem({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
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
            color: CustomColors.gray[950]!.withOpacity(0.08),
          ),
        ),
        child: Icon(
          Icons.remove,
          color: CustomColors.gray[400],
        ),
      ),
    );
  }
}
