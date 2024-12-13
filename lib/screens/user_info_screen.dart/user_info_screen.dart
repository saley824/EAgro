import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '/helpers/constants/custom_colors.dart';
import '/helpers/helper_functions.dart';
import '/screens/add_address_screen.dart/add_address_screen.dart';
import '/screens/change_password.dart/change_password_provider.dart';
import '/screens/change_password.dart/change_password_screen.dart.dart';
import '/screens/login_screen/login_providers/login_service.dart';
import '/screens/user_info_screen.dart/user_info_providers/user_info_provider.dart';
import '/widgets/column_info_field.dart';
import '/widgets/divider/divider.dart';
import '../../providers/main_provider.dart';

class UserInfoScreen extends StatelessWidget {
  const UserInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mainProvider = Provider.of<MainProvider>(context, listen: false);
    final userInfoProvider = context.read<UserInfoProvider>();
    final textTheme = Theme.of(context).textTheme;
    final user = mainProvider.user;
    return Scaffold(
      appBar: HelperFunctions.getSubAppBar(
        context: context,
        title: "Osnovni podaci",
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Consumer<UserInfoProvider>(
          builder: (context, value, child) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if(!mainProvider.isShop())...[    ColumnInfoField(property: "Ime", value: user?.name ?? ""),
              const AgroDivider(margin: EdgeInsets.symmetric(vertical: 12)),
              ColumnInfoField(
                  property: "Prezime", value: user?.lastName ?? ""),
              const AgroDivider(margin: EdgeInsets.symmetric(vertical: 12)),],
          
              ColumnInfoField(
                  property: "Korisničko ime", value: user?.username ?? ""),
              const AgroDivider(margin: EdgeInsets.symmetric(vertical: 12)),
              ColumnInfoField(property: "Email", value: user?.email ?? ""),
              const AgroDivider(margin: EdgeInsets.symmetric(vertical: 12)),
                if(!mainProvider.isShop())...[        ColumnInfoField(
                property: "Adresa",
                value: user?.address != null
                    ? user?.address.toString() ?? ""
                    : "Adresa nije dodana!",
                textStyle: textTheme.bodyLarge?.copyWith(
                    fontStyle: FontStyle.italic, color: CustomColors.gray[500]),
              ),
              const AgroDivider(margin: EdgeInsets.symmetric(vertical: 12)),],
      
           
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ChangeNotifierProvider(
                          create: (context) => ChangePasswordProvider(
                                userId: mainProvider.user?.id ?? "",
                              ),
                          child: const ChangePassword()),
                    ),
                  );
                },
                style: TextButton.styleFrom(
                    foregroundColor: CustomColors.jadeGreen[600],
                    padding: const EdgeInsets.fromLTRB(0, 8, 8, 8)),
                child: const Text("Promijeni šifru"),
              ),
              if(!mainProvider.isShop())
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ChangeNotifierProvider.value(
                        value: userInfoProvider,
                        child: const AddAddressScreen(),
                      ),
                    ),
                  );
                },
                style: TextButton.styleFrom(
                    foregroundColor: CustomColors.jadeGreen[600],
                    padding: const EdgeInsets.fromLTRB(0, 8, 8, 8)),
                child: Text(
                    user?.address != null ? "Promijeni adresu" : "Dodaj adresu"),
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  LoginService.logOut(context);
                },
                child: Align(
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        size: 32,
                        Icons.logout,
                        color: Colors.red[600],
                      ),
                      const Gap(4),
                      Text(
                        "Odjavi se",
                        style: textTheme.headlineSmall
                            ?.copyWith(color: Colors.red[600]),
                      ),
                    ],
                  ),
                ),
              ),
              const Gap(20),
            ],
          ),
        ),
      ),
    );
  }
}
