import 'package:flutter/material.dart';

import 'widgets/drop_down/agro_dropdown.dart';
import 'widgets/drop_down/drop_down_model/agro_dropdown_model.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AgroDropdown(
          hintText: "Label",
          // isExpanded: true,
          onSelect: (selected) {},
          dropDownElements: [
            AgroDropdownModel(
              id: "1",
              value: 1,
              text: "Test1",
            ),
            AgroDropdownModel(
              id: "2",
              value: 2,
              text: "Test2",
            ),
            AgroDropdownModel(
              id: "3",
              value: 3,
              text: "Test3",
            ),
            AgroDropdownModel(
              id: "4",
              value: 4,
              text: "Test4",
            ),
          ],
        ),
      ),
    );
  }
}
