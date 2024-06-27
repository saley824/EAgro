import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/main_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mainProvider = Provider.of<MainProvider>(context, listen: false);

    return Scaffold(
        appBar: AppBar(
          title: Text("EAgro, username: ${mainProvider.user!.username}"),
        ),
        body: const Center(
          child: Text("HomeScreen"),
        ));
  }
}
