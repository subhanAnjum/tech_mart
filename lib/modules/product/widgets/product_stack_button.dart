import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_colors.dart';

class ProductStackButton extends StatelessWidget {
  const ProductStackButton({
    super.key,
    this.onTap,
    required this.assetPath,
  });
  final VoidCallback? onTap;
  final String assetPath;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(5.0),
        bottomLeft: Radius.circular(5.0),
      ),
      child: Container(
        height: 51.h,
        width: 49.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.lightBlue,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5.0),
            bottomLeft: Radius.circular(5.0),
          ),
        ),
        child: Image.asset(
          assetPath,
          height: 24.h,
          width: 22.w,
        ),
      ),
    );
  }
}
