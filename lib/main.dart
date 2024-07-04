import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import '/helpers/styles/custom_themes.dart';
import 'providers/main_provider.dart';
import 'screens/welcome/welcome_provider.dart';
import 'screens/welcome/welcome_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => MainProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'EAGRO',
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en'),
        ],
        theme: CustomThemes.mainTheme,
        home: Scaffold(
          resizeToAvoidBottomInset: false,
          body: ChangeNotifierProvider(
            create: (context) => WelcomeProvider(),
            child: const WelcomeScreen(),
          ),
          // body: Test()
          // body: ChangeNotifierProvider(
          //   create: (context) => AddProductProvider(),
          //   child: const AddProductScreen(),
          // ),
        ));
  }
}
