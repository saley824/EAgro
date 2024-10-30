import 'package:flutter/material.dart';

import '/helpers/constants/custom_colors.dart';

/// Checkbox with white background when it is unchecked and with with check and teal background when it is checked
class AgroCheckbox extends StatefulWidget {
  final EdgeInsets margin;
  final bool isChecked;
  final String text;
  final Widget?
      customText; //if is not null it will be shown instead text string
  final Function(bool value) onChanged;
  final String? additionalText;
  final bool enableFilledBackground;
  final EdgeInsets padding;
  final Widget? icon;
  const AgroCheckbox({
    super.key,
    required this.text,
    required this.onChanged,
    this.additionalText,
    this.isChecked = false,
    this.enableFilledBackground = false,
    this.margin = EdgeInsets.zero,
    this.padding = const EdgeInsets.symmetric(vertical: 8),
    this.customText,
    this.icon,
  });

  @override
  State<AgroCheckbox> createState() => _AgroCheckboxState();
}

class _AgroCheckboxState extends State<AgroCheckbox> {
  late bool isChecked;

  @override
  void initState() {
    isChecked = widget.isChecked;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData appTheme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      margin: widget.margin,
      decoration: BoxDecoration(
        color: isChecked ? CustomColors.jadeGreen[50] : Colors.white,
        border: Border.all(
          color: CustomColors.gray[950]!.withOpacity(0.12),
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: InkWell(
        onTap: () {
          setState(() {
            widget.onChanged(!isChecked);
            isChecked = !isChecked;
          });
        },
        child: Container(
          padding: widget.padding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 20,
                width: 20,
                child: Checkbox(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  side: !isChecked
                      ? WidgetStateBorderSide.resolveWith(
                          (states) => BorderSide(
                              width: 1.0, color: CustomColors.gray[400]!),
                        )
                      : null,
                  checkColor: Colors.white,
                  activeColor: CustomColors.jadeGreen[500],
                  fillColor: widget.enableFilledBackground
                      ? WidgetStateProperty.resolveWith<Color>(
                          (Set<WidgetState> states) {
                          if (states.contains(WidgetState.selected)) {
                            return CustomColors.jadeGreen[500]!;
                          }
                          return Colors.white;
                        })
                      : null,
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      widget.onChanged(value!);
                      isChecked = value;
                    });
                  },
                ),
              ),
              const SizedBox(width: 8),
              Flexible(
                child: widget.customText ??
                    Text(
                      widget.text,
                      style: appTheme.textTheme.bodyMedium,
                      overflow: TextOverflow.ellipsis,
                    ),
              ),
              const SizedBox(
                width: 4,
              ),
              if (widget.additionalText != null)
                Row(
                  children: [
                    Text(
                      widget.additionalText ?? "",
                      style: appTheme.textTheme.bodyMedium!
                          .copyWith(color: CustomColors.gray[500]),
                    ),
                    const SizedBox(
                      width: 4,
                    )
                  ],
                ),
              if (widget.icon != null) widget.icon!,
            ],
          ),
        ),
      ),
    );
  }
}
