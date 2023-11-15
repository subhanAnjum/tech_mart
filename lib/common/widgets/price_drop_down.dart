import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_mart/utils/extentions.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_textstyle.dart';
import 'blue_black_shader.dart';

class PriceDropDown extends StatefulWidget {
  const PriceDropDown({
    super.key,
    this.onChanged,
    this.selectedValue,
    required this.options,
    this.lable,
  });
  final void Function(String?)? onChanged;
  final String? selectedValue;
  final List<String> options;
  final String? lable;

  @override
  State<PriceDropDown> createState() => _PriceDropDownState();
}

class _PriceDropDownState extends State<PriceDropDown> {
  final FocusNode _focusNode = FocusNode();
  @override
  void initState() {
    _focusNode.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (widget.lable != null)
          Expanded(
              child: Padding(
            padding: EdgeInsets.only(bottom: _focusNode.hasFocus ? 160.h : 0.0),
            child: BlueBlackShaderMask(
              child: Text(
                'Min. Price',
                style: AppTextStyle.regularBlack14.responsive,
              ),
            ),
          )),
        Expanded(
          child: Container(
            padding: EdgeInsets.only(
              left: 5.w,
              right: 5.w,
            ),
            margin: EdgeInsets.only(bottom: _focusNode.hasFocus ? 160.h : 0.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.lightGrey,
              ),
              borderRadius: BorderRadius.circular(5.0.w),
            ),
            child: DropdownButtonFormField2<String>(
                isExpanded: true,
                focusNode: _focusNode,
                selectedItemBuilder: (context) =>
                    widget.options
                        ?.map((e) => Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                BlueBlackShaderMask(
                                    child: Text(
                                  widget.selectedValue?.toString() ?? '',
                                  style: AppTextStyle.regularBlack12.responsive
                                      .copyWith(color: AppColors.blue),
                                )),
                              ],
                            ))
                        .toList() ??
                    [] as List<Widget>,
                dropdownStyleData: DropdownStyleData(
                    offset: Offset(0, -10.h),
                    maxHeight: 160.h,
                    elevation: 1,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10.0.w),
                          bottomRight: Radius.circular(10.0.w)),
                    )),
                value: widget.selectedValue,
                // underline: const SizedBox(),
                decoration: InputDecoration(border: InputBorder.none),
                items: widget.options
                    .map((e) => DropdownMenuItem(
                          child: Text(
                            e,
                            style: TextStyle(fontSize: 12).responsive,
                          ),
                          value: e,
                        ))
                    .toList(),
                onChanged: widget.onChanged),
          ),
        ),
      ],
    );
  }
}
