import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_colors.dart';

class ProductTopButton extends StatelessWidget {
  const ProductTopButton({
    super.key,
    this.onTap,
    this.height,
    this.width,
    required this.assetImage,
    this.isSelected = false,
  });
  final VoidCallback? onTap;
  final double? height;
  final double? width;
  final String assetImage;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8.w),
      child: Container(
        height: height ?? 36.w,
        width: width ?? 36.w,
        decoration: BoxDecoration(
            gradient: isSelected ? AppColors.goldenGradient : null,
            borderRadius: BorderRadius.circular(8.w),
            border: Border.all(color: AppColors.grey, width: 0.5)),
        alignment: Alignment.center,
        child: Image.asset(
          assetImage,
          height: 22.w,
          width: 22.w,
        ),
      ),
    );
  }
}
