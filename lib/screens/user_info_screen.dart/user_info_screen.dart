import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:msan/helpers/constants/custom_colors.dart';
import 'package:msan/helpers/helper_functions.dart';
import 'package:msan/widgets/column_info_field.dart';
import 'package:msan/widgets/divider/divider.dart';

class UserInfoScreen extends StatelessWidget {
  const UserInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HelperFunctions.getSubAppBar(context, "User info"),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ColumnInfoField(property: "Name", value: "Aleksandar"),
            const AgroDivider(margin: EdgeInsets.symmetric(vertical: 12)),
            const ColumnInfoField(property: "Last name", value: "Obradovic"),
            const AgroDivider(margin: EdgeInsets.symmetric(vertical: 12)),
            const ColumnInfoField(property: "Username", value: "sasa"),
            const AgroDivider(margin: EdgeInsets.symmetric(vertical: 12)),
            const ColumnInfoField(
                property: "Email", value: "sasatest@gmail.com"),
            const AgroDivider(margin: EdgeInsets.symmetric(vertical: 12)),
            const Gap(16),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                  foregroundColor: CustomColors.jadeGreen[600],
                  padding: const EdgeInsets.fromLTRB(0, 8, 8, 8)),
              child: const Text("Change password"),
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                  foregroundColor: CustomColors.jadeGreen[600],
                  padding: const EdgeInsets.fromLTRB(0, 8, 8, 8)),
              child: const Text("Change address"),
            ),
          ],
        ),
      ),
    );
  }
}
