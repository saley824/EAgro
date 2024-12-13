import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '/helpers/constants/custom_colors.dart';
import 'drop_down_model/agro_dropdown_model.dart';

class AgroDropdown extends StatefulWidget {
  final Function(AgroDropdownModel) onSelect;
  final List<AgroDropdownModel>? dropDownElements;
  final bool isExpanded;
  final AgroDropdownModel? initValue;
  final String hintText;
  final double? width;
  final String? disabledText;
  final bool isDisabled;

  const AgroDropdown({
    super.key,
    required this.dropDownElements,
    this.isExpanded = true,
    required this.onSelect,
    this.initValue,
    required this.hintText,
    this.width,
    this.disabledText,
    this.isDisabled = false,
  });

  @override
  State<AgroDropdown> createState() => _ShopRolesDropdownState();
}

class _ShopRolesDropdownState extends State<AgroDropdown> {
  AgroDropdownModel? selectedDropdownValue;
  late Color backgroundColor;
  @override
  void initState() {
    if (widget.initValue is AgroDropdownModel) {
      selectedDropdownValue = widget.initValue!;
    }
    if (widget.isDisabled) {
      backgroundColor = CustomColors.gray[100]!;
    } else {
      backgroundColor = Colors.white;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.hintText),
        const Gap(4),
        DropdownButtonHideUnderline(
          child: DropdownButton2<AgroDropdownModel>(
            disabledHint: Text(
              textAlign: TextAlign.center,
              widget.disabledText ?? "Onemogućen",
              style:
                  textTheme.bodyMedium!.copyWith(color: CustomColors.gray[500]),
            ),
            hint: Text(
              textAlign: TextAlign.center,
              widget.hintText,
              style:
                  textTheme.bodyMedium!.copyWith(color: CustomColors.gray[500]),
            ),
            isExpanded: widget.isExpanded,
            selectedItemBuilder:
                widget.dropDownElements != null && selectedDropdownValue != null
                    ? (BuildContext context) {
                        return widget.dropDownElements!
                            .map((AgroDropdownModel value) {
                          return Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              textAlign: TextAlign.center,
                              selectedDropdownValue!.text,
                              style: textTheme.bodyLarge,
                            ),
                          );
                        }).toList();
                      }
                    : null,
            items: widget.dropDownElements
                ?.map(
                  (AgroDropdownModel item) =>
                      DropdownMenuItem<AgroDropdownModel>(
                    value: item,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            item.text,
                            style: textTheme.bodyLarge,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
            value: selectedDropdownValue,
            onChanged: (AgroDropdownModel? value) {
              widget.onSelect(value!);
              setState(() {
                selectedDropdownValue = value;
              });
            },
            onMenuStateChange: (value) {
              setState(() {
                backgroundColor = !value
                    ? Colors.white
                    : CustomColors.gray[950]!.withOpacity(0.12);
              });
            },
            buttonStyleData: ButtonStyleData(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: CustomColors.gray[950]!.withOpacity(0.12),
                ),
                color: backgroundColor,
              ),
            ),
            dropdownStyleData: DropdownStyleData(
              maxHeight: 200,
              padding: const EdgeInsets.all(0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: Colors.white,
              ),
              scrollbarTheme: ScrollbarThemeData(
                radius: const Radius.circular(40),
                thickness: WidgetStateProperty.all(6),
                thumbVisibility: WidgetStateProperty.all(true),
              ),
            ),
            menuItemStyleData: MenuItemStyleData(
              selectedMenuItemBuilder: (_, __) {
                return Container(
                  padding: const EdgeInsets.all(12),
                  color: CustomColors.gray[200]!.withOpacity(0.4),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          selectedDropdownValue!.text,
                          style: textTheme.labelLarge!
                              .copyWith(color: CustomColors.jadeGreen[900]),
                        ),
                      ),
                      Icon(
                        Icons.check,
                        color: CustomColors.jadeGreen[700],
                      )
                    ],
                  ),
                );
              },
              padding: const EdgeInsets.all(12),
            ),
          ),
        ),
      ],
    );
  }
}
