import 'package:flutter/material.dart';

import '/helpers/constants/custom_colors.dart';

class ViewMoreButton extends StatelessWidget {

   final VoidCallback onTap;
  const ViewMoreButton(
      {super.key,  required this.onTap,});

  @override
  Widget build(BuildContext context) {
    final globalAppNavigator = Navigator.of(context);
    final textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: onTap,
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
