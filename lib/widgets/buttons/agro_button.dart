import 'package:flutter/material.dart';
import 'package:msan/helpers/constants/custom_colors.dart';

class AgroButton extends StatelessWidget {
  final String text;
  final bool disabled;
  const AgroButton({
    super.key,
    required this.text,
    this.disabled = false,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: disabled
              ? CustomColors.gray[100]!.withOpacity(0.5)
              : CustomColors.gray[100],
          foregroundColor: Colors.black,
          textStyle: textTheme.bodyLarge!.copyWith(
            color: Colors.black,
          ),
        ),
        child: Text(text),
      ),
    );
  }
}
