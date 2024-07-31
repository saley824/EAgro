import 'package:flutter/material.dart';
import 'package:msan/widgets/buttons/button_helper.dart';

enum ButtonColor {
  white,
  jadeGreen,
  red,
  blue,
  yellow,
}

class AgroButton extends StatelessWidget {
  final String text;
  final bool disabled;
  final VoidCallback? onTap;
  final ButtonColor buttonColor;

  const AgroButton({
    super.key,
    required this.text,
    this.disabled = false,
    this.buttonColor = ButtonColor.white,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    Color colorBtn = ButtonHelper.getButtonColor(buttonColor);
    Color textColor = ButtonHelper.getTextColor(buttonColor);
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            backgroundColor: !disabled ? colorBtn : colorBtn.withOpacity(0.5),
            foregroundColor: textColor,
            textStyle: textTheme.bodyLarge!),
        child: Text(text),
      ),
    );
  }
}
