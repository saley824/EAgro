import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:eagro/models/address_model.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

import '/models/user_model.dart';
import '/providers/main_provider.dart';
import '/screens/login_screen/login_providers/login_service.dart';
import '/services/user_service.dart';

class WelcomeProvider extends ChangeNotifier {
  Future<bool> autoLogin(BuildContext context) async {
    final mainProvider = Provider.of<MainProvider>(context, listen: false);

    Tuple2<bool, String?> pair = await LoginService.autoLogin();
    bool isAccessActive = pair.item1;
    String? token = pair.item2;

    if (token == "" || token == null) {
      return false;
    }
    if (isAccessActive) {
      var decodedToken = JwtDecoder.decode(token);
      UserModel? userModel =
          await UserService.getUser(id: decodedToken["id"].toString());
      AddressModel? address =
          await UserService.getUserAddress(id: decodedToken["id"].toString());
      mainProvider.user = userModel;
      mainProvider.user?.address = address;
    }

    //---------------------------------SET USER IN MAIN PROVIDER---------------------------------
    await Future.delayed(const Duration(milliseconds: 3000));
    return isAccessActive;
  }
}
