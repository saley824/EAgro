import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import '/helpers/styles/custom_themes.dart';
import 'helpers/http_api.dart';
import 'providers/main_provider.dart';
import 'screens/welcome/welcome_provider.dart';
import 'screens/welcome/welcome_screen.dart';

void main() {
  //   WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
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
          //---------------------------------Corect version---------------------------------
          body: ChangeNotifierProvider(
            create: (context) => WelcomeProvider(),
            child: const WelcomeScreen(),
          ),
          //---------------------------------Corect version---------------------------------

          // body: ChangeNotifierProvider(
          //   create: (context) => CartProvider(),
          //   child: const CartScreen(),
          // ),

          // body: ChangeNotifierProvider(
          //   create: (context) => HomeScreenProvider(),
          //   child: const HomeScreen(),
          // ),
          // body: ChangeNotifierProvider(
          //   create: (context) => ProductsListProvider(
          //     productFilter: ProductFilterModel(),
          //     sortModel: SortModel(sortBy: "createdAt", orderBy: "desc"),
          //   ),
          //   child: const ProductsListScreen(),
          // ),
          // body: Test()
          // body: ChangeNotifierProvider(
          //   create: (context) => AddProductProvider(),
          //   child: const AddProductScreen(),
          // ),
        ),
        builder: (context, home) {
          HttpAPI.context = context;
          return home!;
        });
  }
}
