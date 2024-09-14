import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:eagro/helpers/constants/custom_colors.dart';

class ColumnInfoField extends StatelessWidget {
  final String property;
  final String value;
  const ColumnInfoField({
    super.key,
    required this.property,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          property,
          style: textTheme.labelMedium!.copyWith(color: CustomColors.gray[400]),
        ),
        const Gap(2),
        Text(
          value,
          style: textTheme.bodyLarge,
        ),
      ],
    );
  }
}
