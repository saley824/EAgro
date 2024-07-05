import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:msan/screens/products_list_screen/filter_bottom_sheet/filter_providers/filter_provider.dart';
import 'package:msan/widgets/buttons/agro_button.dart';
import 'package:msan/widgets/input_fields/agro_input_field.dart';
import 'package:msan/widgets/loading_indicator/agro_loading_indicator.dart';
import 'package:msan/widgets/select_date/agro_select_date.dart';
import 'package:provider/provider.dart';

import '../../../helpers/constants/custom_colors.dart';
import '../../../widgets/buttons/text_button.dart';
import '../../../widgets/checkbox/checkbox.dart';
import '../../../widgets/divider/divider.dart';
import '../../../widgets/drop_down/agro_dropdown.dart';

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final addDiscountProvider = context.read<FilterProvider>();
    final textTheme = Theme.of(context).textTheme;
    return FutureBuilder(
      future: addDiscountProvider.getInitData(),
      builder: (context, snapshot) => snapshot.connectionState ==
              ConnectionState.waiting
          ? const AgroLoadingIndicator()
          : Consumer<FilterProvider>(
              builder: (_, __, ___) => Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Category",
                            style: textTheme.labelLarge,
                          ),
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              foregroundColor: CustomColors.jadeGreen[600],
                            ),
                            child: const Text("Reset"),
                          ),
                        ],
                      ),
                      const Gap(16),
                      AgroDropdown(
                        hintText: "Select super category",
                        dropDownElements: addDiscountProvider.superCategories,
                        onSelect: (selected) {
                          addDiscountProvider.setSuperCategory(selected);
                        },
                      ),
                      const Gap(20),
                      AgroDropdown(
                        key: UniqueKey(),
                        hintText: "Select category",
                        dropDownElements: addDiscountProvider.subCategories,
                        onSelect: (selected) {
                          addDiscountProvider.setSubCategory(selected);
                        },
                      ),
                      const AgroDivider(
                        margin: EdgeInsets.symmetric(vertical: 24),
                      ),
                      Text(
                        "Price",
                        style: textTheme.labelLarge,
                      ),
                      const Gap(16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: AgroInputField(
                              labelVisible: true,
                              textEditingController:
                                  addDiscountProvider.fromPriceController,
                              numberInputType: true,
                              hintText: "From",
                              deleteText: false,
                              width: 150,
                              onInputChanged: addDiscountProvider.enableButton,
                            ),
                          ),
                          const Gap(16),
                          Expanded(
                            child: AgroInputField(
                              labelVisible: true,
                              textEditingController:
                                  addDiscountProvider.toPriceController,
                              numberInputType: true,
                              hintText: "To",
                              deleteText: false,
                              width: 150,
                              onInputChanged: addDiscountProvider.enableButton,
                            ),
                          ),
                        ],
                      ),
                      const AgroDivider(
                        margin: EdgeInsets.symmetric(vertical: 24),
                      ),
                      Text(
                        "Discount",
                        style: textTheme.labelLarge,
                      ),
                      const Gap(16),
                      AgroCheckbox(
                        onChanged: (s) {},
                        text: "Only with discount",
                        enableFilledBackground: true,
                        icon: Icon(
                          Icons.percent_rounded,
                          color: CustomColors.jadeGreen[700],
                        ),
                      )
                    ],
                  ),
                  const Gap(12),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //   children: [
                  //     Column(
                  //       children: [
                  //         const Text("When discount starts"),
                  //         AgroSelectDate(
                  //           onSelect: (selected) {
                  //             addDiscountProvider.setFrom(selected);
                  //             addDiscountProvider.enableButton();
                  //           },
                  //         ),
                  //       ],
                  //     ),
                  //     Column(
                  //       children: [
                  //         const Text("When discount ends"),
                  //         AgroSelectDate(
                  //             firstDate: addDiscountProvider.from,
                  //             isDisabled: addDiscountProvider.from == null,
                  //             onSelect: (selected) {
                  //               addDiscountProvider.setTo(selected);
                  //               addDiscountProvider.enableButton();
                  //             }),
                  //       ],
                  //     )
                  //   ],
                  // ),
                  const Gap(12),
                  AgroButton(
                    buttonColor: ButtonColor.jadeGreen,
                    text: "Finish",
                    onTap: () {},
                    disabled: !addDiscountProvider.isButtonEnabled,
                  ),
                ],
              ),
            ),
    );
  }
}
