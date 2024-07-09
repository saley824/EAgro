import 'package:flutter/material.dart';

import '../../helpers/constants/custom_colors.dart';

class DiscountBadge extends StatelessWidget {
  final int percentage;
  const DiscountBadge({super.key, required this.percentage});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      width: 32,
      height: 24,
      decoration: BoxDecoration(
        color: CustomColors.red[500],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          textAlign: TextAlign.center,
          "${percentage.toString()}%",
          style: textTheme.labelSmall!.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
