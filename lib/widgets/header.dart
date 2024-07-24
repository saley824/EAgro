import 'package:flutter/material.dart';

import '../helpers/constants/custom_colors.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return AppBar(
      title: Text(
        "EAgro",
        style: textTheme.headlineLarge!.copyWith(color: Colors.white),
      ),
      backgroundColor: CustomColors.jadeGreen[600],
      leading: InkWell(
          onTap: () {
            final globalAppNavigator = Navigator.of(context);
          },
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(
                  Radius.circular(999),
                ),
                border: Border.all(
                  color: CustomColors.gray[950]!.withOpacity(0.08),
                ),
              ),
              child: Icon(
                Icons.arrow_back,
                color: CustomColors.gray[400],
              ))),
      actions: const [
        Padding(
            padding: EdgeInsets.only(
              right: 8,
            ),
            child: Icon(
              Icons.menu,
              color: Colors.white,
              size: 36,
            )),
        // Icon(Icons.local_grocery_store, color: Colors.white),
      ],
    );
  }
}
