import 'package:flutter/material.dart';

import '../../helpers/constants/custom_colors.dart';

class InitSplashScreen extends StatefulWidget {
  const InitSplashScreen({super.key});

  @override
  State<InitSplashScreen> createState() => _InitSplashScreenState();
}

class _InitSplashScreenState extends State<InitSplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  // bool _isScaled = false;
  bool doAnimation = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));
  }

  @override
  void dispose() {
    doAnimation = false;
    _controller.dispose();
    super.dispose();
  }

  // void startGame() {
  //   Timer.periodic(
  //     const Duration(seconds: 1),
  //     (Timer timer) {
  //       if (doAnimation) {
  //         _isScaled = !_isScaled;
  //         _isScaled ? _controller.repeat() : _controller.repeat();
  //       }
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // startGame();
    });
    // final localization = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: CustomColors.jadeGreen,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.all(8.0),
              child:
                  // ScaleTransition(
                  //     scale: Tween(begin: 0.0, end: 1.0).animate(_controller),
                  //     child:    const Icon(
                  //   Icons.local_grocery_store,
                  // ),),
                  const Icon(
                Icons.local_grocery_store,
                size: 40,
              ),
            ),
            const SizedBox(height: 8),
            const Text("Učitavanje..."),
          ],
        ),
      ),
    );
  }
}
