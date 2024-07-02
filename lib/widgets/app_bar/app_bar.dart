import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../helpers/constants/custom_colors.dart';
import '../../providers/main_provider.dart';

class AgroAppBar extends StatelessWidget {
  const AgroAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final mainProvider = Provider.of<MainProvider>(context, listen: false);
    final String username = mainProvider.user!.username;

    return AppBar(
      title: const Text("EAgro"),
      backgroundColor: CustomColors.jadeGreen[600],
      leading: Row(
        children: [
          const Icon(Icons.local_grocery_store),
          const Gap(4),
          Text(username)
        ],
      ),
    );
  }
}
