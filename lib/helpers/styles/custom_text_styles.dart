// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

extension CustomTextStyles on TextTheme {
  //xxs
  TextStyle get xxs_regular =>
      const TextStyle(fontSize: 11.0, fontWeight: FontWeight.w400);
  TextStyle get xxs_medium =>
      const TextStyle(fontSize: 11.0, fontWeight: FontWeight.w500);
  //xs
  TextStyle get xs_regular =>
      const TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400);

  TextStyle get xs_medium =>
      const TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500);
  TextStyle get xs_semibold =>
      const TextStyle(fontSize: 12.0, fontWeight: FontWeight.w600);
  //sm
  TextStyle get sm_regular =>
      const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400);
  TextStyle get sm_medium =>
      const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500);
  TextStyle get sm_semibold =>
      const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600);
  //base
  TextStyle get base_regular =>
      const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400);
  TextStyle get base_medium =>
      const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500);
  TextStyle get base_semibold =>
      const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600);
  //lg
  TextStyle get lg_semibold =>
      const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600);
  //xl
  TextStyle get xl_semibold =>
      const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600);
  //xxl
  TextStyle get xxl_semibold =>
      const TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600);
}
