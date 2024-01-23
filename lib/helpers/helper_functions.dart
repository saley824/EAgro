import 'package:flutter/material.dart';
import 'package:msan/helpers/constants/custom_colors.dart';

class HelperFunctions {
  static getBackGroundGradient() {
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        CustomColors.green[100]!,
        CustomColors.green[600]!,
        CustomColors.green[100]!,
      ],
    );
  }
}
