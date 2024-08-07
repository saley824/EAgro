import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../home_screen/home_screen_providers/home_screen_provider.dart';
import '../login_screen/login_providers/login_provider.dart';
import '../login_screen/login_screen.dart';
import '/screens/home_screen/home_screen.dart';
import '/screens/welcome/init_splash_screen.dart';
import '/screens/welcome/welcome_provider.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final welcomeProvider =
        Provider.of<WelcomeProvider>(context, listen: false);

    return FutureBuilder(
      future: welcomeProvider.autoLogin(context),
      builder: (context, AsyncSnapshot snapshot) =>
          snapshot.connectionState == ConnectionState.waiting
              ? const InitSplashScreen()
              : snapshot.data
                  ? ChangeNotifierProvider(
                      create: (context) => HomeScreenProvider(),
                      child: const HomeScreen(),
                    )
                  : ChangeNotifierProvider(
                      create: (BuildContext context) => LoginProvider(),
                      child: const LoginScreen(),
                    ),
    );
  }
}
