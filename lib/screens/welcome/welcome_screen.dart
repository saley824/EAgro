import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../login_screen/login_providers/login_provider.dart';
import '../login_screen/login_screen.dart';
import '/screens/home_screen/home_screen.dart';
import '/screens/login_screen/login_providers/login_service.dart';
import '/screens/welcome/init_splash_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: LoginService.autoLogin(),
      builder: (context, AsyncSnapshot snapshot) =>
          snapshot.connectionState == ConnectionState.waiting
              ? const InitSplashScreen()
              : snapshot.data
                  ? const HomeScreen()
                  : ChangeNotifierProvider(
                      create: (BuildContext context) => LoginProvider(),
                      child: const LoginScreen(),
                    ),
    );
  }
}
