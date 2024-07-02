import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:msan/widgets/loading_indicator/agro_loading_indicator.dart';
import 'package:provider/provider.dart';

import '../../../helpers/helper_functions.dart';
import '../../../helpers/snack_bar_messages.dart';
import '../../../widgets/app_bar/app_bar.dart';
import '/helpers/constants/custom_colors.dart';
import '/screens/shop_screens/add_product/add_product_providers/add_product_provider.dart';
import '/widgets/buttons/agro_button.dart';
import '/widgets/drop_down/agro_dropdown.dart';
import '/widgets/input_fields/agro_input_field.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final addProductProvider = context.read<AddProductProvider>();
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: HelperFunctions.getAppBar(context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            // color: CustomColors.jadeGreen[50],
            padding: const EdgeInsets.all(20),
            child: FutureBuilder(
              future: addProductProvider.getInitData(),
              builder: (context, snapshot) => snapshot.connectionState ==
                      ConnectionState.waiting
                  ? const AgroLoadingIndicator()
                  : Consumer<AddProductProvider>(
                      builder: (_, __, ___) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                            textEditingController:
                                addProductProvider.nameController,
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
                            dropDownElements:
                                addProductProvider.superCategories,
                            onSelect: (selected) {
                              addProductProvider.setSuperCategory(selected);
                            },
                          ),
                          const Gap(20),
                          AgroDropdown(
                            key: UniqueKey(),
                            hintText: "Select category",
                            dropDownElements: addProductProvider.subCategories,
                            onSelect: (selected) {
                              addProductProvider.setSubCategory(selected);
                            },
                            isDisabled:
                                addProductProvider.subCategories == null,
                          ),
                          const Gap(20),
                          AgroDropdown(
                            hintText: "Select unit",
                            dropDownElements: addProductProvider.unitTypes,
                            onSelect: (selected) {
                              addProductProvider.setUnit(selected);
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
                            textEditingController:
                                addProductProvider.quantityController,
                          ),
                          const Gap(20),
                          AgroInputField(
                            labelVisible: true,
                            numberInputType: true,
                            hintText: "Price",
                            textEditingController:
                                addProductProvider.priceController,
                          ),
                          const Gap(20),
                          AgroButton(
                              buttonColor: ButtonColor.jadeGreen,
                              disabled: false,
                              text: "Add new product",
                              onTap: () {
                                FocusManager.instance.primaryFocus?.unfocus();
                                bool success = false;
                                HelperFunctions.callMethodWithLoadingDialog(
                                    context: context,
                                    callback: () async {
                                      success =
                                          await addProductProvider.addProduct();
                                    },
                                    onFinished: () {
                                      if (success) {
                                        SnackBarMessage.showMessage(
                                            context: context,
                                            text: "Successfully added product",
                                            isError: false);
                                        return;
                                      }
                                      SnackBarMessage.showMessage(
                                          context: context,
                                          text: "Error",
                                          isError: true);
                                      return;
                                    });
                              }),
                          const Gap(20),
                        ],
                      ),
                    ),
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