import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../helpers/constants/custom_colors.dart';

enum Size {
  small,
  medium,
  large,
}

class AgroLoadingIndicator extends StatelessWidget {
  const AgroLoadingIndicator({
    super.key,
    this.visible = true,
    this.size = Size.large,
  });

  final bool visible;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: Center(
        child: SpinKitWaveSpinner(
          color: CustomColors.jadeGreen[500]!,
          size: _getSize(size),
        ),
      ),
    );
  }

  _getSize(Size value) {
    switch (value) {
      case Size.large:
        return 56.0;

      case Size.medium:
        return 46.0;

      case Size.small:
        return 36.0;
    }
  }
}
