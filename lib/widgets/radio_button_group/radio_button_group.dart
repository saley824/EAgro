import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../helpers/constants/custom_colors.dart';
import 'radio_button_model.dart';

class RadioButtonGroup extends StatefulWidget {
  final dynamic initValue;
  final List<RadioButtonModel> radioButtons;
  final Function(RadioButtonModel) onChange;
  const RadioButtonGroup({
    super.key,
    required this.radioButtons,
    this.initValue,
    required this.onChange,
  });

  @override
  State<RadioButtonGroup> createState() => _RadioButtonGroupState();
}

class _RadioButtonGroupState extends State<RadioButtonGroup> {
  RadioButtonModel? selectedValue;

  @override
  void initState() {
    for (var radioButton in widget.radioButtons) {
      if (radioButton.value == widget.initValue) {
        selectedValue = radioButton;
        return;
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...widget.radioButtons.map(
          (data) {
            final radioButtons = widget.radioButtons;
            return Column(
              children: [
                ListTile(
                  title: Row(
                    children: [
                      if (data.icon != null) ...[
                        Icon(data.icon),
                        const Gap(4),
                      ],
                      Text(data.text),
                    ],
                  ),
                  leading: Radio<RadioButtonModel>(
                    activeColor: CustomColors.jadeGreen[400],
                    value: data,
                    groupValue: selectedValue,
                    onChanged: (RadioButtonModel? value) {
                      widget.onChange(value!);
                      setState(() {
                        selectedValue = value;
                      });
                    },
                  ),
                ),
                if (radioButtons.last != data)
                  Container(
                    color: CustomColors.gray[200],
                    width: double.infinity,
                    height: 1,
                  )
              ],
            );
          },
        )
      ],
    );
  }
}
