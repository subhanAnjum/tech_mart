import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../utils/app_colors.dart';
import 'blue_smooth_shader_mask.dart';

PreferredSize customAppBar({String? title, List<Widget>? actions}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(kToolbarHeight.h),
    child: Container(
      color: AppColors.systemColor,
      child: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: AppColors.goldenGradient,
          ),
          child: AppBar(
            title: title != null
                ? BlueSmoothShaderMask(
                    child: Text(
                      title,
                      // colors: AppColors.blueSmoothGradient.colors,
                      // gradientDirection: GradientDirection.ttb,
                    ),
                  )
                : null,
            actions: actions,
          ),
        ),
      ),
    ),
  );
}
