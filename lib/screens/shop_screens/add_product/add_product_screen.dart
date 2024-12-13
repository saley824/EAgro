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
        context: context,
        title: addProductProvider.product != null
            ? "Izmijeni proizvod"
            : "Dodaj novi proizvod",
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
                            hintText: "Ime",
                            textEditingController:
                                addProductProvider.nameController,
                            onInputChanged: addProductProvider.enableButton,
                          ),
                          const Gap(20),
                          AgroInputField(
                            height: 120,
                            maxLines: 5,
                            labelVisible: true,
                            hintText: "Opis",
                            textEditingController:
                                addProductProvider.descriptionController,
                            onInputChanged: addProductProvider.enableButton,
                          ),
                          const Gap(20),
                          AgroDropdown(
                            initValue: addProductProvider.selectedSuperCategory,
                            key: UniqueKey(),
                            hintText: "Izaberi kategoriju",
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
                            hintText: "Izaberi potkategoriju",
                            dropDownElements: addProductProvider.subCategories,
                            onSelect: (selected) {
                              addProductProvider.enableButton();
                              addProductProvider.setSubCategory(selected);
                            },
                            isDisabled:
                                addProductProvider.subCategories == null,
                                disabledText: "Prvo izaberite kategoriju",
                          ),
                          const Gap(20),
                          AgroDropdown(
                            initValue: addProductProvider.selectedUnit,
                            hintText: "Odaberi jedinicu",
                            dropDownElements: addProductProvider.unitTypes,
                            onSelect: (selected) {
                              addProductProvider.enableButton();

                              addProductProvider.setUnit(selected);
                            },
                          ),
                          const Gap(20),
                          AgroInputField(
                            labelVisible: true,
                            inputType: InputType.int,
                            hintText: "Ukupna količina",
                            textEditingController:
                                addProductProvider.totalAmountController,
                            onInputChanged: addProductProvider.enableButton,
                          ),
                          const Gap(20),
                          AgroInputField(
                            labelVisible: true,
                            inputType: InputType.int,
                            hintText: "Količina",
                            textEditingController:
                                addProductProvider.quantityController,
                            onInputChanged: addProductProvider.enableButton,
                          ),
                          const Gap(20),
                          AgroInputField(
                            labelVisible: true,
                            inputType: InputType.double,
                            hintText: "Cijena",
                            textEditingController:
                                addProductProvider.priceController,
                            onInputChanged: addProductProvider.enableButton,
                          ),
                          const Gap(20),
                          AgroButton(
                              buttonColor: ButtonColor.jadeGreen,
                              disabled: !addProductProvider.isButtonEnabled,
                              text: addProductProvider.product != null
                                  ? "Izmijeni"
                                  : "Dodaj",
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
                                                ? "Uspješno izmjenjen proizvod!"
                                                : "Uspješno dodan proizvod!",
                                            isError: false);
                                        return;
                                      }
                            
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