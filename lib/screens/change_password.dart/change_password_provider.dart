import 'package:flutter/material.dart';
import 'package:eagro/services/user_service.dart';

class ChangePasswordProvider extends ChangeNotifier {
  final String userId;

  ChangePasswordProvider({
    required this.userId,
  });
  final oldPasswordController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  Future<bool> changePassword() async {
    return await UserService.changePassword(
      oldPassword: oldPasswordController.text,
      password: passwordController.text,
      confirmPassword: confirmPasswordController.text,
      userId: userId,
    );
  }

  void refresh() {
    notifyListeners();
  }
}
