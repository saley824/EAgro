import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../../../helpers/constants/custom_colors.dart';
import '../../../widgets/buttons/agro_button.dart';
import '/screens/shop_screens/add_product/add_product_providers/add_product_provider.dart';
import '/widgets/drop_down/agro_dropdown.dart';
import '/widgets/input_fields/agro_input_field.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final addProductProvider = context.read<AddProductProvider>();
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            // color: CustomColors.jadeGreen[50],
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  "Add new product",
                  style: textTheme.headlineMedium!.copyWith(
                    color: CustomColors.jadeGreen[800],
                  ),
                ),
                const Gap(24),
                AgroInputField(
                  labelVisible: true,
                  hintText: "Name",
                  textEditingController: addProductProvider.nameController,
                ),
                const Gap(20),
                AgroInputField(
                  labelVisible: true,
                  hintText: "Description",
                  textEditingController:
                      addProductProvider.descriptionController,
                ),
                const Gap(20),
                AgroDropdown(
                  hintText: "Select super category",
                  dropDownElements: addProductProvider.superCategories,
                  onSelect: (selected) {
                    addProductProvider.setSuperCategory(selected);
                  },
                ),
                const Gap(20),
                AgroDropdown(
                  hintText: "Select category",
                  dropDownElements: addProductProvider.subCategories,
                  onSelect: (selected) {
                    addProductProvider.setSubCategory(selected);
                  },
                  isDisabled: addProductProvider.subCategories == null,
                ),
                const Gap(20),
                AgroDropdown(
                  hintText: "Select unit",
                  dropDownElements: addProductProvider.unitTypes,
                  onSelect: (selected) {
                    // addProductProvider.setUnit(selected);
                  },
                ),
                const Gap(20),
                AgroInputField(
                  labelVisible: true,
                  numberInputType: true,
                  hintText: "Total amount",
                  textEditingController:
                      addProductProvider.totalAmountController,
                ),
                const Gap(20),
                AgroInputField(
                  labelVisible: true,
                  numberInputType: true,
                  hintText: "Quantity",
                  textEditingController: addProductProvider.quantityController,
                ),
                const Gap(20),
                AgroInputField(
                  labelVisible: true,
                  numberInputType: true,
                  hintText: "Price",
                  textEditingController: addProductProvider.priceController,
                ),
                const Gap(20),
                AgroButton(
                  buttonColor: ButtonColor.jadeGreen,
                  disabled: false,
                  text: "Add new product",
                  onTap: () {},
                ),
                const Gap(20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
//  price: double.parse(priceController.text),
//       totalAmount: int.parse(totalAmountController.text),
//       quantity: int.parse(quantityController.text),
//       unit: selectedUnit!.text,