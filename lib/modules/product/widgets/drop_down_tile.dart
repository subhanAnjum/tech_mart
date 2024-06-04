import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_mart/common/widgets/app_drop_down_button.dart';
import 'package:tech_mart/utils/extentions.dart';

import '../../../common/widgets/blue_black_shader.dart';
import '../../../utils/app_textstyle.dart';

class DropDownTile extends StatelessWidget {
  const DropDownTile({
    super.key,
    required this.lable,
    this.value,
    required this.items,
    required this.hintText,
    this.onChanges,
  });

  final String lable;
  final Object? value;
  final List<DropdownMenuItem<Object?>>? items;
  final String hintText;
  final void Function(Object?)? onChanges;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                BlueBlackShaderMask(
                    child: Text(
                  lable,
                  style: AppTextStyle.mediumBlack16.responsive,
                )),
              ],
            )),
        Expanded(
            flex: 8,
            child: AppDropDownButton(
              style: AppTextStyle.regularBlack12.responsive,

              value: value,

              // iconEnabledColor: AppColors.lightBlack,
              // iconDisabledColor: AppColors.lightBlack,
              items: items
                      ?.map((e) => DropdownMenuItem(
                            value: e.value,
                            onTap: e.onTap,
                            alignment: e.alignment,
                            enabled: e.enabled,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12.0.w),
                              child: e.child,
                            ),
                          ))
                      .toList() ??
                  [],
              hintText: hintText,

              onChanges: onChanges,
            ))
      ],
    );
  }
}
