import 'package:flutter/material.dart';
import '/models/user_model.dart';

class MainProvider extends ChangeNotifier {
  UserModel? user;

  bool isShop() {
    return user?.isShop ?? false;
  }

  String getId() {
    return user?.id ?? "";
  }
}
