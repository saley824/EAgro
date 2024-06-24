import 'package:flutter/material.dart';
import 'package:msan/helpers/constants/custom_colors.dart';

class HelperFunctions {
  static getBackGroundGradient() {
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        CustomColors.jadeGreen[300]!,
        CustomColors.jadeGreen[200]!,
        CustomColors.jadeGreen[100]!,
      ],
    );
  }
}
