import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '/helpers/constants/custom_colors.dart';

class HelperFunctions {
  static getBackGroundGradient() {
    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        CustomColors.jadeGreen[300]!,
        CustomColors.jadeGreen[200]!,
        CustomColors.jadeGreen[100]!,
      ],
    );
  }

  static callMethodWithLoadingDialog({
    required BuildContext context,
    required Function callback,
    Function? onFinished,
    bool barrierDismissible = false,
    String message = "Loading",
  }) async {
    showDialog(
        barrierDismissible: barrierDismissible,
        context: context,
        builder: (_) => PopScope(
              canPop: false,
              child: Center(
                child: Material(
                  color: Colors.transparent,
                  child: Container(
                    height: 140,
                    width: 200,
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          message,
                          style: TextStyle(
                              fontSize: 25, color: CustomColors.jadeGreen[500]),
                        ),
                        const SizedBox(height: 12),
                        SpinKitWaveSpinner(
                          color: CustomColors.jadeGreen[500]!,
                          size: 56.0,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ));

    await callback();
    // ignore: use_build_context_synchronously
    Navigator.of(context).pop();

    if (onFinished != null) {
      onFinished();
    }
  }
}
