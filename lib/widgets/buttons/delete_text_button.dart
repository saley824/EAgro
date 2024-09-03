import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

// todo sasa probably delete
class TextIconButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;

  const TextIconButton({
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
            Icon(
              Icons.delete,
              color: Colors.red[500],
            ),
            const Gap(4),
            Text(
              text,
              style: textTheme.labelLarge!.copyWith(color: Colors.red[500]),
            ),
          ],
        ),
      ),
    );
  }
}
