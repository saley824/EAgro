import 'package:flutter/material.dart';
import '/models/user_model.dart';

class BottomBarProvider extends ChangeNotifier {

  int cartCount = 0;
  UserModel? user;

  bool isShop() {
    return user?.isShop ?? false;
  }

  String getId() {
    return user?.id ?? "";
  }

  refresh() {
    notifyListeners();
  }
}
