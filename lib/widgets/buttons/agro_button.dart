import 'package:flutter/material.dart';
import 'package:eagro/widgets/buttons/button_helper.dart';

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
  final EdgeInsetsGeometry? padding;

  const  AgroButton({
    super.key,
    required this.text,
    this.disabled = false,
    this.buttonColor = ButtonColor.white,
    this.onTap,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    Color colorBtn = ButtonHelper.getButtonColor(buttonColor);
    Color textColor = ButtonHelper.getTextColor(buttonColor);
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: SizedBox(
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
          child: Text(
            textAlign: TextAlign.center,
            text),
        ),
      ),
    );
  }
}
