import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_mart/common/widgets/blue_black_shader.dart';
import 'package:tech_mart/utils/app_textstyle.dart';
import 'package:tech_mart/utils/extentions.dart';

import 'app_drop_down_button.dart';
import 'app_text_field.dart';

class PriceSelectionInput extends StatefulWidget {
  const PriceSelectionInput({
    super.key,
    this.lable,
    this.controller,
    this.onChanges,
    this.initialValue,
    this.borderColor,
    this.gradientBorder = true,
    this.lableStyle,
    this.hint,
    this.style,
  });
  final String? lable;
  final String? hint;
  final TextStyle? lableStyle;
  final TextStyle? style;
  final String? initialValue;
  final TextEditingController? controller;
  final void Function(Object?)? onChanges;
  final Color? borderColor;
  final bool gradientBorder;

  @override
  State<PriceSelectionInput> createState() => _PriceSelectionInputState();
}

class _PriceSelectionInputState extends State<PriceSelectionInput> {
  final List<String> selections = ['USD', 'PKR', 'QDT'];

  String? selectedValue = 'USD';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.lable != null) ...[
          BlueBlackShaderMask(
              child: Text(
            widget.lable!,
            style: widget.lableStyle?.responsive ??
                AppTextStyle.mediumBlack14.copyWith(fontSize: 14.h),
          )),
          2.verticalSpace,
        ],
        Row(
          children: [
            Expanded(
              child: AppDropDownButton(
                  style: widget.style,
                  value: selectedValue,
                  onChanges: (value) {
                    if (value == null) return;
                    // setState(() {
                    //   selectedValue = value as String;
                    // });
                    if (widget.onChanges != null) {
                      widget.onChanges!(value);
                    }
                  },
                  items: selections
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(
                              e,
                              style: const TextStyle(
                                      fontSize: 14, color: Colors.blueGrey)
                                  .responsive,
                            ),
                          ))
                      .toList(),
                  hintText: ''),
            ),
            10.horizontalSpace,
            Expanded(
              flex: 2,
              child: Builder(builder: (context) {
                return AppTextField(
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                    gradientBorder: widget.gradientBorder,
                    borderColor: widget.borderColor,
                    initialValue: widget.initialValue,
                    hint: widget.hint);
              }),
            )
          ],
        ),
      ],
    );
  }
}
