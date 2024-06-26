import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:msan/helpers/constants/custom_colors.dart';

class AgroAddButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;

  const AgroAddButton({
    super.key,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Text(
              text,
              style: textTheme.labelLarge!
                  .copyWith(color: CustomColors.jadeGreen[600]),
            ),
            const Gap(4),
            Container(
              decoration: BoxDecoration(
                color: CustomColors.jadeGreen[500],
                borderRadius: BorderRadius.circular(999),
              ),
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
