import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:msan/widgets/buttons/agro_button.dart';
import 'package:msan/widgets/input_fields/agro_input_field.dart';
import 'package:msan/widgets/select_date/agro_select_date.dart';
import 'package:provider/provider.dart';

import '../../../helpers/constants/custom_colors.dart';
import 'add_discount_providers/add_discount_provider.dart';

class AddDiscountBottomSheet extends StatelessWidget {
  const AddDiscountBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final addDiscountProvider = context.read<AddDiscountProvider>();

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
                numberInputType: true,
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
            onTap: () {},
            disabled: !addDiscountProvider.isButtonEnabled,
          ),
        ],
      ),
    );
  }
}
