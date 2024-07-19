import 'package:flutter/material.dart';

import '/helpers/constants/custom_colors.dart';

class AgroModal {
  /// - [header] The header of the modal, of type => [EcommScreenHeader]
  /// - [padding] is applied to the child widget only
  static Future<T?> showECommDialog<T>({
    required BuildContext context,
    required Widget child,
    EdgeInsetsGeometry padding =
        const EdgeInsets.only(left: 24, right: 24, bottom: 24, top: 32),
    bool dismissible = true,
  }) =>
      showDialog(
        barrierDismissible: dismissible,
        context: context,
        builder: (BuildContext context) {
          double height = MediaQuery.of(context).size.height;
          return Dialog(
            clipBehavior: Clip.antiAlias,
            backgroundColor: CustomColors.jadeGreen[600],
            insetPadding: const EdgeInsets.symmetric(horizontal: 10),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: 0.75 * height,
              ),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: SingleChildScrollView(
                        padding: padding,
                        child: child,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
}
