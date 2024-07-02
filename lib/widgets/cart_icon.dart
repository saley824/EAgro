import 'package:flutter/material.dart';

import '../helpers/constants/custom_colors.dart';

class CartIcon extends StatelessWidget {
  const CartIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Padding(
          padding: EdgeInsets.only(
            right: 8,
          ),
          child: Icon(
            Icons.local_grocery_store,
            color: Colors.white,
            size: 32,
          ),
        ),
        Positioned(right: 0, top: 0, child: _getBadge(context)),
      ],
    );
  }

  _getBadge(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      width: 18,
      decoration: BoxDecoration(
        border: Border.all(
          width: 0.5,
          color: CustomColors.gray[300]!,
        ),
        color: Colors.white,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        textAlign: TextAlign.center,
        "3",
        style: textTheme.bodyMedium!.copyWith(
          color: CustomColors.jadeGreen[900]!,
        ),
      ),
    );
  }
}
