import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_mart/utils/extentions.dart';

import '../../utils/app_textstyle.dart';
import 'blue_black_shader.dart';

class LableWrapper extends StatelessWidget {
  const LableWrapper({
    super.key,
    this.lable,
    this.lableStyle,
    required this.child,
  });
  final String? lable;
  final TextStyle? lableStyle;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (lable != null) ...[
          BlueBlackShaderMask(
              child: Text(
            lable!,
            style:
                lableStyle?.responsive ?? AppTextStyle.mediumBlack16.responsive,
          )),
          2.verticalSpace,
        ],
        child
      ],
    );
  }
}
