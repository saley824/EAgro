import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:msan/models/products_model/product_filter_model.dart';
import 'package:msan/screens/home_screen/home_screen.dart';
import 'package:msan/screens/products_list_screen/products_list_models/sort_model.dart';
import 'package:msan/screens/products_list_screen/products_list_providers/products_list_provider.dart';
import 'package:msan/screens/products_list_screen/products_list_screen.dart';
import 'package:provider/provider.dart';

import '/helpers/styles/custom_themes.dart';
import 'providers/main_provider.dart';

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
        home: const Scaffold(
            resizeToAvoidBottomInset: false,
            // body: ChangeNotifierProvider(
            //   create: (context) => WelcomeProvider(),
            //   child: const WelcomeScreen(),
            // ),

            body: HomeScreen()
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
            ));
  }
}
