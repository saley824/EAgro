import 'package:flutter/material.dart';

import '../../helpers/constants/custom_colors.dart';

class AgroDivider extends StatelessWidget {
  final EdgeInsets margin;
  const AgroDivider({
    super.key,
    required this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      color: CustomColors.gray[200],
      width: double.infinity,
      height: 1,
    );
  }
}
