import 'package:flutter/material.dart';

class RadioButtonModel {
  final String id;
  final dynamic value;
  final String text;
  final IconData? icon;

  RadioButtonModel({
    required this.id,
    required this.value,
    required this.text,
    this.icon,
  });

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is RadioButtonModel && id == other.id;
  }

  @override
  int get hashCode => Object.hash(id, id);
}
