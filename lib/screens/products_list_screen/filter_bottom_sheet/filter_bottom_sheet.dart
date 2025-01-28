import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '/helpers/constants/custom_colors.dart';
import '/models/products_model/product_filter_model.dart';
import '/screens/products_list_screen/filter_bottom_sheet/filter_providers/filter_provider.dart';
import '/widgets/buttons/agro_button.dart';
import '/widgets/checkbox/checkbox.dart';
import '/widgets/divider/divider.dart';
import '/widgets/drop_down/agro_dropdown.dart';
import '/widgets/input_fields/agro_input_field.dart';
import '/widgets/loading_indicator/agro_loading_indicator.dart';

class FilterBottomSheet extends StatelessWidget {
  final Function(ProductFilterModel) onSelect;

  const FilterBottomSheet({
    super.key,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final filterProvider = context.read<FilterProvider>();
    final textTheme = Theme.of(context).textTheme;
    final globalAppNavigator = Navigator.of(context);
    return FutureBuilder(
      future: filterProvider.getInitData(),
      builder: (context, snapshot) =>
          snapshot.connectionState == ConnectionState.waiting
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
                                "",
                                style: textTheme.labelLarge,
                              ),
                              TextButton(
                                onPressed: () {
                                  filterProvider.resetFilter();
                                  // onSelect(filterProvider.productFilter);
                                  // globalAppNavigator.pop();
                                },
                                style: TextButton.styleFrom(
                                  foregroundColor: CustomColors.jadeGreen[600],
                                ),
                                child: const Text("Resetuj"),
                              ),
                            ],
                          ),
                          const Gap(8),
                          AgroDropdown(
                            initValue: filterProvider.selectedSuperCategory,
                            key: UniqueKey(),
                            hintText: "Izaberi kategoriju",
                            dropDownElements: filterProvider.superCategories,
                            onSelect: (selected) {
                              filterProvider.setSuperCategory(selected);
                            },
                          ),
                          const Gap(20),
                          AgroDropdown(
                            disabledText: "Prvo izaberite kategoriju",
                            initValue: filterProvider.selectedSubCategory,
                            key: UniqueKey(),
                            hintText: "Izaberi potkategoriju",
                            dropDownElements: filterProvider.subCategories,
                            onSelect: (selected) {
                              filterProvider.setSubCategory(selected);
                            },
                          ),
                          const AgroDivider(
                            margin: EdgeInsets.symmetric(vertical: 24),
                          ),
                          Text(
                            "Cijena",
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
                                      filterProvider.fromPriceController,
                                  inputType: InputType.int,
                                  hintText: "Od",
                                  deleteText: false,
                                  width: 150,
                                  onInputChanged: filterProvider.enableButton,
                                ),
                              ),
                              const Gap(16),
                              Expanded(
                                child: AgroInputField(
                                  labelVisible: true,
                                  textEditingController:
                                      filterProvider.toPriceController,
                                  inputType: InputType.int,
                                  hintText: "Do",
                                  deleteText: false,
                                  width: 150,
                                  onInputChanged: filterProvider.enableButton,
                                ),
                              ),
                            ],
                          ),
                          const AgroDivider(
                            margin: EdgeInsets.symmetric(vertical: 24),
                          ),
                          Text(
                            "Sniženje",
                            style: textTheme.labelLarge,
                          ),
                          const Gap(16),
                          AgroCheckbox(
                            key: UniqueKey(),
                            isChecked: filterProvider.hasDiscount,
                            onChanged: (s) {
                              filterProvider.setHasDiscount(s);
                            },
                            text: "Samo proizvodi koji su sniženi",
                            enableFilledBackground: true,
                            icon: Icon(
                              Icons.percent_rounded,
                              color: CustomColors.jadeGreen[700],
                            ),
                          )
                        ],
                      ),
                      const Gap(12),
                      AgroButton(
                        buttonColor: ButtonColor.jadeGreen,
                        text: "Primjeni",
                        onTap: () {
                          filterProvider.setFilter();
                          onSelect(filterProvider.productFilter);
                          globalAppNavigator.pop();
                        },
                      ),
                    ],
                  ),
                ),
    );
  }
}
