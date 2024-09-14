import 'package:flutter/material.dart';
import 'package:eagro/providers/main_provider.dart';
import 'package:eagro/screens/cart_screen/cart_providers/cart_provider.dart';
import 'package:eagro/screens/cart_screen/cart_screen.dart';
import 'package:provider/provider.dart';

import '../helpers/constants/custom_colors.dart';

class CartIcon extends StatelessWidget {
  const CartIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final mainProvider = Provider.of<MainProvider>(context, listen: false);

    return Stack(
      children: [
        Padding(
            padding: const EdgeInsets.only(
              right: 8,
            ),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ChangeNotifierProvider(
                          create: (context) =>
                              CartProvider(userUuid: mainProvider.user!.id),
                          child: const CartScreen(),
                        )));
              },
              icon: const Icon(
                Icons.local_grocery_store,
                color: Colors.white,
                size: 32,
              ),
            )),
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
        style: textTheme.bodySmall!.copyWith(
          color: CustomColors.jadeGreen[900]!,
        ),
      ),
    );
  }
}
