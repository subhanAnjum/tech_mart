import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_mart/utils/extentions.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../../utils/app_textstyle.dart';
import 'blue_black_shader.dart';

class CountryTile extends StatelessWidget {
  const CountryTile({
    super.key,
    this.padding,
    required this.imagePath,
    required this.title,
    this.isPremium = false,
    this.trailing,
    this.isSelected = false,
    this.onTap,
  });

  final EdgeInsets? padding;
  final String imagePath;
  final String title;
  final bool isPremium;
  final String? trailing;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 80.h,
        margin: padding,
        padding: EdgeInsets.fromLTRB(16.w, 9.h, 16.w, 13.h),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13.w),
          color: isSelected ? null : Colors.white,
          gradient: isSelected
              ? LinearGradient(colors: [
                  AppColors.secondary.withOpacity(0.55),
                  AppColors.primary.withOpacity(0.55)
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)
              : null,
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 7.h),
                blurRadius: 20.w,
                color: AppColors.shadowColor.withOpacity(0.1))
          ],
        ),
        alignment: Alignment.center,
        child: Row(children: [
          Container(
            height: 55.h,
            width: 55.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
          8.5.horizontalSpace,
          Expanded(
            child: BlueBlackShaderMask(
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyle.regularBlack16.responsive,
              ),
            ),
          ),
          isPremium
              ? Image.asset(
                  AppImages.crownGroup,
                  height: 38.h,
                  width: 38.w,
                )
              : BlueBlackShaderMask(
                  child: Text(
                  trailing ?? '',
                  style: AppTextStyle.regularBlack16.responsive,
                )),
        ]),
      ),
    );
  }
}
