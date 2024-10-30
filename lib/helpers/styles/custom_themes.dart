import 'package:flutter/material.dart';

import '../constants/custom_colors.dart';

class CustomThemes {
  static const textFont = 'Inter';
  static ThemeData mainTheme = ThemeData(
      primarySwatch: CustomColors.red,
      appBarTheme: const AppBarTheme(
        backgroundColor: CustomColors.backgroundColor,
        elevation: 0,
        centerTitle: true,
      ),
      tabBarTheme: TabBarTheme(
        unselectedLabelColor: CustomColors.gray.shade500,
        labelColor: CustomColors.red.shade600,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(
            width: 3,
            color: CustomColors.red.shade600,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.symmetric(horizontal: 20),
        iconColor: CustomColors.gray.shade900,
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(
            width: 1,
            color: CustomColors.gray.shade200,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(
            width: 1,
            color: CustomColors.red.shade200,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(
            width: 1,
            color: CustomColors.gray.shade200,
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          elevation: WidgetStateProperty.all<double>(0),
          shape: WidgetStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(),
        displayMedium: TextStyle(),
        displaySmall: TextStyle(),
        headlineSmall: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          height: 32 / 24,
          color: CustomColors.textColor,
          letterSpacing: -0.47,
          leadingDistribution: TextLeadingDistribution.even,
        ),
        headlineMedium: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w600,
          height: 36 / 28,
          color: CustomColors.textColor,
          letterSpacing: -0.59,
        ),
        headlineLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w600,
          height: 40 / 32,
          color: CustomColors.textColor,
          letterSpacing: -0.69,
        ),
        titleLarge: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          height: 28 / 22,
          color: CustomColors.textColor,
          letterSpacing: -0.4,
          leadingDistribution: TextLeadingDistribution.even,
        ),
        titleMedium: TextStyle(
          fontSize: 16,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w600,
          height: 24 / 16,
          letterSpacing: -0.18,
          leadingDistribution: TextLeadingDistribution.even,
        ),
        titleSmall: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          height: 20 / 14,
          letterSpacing: -0.09,
          leadingDistribution: TextLeadingDistribution.even,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          height: 24 / 16,
          color: CustomColors.textColor,
          letterSpacing: -0.18,
          leadingDistribution: TextLeadingDistribution.even,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          height: 20 / 14,
          color: CustomColors.textColor,
          letterSpacing: -0.09,
          leadingDistribution: TextLeadingDistribution.even,
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          height: 16 / 12,
          color: CustomColors.textColor,
          letterSpacing: 0.01,
          leadingDistribution: TextLeadingDistribution.even,
        ),
        labelLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          height: 24 / 16,
          color: CustomColors.textColor,
          letterSpacing: -0.18,
          leadingDistribution: TextLeadingDistribution.even,
        ),
        labelMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          height: 20 / 14,
          color: CustomColors.textColor,
          letterSpacing: -0.09,
          leadingDistribution: TextLeadingDistribution.even,
        ),
        labelSmall: TextStyle(
          fontSize: 12.0,
          fontWeight: FontWeight.w500,
          height: 16 / 12,
          color: CustomColors.textColor,
          letterSpacing: 0.01,
          leadingDistribution: TextLeadingDistribution.even,
        ),
      ))
    ..addOwn(
      const OwnThemeFields(
        customTextStyle: TextStyle(
          fontFamily: textFont, //This is necessary for custom styles
          fontSize: 40.0,
          fontWeight: FontWeight.w500,
          height: 20 / 14,
          color: CustomColors.textColor,
          leadingDistribution: TextLeadingDistribution.even,
        ),
        inputFieldHintStyle: TextStyle(
          color: CustomColors.hintColor,
          fontSize: 16,
          height: 20 / 16,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
          leadingDistribution: TextLeadingDistribution.even,
        ),
        inputFieldTextStyle: TextStyle(
          fontSize: 16,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
          height: 20 / 16,
          letterSpacing: -0.18,
          leadingDistribution: TextLeadingDistribution.even,
        ),
        buttonTextStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 16,
          height: 24 / 16,
          letterSpacing: -0.18,
          leadingDistribution: TextLeadingDistribution.even,
        ),
        profileNameText: TextStyle(
          color: CustomColors.textColor,
        ),
        customLargeText: TextStyle(
          color: CustomColors.darkGrey,
          fontWeight: FontWeight.w600,
          fontSize: 20,
          height: 28 / 20,
          letterSpacing: -0.4,
          leadingDistribution: TextLeadingDistribution.even,
        ),
        campaignTextStyle: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          height: 16 / 14,
          letterSpacing: 1,
          leadingDistribution: TextLeadingDistribution.even,
        ),
        responseMessageTextStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 14,
          height: 20 / 14,
          fontStyle: FontStyle.italic,
          color: CustomColors.gray,
          letterSpacing: -0.09,
          leadingDistribution: TextLeadingDistribution.even,
        ),
        deelTextStyle: TextStyle(
          color: Color(0xFF009EA8),
          fontSize: 36,
          fontFamily: 'Dreaming Outloud Script',
          fontWeight: FontWeight.w400,
          height: 36 / 28,
          letterSpacing: -0.09,
        ),
      ),
    );
}

class OwnThemeFields {
  final TextStyle? customTextStyle;
  final TextStyle? inputFieldTextStyle;
  final TextStyle? inputFieldHintStyle;
  final TextStyle? buttonTextStyle;
  final TextStyle? profileNameText;
  final TextStyle? customLargeText;
  final TextStyle? campaignTextStyle;
  final TextStyle? responseMessageTextStyle;
  final TextStyle? deelTextStyle;

  const OwnThemeFields({
    required this.customTextStyle,
    required this.inputFieldTextStyle,
    required this.inputFieldHintStyle,
    required this.buttonTextStyle,
    required this.profileNameText,
    required this.customLargeText,
    required this.campaignTextStyle,
    required this.responseMessageTextStyle,
    required this.deelTextStyle,
  });

  factory OwnThemeFields.empty() {
    return const OwnThemeFields(
      customTextStyle: TextStyle(),
      inputFieldTextStyle: TextStyle(),
      inputFieldHintStyle: TextStyle(),
      buttonTextStyle: TextStyle(),
      profileNameText: TextStyle(),
      customLargeText: TextStyle(),
      campaignTextStyle: TextStyle(),
      responseMessageTextStyle: TextStyle(),
      deelTextStyle: TextStyle(),
    );
  }
}

extension ThemeDataExtensions on ThemeData {
  // ignore: prefer_final_fields
  static Map<InputDecorationTheme, OwnThemeFields> _own = {};

  void addOwn(OwnThemeFields own) {
    _own[inputDecorationTheme] = own;
  }

  static OwnThemeFields? empty;

  OwnThemeFields own() {
    var o = _own[inputDecorationTheme];

    return o!;
  }
}

OwnThemeFields ownTheme(BuildContext context) => Theme.of(context).own();
