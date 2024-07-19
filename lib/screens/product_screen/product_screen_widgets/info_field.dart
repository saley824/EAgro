import 'package:flutter/material.dart';

class InfoField extends StatelessWidget {
  final String property;
  final String value;
  const InfoField({
    super.key,
    required this.property,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              property,
              style: textTheme.labelMedium,
            ),
            Text(
              value,
              style: textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
