import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../helpers/constants/custom_colors.dart';
import '../../helpers/datetime_parser.dart';

class AgroSelectDate extends StatefulWidget {
  final Function(DateTime) onSelect;
  final DateTime? initValue;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final double? height;
  final double? bottomSpace;
  final bool isDisabled;

  const AgroSelectDate({
    super.key,
    this.initValue,
    required this.onSelect,
    this.firstDate,
    this.lastDate,
    this.height,
    this.bottomSpace = 22,
    this.isDisabled = false,
  });

  @override
  State<AgroSelectDate> createState() => _AgroSelectDateState();
}

class _AgroSelectDateState extends State<AgroSelectDate> {
  DateTime? selectedValue;
  String? selectedValueString;

  @override
  void initState() {
    if (widget.initValue is DateTime) {
      selectedValue = widget.initValue!;
      selectedValueString = DateTimeParser.toClassicDate(selectedValue!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: widget.isDisabled
          ? null
          : () {
              showDatePicker(
                  confirmText: "Confirm",
                  cancelText: "Cancel",
                  context: context,
                  initialDate: selectedValue,
                  firstDate:
                      widget.firstDate ?? DateTime(DateTime.now().year - 100),
                  lastDate:
                      widget.lastDate ?? DateTime(DateTime.now().year + 100),
                  builder: (context, child) {
                    return Theme(
                      data: appTheme.copyWith(
                          colorScheme: ColorScheme.light(
                              primary: CustomColors.jadeGreen[500]!)),
                      child: child!,
                    );
                  }).then((selected) {
                if (selected == null) return;
                widget.onSelect(selected);
                setState(() {
                  selectedValue = selected;
                  selectedValueString =
                      DateTimeParser.toClassicDate(selectedValue!);
                });
              });
            },
      child: Container(
        height: widget.height,
        width: 150,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
          color: widget.isDisabled ? CustomColors.gray[200] : Colors.white,
          border: Border.all(
              color: widget.isDisabled
                  ? CustomColors.gray[600]!
                  : CustomColors.jadeGreen[700]!.withOpacity(0.4),
              width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.calendar_month_rounded,
              color: widget.isDisabled
                  ? CustomColors.gray[600]!
                  : CustomColors.jadeGreen[700],
            ),
            const Gap(4),
            Text(selectedValueString ?? "")
          ],
        ),
      ),
    );
  }
}
