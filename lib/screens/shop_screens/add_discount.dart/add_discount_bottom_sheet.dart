import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '/helpers/helper_functions.dart';
import '/helpers/snack_bar_messages.dart';
import '/screens/product_screen/product_providers/product_provider.dart';
import '/screens/shop_screens/add_discount.dart/widgets/delete_discount_modal.dart';
import '/widgets/buttons/agro_button.dart';
import '/widgets/input_fields/agro_input_field.dart';
import '/widgets/select_date/agro_select_date.dart';
import '../../../helpers/constants/custom_colors.dart';
import '../../../widgets/buttons/text_icon_button.dart';
import '../../../widgets/modals/agro_modal.dart';
import 'add_discount_providers/add_discount_provider.dart';

class AddDiscountBottomSheet extends StatelessWidget {
  const AddDiscountBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final addDiscountProvider = context.read<AddDiscountProvider>();
    final productProvider = context.read<ProductProvider>();

    return Consumer<AddDiscountProvider>(
      builder: (_, __, ___) => Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              const Text("1-100%"),
              AgroInputField(
                textEditingController: addDiscountProvider.percentageController,
                suffixIcon: Icon(
                  Icons.percent_rounded,
                  color: CustomColors.jadeGreen[700],
                ),
                                               inputType: InputType.int,

                hintText: "Percentage",
                deleteText: false,
                width: 150,
                onInputChanged: addDiscountProvider.enableButton,
              ),
            ],
          ),
          const Gap(12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  const Text("When discount starts"),
                  AgroSelectDate(
                    initValue: addDiscountProvider.from,
                    firstDate: DateTime.now(),
                    onSelect: (selected) {
                      addDiscountProvider.setFrom(selected);
                      addDiscountProvider.enableButton();
                    },
                  ),
                ],
              ),
              Column(
                children: [
                  const Text("When discount ends"),
                  AgroSelectDate(
                      initValue: addDiscountProvider.to,
                      firstDate: addDiscountProvider.from,
                      isDisabled: addDiscountProvider.from == null,
                      onSelect: (selected) {
                        addDiscountProvider.setTo(selected);
                        addDiscountProvider.enableButton();
                      }),
                ],
              )
            ],
          ),
          const Gap(12),
          AgroButton(
            buttonColor: ButtonColor.jadeGreen,
            text: "Finish",
            onTap: () {
              bool success = false;
              HelperFunctions.callMethodWithLoadingDialog(
                  context: context,
                  callback: () async {
                    success = await addDiscountProvider.onActionDiscount();
                  },
                  onFinished: () {
                    if (success) {
                      addDiscountProvider.refreshData(context);
                      Navigator.of(context).pop();
                      SnackBarMessage.showMessage(
                        context: context,
                        text:
                            addDiscountProvider.product.productDiscount != null
                                ? "Discount is successfully edited"
                                : "Discount is successfully added",
                        isError: false,
                      );
                    }
                  });
            },
            disabled: !addDiscountProvider.isButtonEnabled,
          ),
          Visibility(
            visible: addDiscountProvider.product.productDiscount != null,
            child: TextIconButton(
              color: Colors.red[500],
              icon: Icons.delete_rounded,
              text: "Remove discount",
              onTap: () {
                AgroModal.showECommDialog(
                  child: DeleteDiscountModal(
                    onTap: () {
                      bool success = false;

                      HelperFunctions.callMethodWithLoadingDialog(
                          context: context,
                          callback: () async {
                            success =
                                await addDiscountProvider.deleteDiscount();
                          },
                          onFinished: () {
                            if (success) {
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                              SnackBarMessage.showMessage(
                                  context: context,
                                  text:
                                      "${addDiscountProvider.product.name} discount is successfully deleted",
                                  isError: false);

                              addDiscountProvider.refreshData(context);
                            }
                          });
                    },
                    product: productProvider.product,
                  ),
                  context: context,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
