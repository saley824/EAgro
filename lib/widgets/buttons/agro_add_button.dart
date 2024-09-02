import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '/helpers/constants/custom_colors.dart';

class TextIconButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final IconData icon;
  final Color? color;

  const TextIconButton({
    super.key,
    required this.text,
    this.onTap,
    required this.icon,
    this.color,
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
                  .copyWith(color: color ?? CustomColors.jadeGreen[600]),
            ),
            const Gap(4),
            Container(
              decoration: BoxDecoration(
                color: color ?? CustomColors.jadeGreen[500],
                borderRadius: BorderRadius.circular(999),
              ),
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
