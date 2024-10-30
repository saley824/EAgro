import 'package:flutter/material.dart';

class NoResults extends StatelessWidget {
  final String text;
  const NoResults({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Center(
      child: SizedBox(
        width: 250,
        child: Center(
          child: Text(
            text,
            style: textTheme.labelLarge,
          ),
        ),
      ),
    );
  }
}
