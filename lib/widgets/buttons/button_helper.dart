import 'package:flutter/material.dart';

import '../../helpers/constants/custom_colors.dart';
import 'agro_button.dart';

class ButtonHelper {
  static getButtonColor(ButtonColor color) {
    switch (color) {
      case ButtonColor.white:
        return CustomColors.gray[100];
      case ButtonColor.jadeGreen:
        return CustomColors.jadeGreen[500];
      case ButtonColor.red:
        return Colors.red[400];
      case ButtonColor.blue:
        return Colors.blue[500];
      case ButtonColor.yellow:
        return Colors.yellow[800];
    }
  }

  static getTextColor(ButtonColor color) {
    switch (color) {
      case ButtonColor.white:
        return Colors.black;
      case ButtonColor.jadeGreen:
        return Colors.white;
      case ButtonColor.red:
        return Colors.white;

      case ButtonColor.blue:
        return Colors.white;

      case ButtonColor.yellow:
        return Colors.white;
    }
  }
}
