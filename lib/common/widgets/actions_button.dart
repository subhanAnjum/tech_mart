import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_mart/utils/app_colors.dart';
import 'package:tech_mart/utils/app_textstyle.dart';

class ActionsButton extends StatelessWidget {
  const ActionsButton({
    super.key,
    this.badgeText,
    required this.image,
    this.onTap,
    this.isSquared = false,
  });
  final String? badgeText;
  final String image;
  final VoidCallback? onTap;
  final bool isSquared;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: isSquared ? 44.w : 55.w,
        height: isSquared ? 38.h : null,
        alignment: isSquared ? Alignment.center : Alignment.centerLeft,
        padding: EdgeInsets.all(isSquared ? 0.0 : 5.0.w),
        margin: EdgeInsets.all(isSquared ? 2.0.w : 0.0),
        decoration: BoxDecoration(
          color: AppColors.bgColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5.0.w),
            bottomLeft: Radius.circular(5.0.w),
            topRight: isSquared ? Radius.circular(5.0.w) : Radius.zero,
            bottomRight: isSquared ? Radius.circular(5.0.w) : Radius.zero,
          ),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topRight,
          children: [
            Image.asset(
              image,
              height: 29.h,
              width: 29.w,
            ),
            if (badgeText != null)
              Positioned(
                top: -2.w,
                right: -2.w,
                child: Container(
                  padding: EdgeInsets.all(2.5.w),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.red),
                  child: Text(
                    badgeText!,
                    style: AppTextStyle.regularWhite10.copyWith(fontSize: 10.w),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
