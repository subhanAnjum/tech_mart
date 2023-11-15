import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/gradient_borders.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_textstyle.dart';
import 'blue_black_shader.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.gradientBorder = true,
    this.borderColor,
    this.initialValue,
    this.hint,
    this.lable,
    this.lableStyle,
    this.bottomText,
    this.bottomTextStyle,
    this.controller,
    this.height,
    this.isExpanded = false,
    this.isDisabled = false,
    this.keyboardType,
    this.textAlign,
    this.fieldStyle,
    this.textInputAction,
  });

  final bool gradientBorder;
  final Color? borderColor;
  final String? initialValue;
  final String? hint;
  final String? lable;
  final TextStyle? lableStyle;
  final TextStyle? fieldStyle;
  final String? bottomText;
  final TextStyle? bottomTextStyle;
  final TextEditingController? controller;
  final double? height;
  final bool isExpanded;
  final bool isDisabled;
  final TextInputType? keyboardType;
  final TextAlign? textAlign;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (lable != null) ...[
          BlueBlackShaderMask(
              child: Text(
            lable!,
            style: lableStyle?.copyWith(fontSize: lableStyle?.fontSize?.h) ??
                AppTextStyle.mediumBlack16.copyWith(fontSize: 16.h),
          )),
          2.verticalSpace,
        ],
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w),
          height: height ?? 60.h,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.w),
              border: !gradientBorder
                  ? Border.all(color: borderColor ?? AppColors.grey)
                  : const GradientBoxBorder(
                      gradient: AppColors.blueBlackGradient,
                    )),
          child: TextFormField(
            textInputAction: textInputAction ?? TextInputAction.next,
            controller: controller,
            textAlign: textAlign ?? TextAlign.start,
            expands: isExpanded,
            minLines: isExpanded ? null : null,
            maxLines: isExpanded ? null : 1,
            initialValue: initialValue,
            enabled: !isDisabled,
            keyboardType: keyboardType ?? TextInputType.name,
            style: fieldStyle?.copyWith(fontSize: fieldStyle?.fontSize?.h) ??
                AppTextStyle.mediumBlack16.copyWith(
                    color: gradientBorder ? AppColors.blue : AppColors.black,
                    fontSize: 16.h),
            decoration: InputDecoration(
                hintText: hint,
                hintStyle: AppTextStyle.mediumGrey14.copyWith(fontSize: 14.h),
                isDense: true,
                border: InputBorder.none),
          ),
        ),
        if (bottomText != null) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                bottomText!,
                textAlign: TextAlign.right,
                style: bottomTextStyle?.copyWith(
                        fontSize: bottomTextStyle?.fontSize?.h) ??
                    AppTextStyle.regularGrey10.copyWith(fontSize: 10.h),
              ),
            ],
          ),
          2.verticalSpace,
        ],
      ],
    );
  }
}
