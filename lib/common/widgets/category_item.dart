import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:simple_gradient_text/simple_gradient_text.dart';

import 'blue_black_shader.dart';
import '../../utils/app_colors.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.imageUrl,
    required this.lable,
    this.onTap,
  });

  final String imageUrl;
  final String lable;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(4.0.w),
        decoration: BoxDecoration(
          gradient: AppColors.goldenGradient,
          borderRadius: BorderRadius.circular(10.0.w),
        ),
        child: Container(
          padding: EdgeInsets.all(2.0.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0.w),
          ),
          child: Column(children: [
            Expanded(
                flex: 3,
                child: Image.asset(
                  imageUrl,
                  fit: BoxFit.contain,
                  width: double.infinity,
                )),
            Expanded(
                child: BlueBlackShaderMask(
              child: Text(
                lable,
                style: TextStyle(color: Colors.black, fontSize: 12.h),
                // colors: AppColors.blueBlackGradient.colors,
                // gradientDirection: GradientDirection.ttb,
              ),
            ))
          ]),
        ),
      ),
    );
  }
}
