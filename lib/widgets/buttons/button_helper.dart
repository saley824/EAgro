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
    }
  }

  static getTextColor(ButtonColor color) {
    switch (color) {
      case ButtonColor.white:
        return Colors.black;
      case ButtonColor.jadeGreen:
        return Colors.white;
    }
  }
}
