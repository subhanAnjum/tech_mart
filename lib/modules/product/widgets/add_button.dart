import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/widgets/blue_black_shader.dart';
import '../../../utils/app_colors.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    super.key,
    this.onTap,
    this.height,
    this.width,
  });
  final VoidCallback? onTap;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(5.0.w),
      child: Container(
        width: width ?? 378.w,
        height: height ?? 82.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.grey),
            color: Colors.white,
            borderRadius: BorderRadius.circular(5.0.w)),
        child: Container(
          height: 55.w,
          width: 55.w,
          decoration: const BoxDecoration(
              gradient: AppColors.goldenGradient, shape: BoxShape.circle),
          alignment: Alignment.center,
          child: BlueBlackShaderMask(
              child: Icon(
            Icons.add_rounded,
            size: 26.w,
          )),
        ),
      ),
    );
  }
}
