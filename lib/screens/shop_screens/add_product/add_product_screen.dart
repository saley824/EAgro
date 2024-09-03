import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '/screens/shop_screens/add_product/add_product_providers/add_product_provider.dart';
import '/widgets/buttons/agro_button.dart';
import '/widgets/drop_down/agro_dropdown.dart';
import '/widgets/input_fields/agro_input_field.dart';
import '/widgets/loading_indicator/agro_loading_indicator.dart';
import '../../../helpers/helper_functions.dart';
import '../../../helpers/snack_bar_messages.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final addProductProvider = context.read<AddProductProvider>();
    return Scaffold(
      appBar: HelperFunctions.getSubAppBar(
        context,
        addProductProvider.product != null ? "Edit product" : "Add new product",
      ),
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
                            initValue: addProductProvider.selectedSuperCategory,
                            key: UniqueKey(),
                            hintText: "Select super category",
                            dropDownElements:
                                addProductProvider.superCategories,
                            onSelect: (selected) {
                              addProductProvider.setSuperCategory(
                                  selected, true);
                            },
                          ),
                          const Gap(20),
                          AgroDropdown(
                            initValue: addProductProvider.selectedSubCategory,
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
                            initValue: addProductProvider.selectedUnit,
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
                              text: addProductProvider.product != null
                                  ? "Edit product"
                                  : "Add new product",
                              onTap: () {
                                FocusManager.instance.primaryFocus?.unfocus();
                                bool success = false;
                                HelperFunctions.callMethodWithLoadingDialog(
                                    context: context,
                                    callback: () async {
                                      success = await addProductProvider
                                          .onAddOrEdit();
                                    },
                                    onFinished: () {
                                      if (success) {
                                        Navigator.of(context).pop(true);
                                        SnackBarMessage.showMessage(
                                            context: context,
                                            text: addProductProvider.product !=
                                                    null
                                                ? "Successfully edited product"
                                                : "Successfully added product",
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