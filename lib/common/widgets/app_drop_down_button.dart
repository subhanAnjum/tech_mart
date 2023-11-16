import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_mart/utils/extentions.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_textstyle.dart';
import 'blue_black_shader.dart';

class AppDropDownButton extends StatelessWidget {
  const AppDropDownButton({
    super.key,
    this.lable,
    this.value,
    required this.items,
    required this.hintText,
    this.onChanges,
    this.lableStyle,
    this.style,
  });

  final String? lable;
  final Object? value;
  final List<DropdownMenuItem<Object?>>? items;
  final String hintText;
  final TextStyle? lableStyle;
  final TextStyle? style;
  final void Function(Object?)? onChanges;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (lable != null) ...[
          BlueBlackShaderMask(
              child: Text(
            lable!,
            style: lableStyle?.copyWith(fontSize: lableStyle?.fontSize?.w) ??
                AppTextStyle.mediumBlack14.copyWith(fontSize: 14.w),
          )),
          2.verticalSpace,
        ],
        DropdownButton2<Object?>(
          isExpanded: true,
          isDense: true,

          buttonStyleData: ButtonStyleData(
            padding: EdgeInsets.symmetric(
              horizontal: 16.0.w,
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: AppColors.grey),
                borderRadius: BorderRadius.circular(5.w)),
            height: 60.h,
          ),
          dropdownStyleData: DropdownStyleData(
            maxHeight: context.height * 0.3,
            useSafeArea: false,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.w),
            ),
            padding: EdgeInsets.zero,
          ),

          menuItemStyleData: MenuItemStyleData(
            height: 48.h,
            padding: EdgeInsets.zero,
          ),
          // dropdownColor: Colors.white,
          // borderRadius: BorderRadius.circular(16.w),
          // padding: EdgeInsets.zero,
          // menuMaxHeight: context.height * 0.3,
          selectedItemBuilder: (context) =>
              items
                  ?.map((e) => BlueBlackShaderMask(
                          child: Text(
                        value?.toString() ?? '',
                        style: style ??
                            AppTextStyle.mediumBlack16.responsive
                                .copyWith(color: AppColors.blue),
                      )))
                  .toList() ??
              [] as List<Widget>,
          underline: SizedBox(),
          // iconSize: 14.w,
          // icon: const Icon(CupertinoIcons.chevron_down),
          value: value,
          // iconEnabledColor: AppColors.lightBlack,
          // iconDisabledColor: AppColors.lightBlack,
          items: items == null
              ? null
              : [
                  for (int i = 0; i < items!.length; i++)
                    DropdownMenuItem(
                      value: items![i].value,
                      enabled: items![i].enabled,
                      onTap: items![i].onTap,
                      alignment: items![i].alignment,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.0.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            5.verticalSpace,
                            items![i].child,
                            5.verticalSpace,
                            Divider(
                              height: 1.h,
                              color: (i + 1) == items!.length
                                  ? Colors.transparent
                                  : AppColors.grey.withOpacity(0.3),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
          hint: Text(
            hintText,
            style: AppTextStyle.regularGrey12.copyWith(fontSize: 12.w),
          ),
          onChanged: onChanges,
        )
      ],
    );
  }
}
