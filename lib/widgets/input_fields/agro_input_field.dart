import 'package:flutter/material.dart';

import '/helpers/constants/custom_colors.dart';
import '/helpers/styles/custom_themes.dart';

class AgroInputField extends StatefulWidget {
  const AgroInputField({
    super.key,
    this.hintText,
    this.numberInputType = false,
    this.textEditingController,
    this.labelVisible = false,
    this.hasError = false,
    this.disabled = false,
    this.passwordField = false,
    this.enableFocusBorder = true,
    this.showBorder = true,
    this.suffixIcon,
    this.prefixIcon,
    this.borderRadius = 12,
    this.height = 40,
    this.width,
    this.bgColor,
    this.fontSize,
    this.onInputChanged,
    this.deleteText = true,
  });

  final bool labelVisible;
  final bool hasError;
  final bool disabled;
  final double borderRadius;
  final double height;
  final double? width;
  final String? hintText;
  final double? fontSize;
  final bool passwordField;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? bgColor;
  final TextEditingController? textEditingController;
  final VoidCallback? onInputChanged;
  final bool numberInputType;
  final bool enableFocusBorder;
  final bool showBorder;
  final bool deleteText;

  @override
  State<AgroInputField> createState() => _AgroInputFieldState();
}

class _AgroInputFieldState extends State<AgroInputField> {
  final FocusNode fn = FocusNode();
  final GlobalKey _formKey = GlobalKey<FormState>();
  bool hideText = false;

  @override
  void initState() {
    hideText = widget.passwordField;
    fn.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  Color _getBackgroundColor() {
    return widget.disabled
        ? (CustomColors.gray[950] ?? CustomColors.gray).withOpacity(0.12)
        : widget.bgColor ?? Colors.white;
  }

  Border _getBorder() {
    if (widget.enableFocusBorder && fn.hasFocus && !widget.hasError) {
      return Border.all(color: CustomColors.jadeGreen[700]!, width: 3);
    }

    return Border.all(
      color: widget.hasError && !widget.disabled
          ? CustomColors.red.shade500
          : (CustomColors.gray[950] ?? CustomColors.gray),
      width: widget.hasError ? 1.5 : 1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: widget.disabled ? 0.4 : 1,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
        decoration: BoxDecoration(
          color: _getBackgroundColor(),
          border: widget.showBorder ? _getBorder() : null,
          borderRadius: BorderRadius.circular(widget.borderRadius),
        ),
        child: Center(
          child: SizedBox(
            height: widget.height,
            width: widget.width,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (widget.prefixIcon != null)
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 4,
                    ),
                    child: widget.prefixIcon!,
                  ),
                Expanded(
                  child: TextField(
                    key: _formKey,
                    focusNode: fn,
                    obscureText: hideText,
                    style: ownTheme(context).inputFieldTextStyle?.copyWith(
                          fontSize: widget.fontSize,
                        ),
                    onChanged: (value) {
                      if (widget.onInputChanged != null) {
                        widget.onInputChanged!();
                      }
                    },
                    keyboardType:
                        widget.numberInputType ? TextInputType.number : null,
                    enabled: !widget.disabled,
                    controller: widget.textEditingController,
                    decoration: InputDecoration(
                      isCollapsed: !widget.labelVisible,
                      contentPadding: EdgeInsets.zero,
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      labelText: widget.labelVisible ? widget.hintText : null,
                      hintText: !widget.labelVisible ? widget.hintText : null,
                      floatingLabelBehavior: widget.labelVisible
                          ? FloatingLabelBehavior.auto
                          : FloatingLabelBehavior.never,
                      labelStyle:
                          ownTheme(context).inputFieldHintStyle?.copyWith(
                                letterSpacing: -0.18,
                                color: widget.disabled
                                    ? CustomColors.gray[900]!.withOpacity(0.12)
                                    : null,
                                fontSize: widget.fontSize,
                                height: 2,
                              ),
                    ),
                  ),
                ),
                if (widget.passwordField)
                  SizedBox(
                      width: 36,
                      height: 36,
                      child: Center(
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              hideText = !hideText;
                            });
                          },
                          child: hideText
                              ? Icon(
                                  Icons.visibility_off_outlined,
                                  color: CustomColors.gray[500],
                                )
                              : Icon(
                                  Icons.visibility_outlined,
                                  color: CustomColors.gray[500],
                                ),
                        ),
                      )),
                if (!widget.passwordField && widget.suffixIcon != null)
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 4,
                    ),
                    child: widget.suffixIcon!,
                  ),
                if (!widget.passwordField && widget.deleteText)
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 4,
                    ),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          widget.textEditingController!.text = "";
                          if (widget.onInputChanged != null) {
                            widget.onInputChanged!();
                          }
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Icon(
                          Icons.close,
                          color: CustomColors.gray[500],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
