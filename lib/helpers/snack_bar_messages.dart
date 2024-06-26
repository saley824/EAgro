import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'constants/custom_colors.dart';

class SnackBarMessage {
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showMessage({
    required BuildContext context,
    required String text,
    required bool isError,
  }) {
    final ThemeData appTheme = Theme.of(context);
    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        margin: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 16,
        ),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              fit: FlexFit.tight,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: CustomColors.gray[950]!.withOpacity(0.08),
                  ),
                ),
                child: Row(
                  children: [
                    isError
                        ? Icon(
                            Icons.close,
                            color: CustomColors.red[500],
                          )
                        : Icon(
                            Icons.check,
                            color: CustomColors.green[500],
                          ),
                    const Gap(8),
                    Expanded(
                      child: Text(
                        text,
                        style: appTheme.textTheme.labelMedium!,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
