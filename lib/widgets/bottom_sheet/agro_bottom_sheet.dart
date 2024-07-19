import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '/helpers/constants/custom_colors.dart';

/// Where there is input field bottom sheet need to pop up above keyboard
class AgroBottomSheet {
  static showBottomSheet({
    required BuildContext context,
    required Widget child,
    EdgeInsets? padding,
    String? title,
    bool enableGrayIndicator = true,
    bool enableCloseButton = false,
    bool enableHorizontalDivider = true,
    VoidCallback? whenComplete,
  }) =>
      showModalBottomSheet(
        context: context,
        isDismissible: true,
        enableDrag: true,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) => Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: SingleChildScrollView(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (enableGrayIndicator)
                    Container(
                      margin: const EdgeInsets.only(top: 8, bottom: 12),
                      width: 64,
                      height: 4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        color: CustomColors.gray.shade300,
                      ),
                    )
                  else
                    const SizedBox(height: 16),
                  if (title != null)
                    Row(
                      children: [
                        if (enableCloseButton)
                          const SizedBox(
                            width: 40,
                          ),
                        Expanded(
                          child: Text(
                            title,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ),
                        // if (enableCloseButton)
                        //   EcommSimpleIconButton(
                        //     icon: CustomIcons.close,
                        //     onTap: () => Navigator.pop(context),
                        //   )
                      ],
                    ),
                  const Gap(8),
                  Container(
                    padding: padding ??
                        const EdgeInsets.only(left: 16, right: 16, bottom: 24),
                    child: child,
                  ),
                ],
              ),
            ),
          ),
        ),
      ).whenComplete(() {
        if (whenComplete != null) {
          whenComplete();
        }
      });
}
