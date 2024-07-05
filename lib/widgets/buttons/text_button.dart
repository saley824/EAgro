import 'package:flutter/material.dart';

class AgroTextButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final Color? color;

  const AgroTextButton({
    super.key,
    required this.text,
    this.onTap,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(
          1,
        ),
        child: Text(
          text,
          style: textTheme.displayMedium!.copyWith(
            color: color,
          ),
        ),
      ),
    );
  }
}
