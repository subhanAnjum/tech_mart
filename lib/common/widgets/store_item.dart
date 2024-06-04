import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:tech_mart/utils/extentions.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_textstyle.dart';
import 'blue_black_shader.dart';

class StoretItem extends StatelessWidget {
  const StoretItem({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.rating,
    required this.feedback,
  });

  final String imageUrl;
  final String feedback;
  final String title;
  final String rating;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            padding: EdgeInsets.all(5.0.w),
            width: 184.w,
            height: 239.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0.w),
                topRight: Radius.circular(16.0.w),
                bottomLeft: Radius.circular(16.0.w),
                bottomRight: Radius.circular(16.0.w),
              ),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: AppColors.shadowColor.withOpacity(0.2),
                    offset: Offset(2.w, 2.h),
                    spreadRadius: 0,
                    blurRadius: 3.0.w)
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //image
                Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 130.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.0.w),
                          image: DecorationImage(
                              image: AssetImage(imageUrl), fit: BoxFit.cover)),
                    ),
                  ],
                ),
                //Title
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          BlueBlackShaderMask(
                            child: Text(
                              title,
                              // colors: AppColors.blueBlackGradient.colors,
                              // gradientDirection: GradientDirection.ttb,
                              maxLines: 2,
                              style: AppTextStyle.regularBlack14.responsive,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                    34.horizontalSpace,
                  ],
                ),
                //price

                //rating
                Row(
                  children: [
                    Icon(
                      Icons.star_rounded,
                      color: AppColors.primary,
                      size: 20.w,
                    ),
                    4.horizontalSpace,
                    Text(
                      "Reviews - $rating",
                      maxLines: 1,
                      style: AppTextStyle.regularBlack14.responsive
                          .copyWith(color: AppColors.orange),
                      overflow: TextOverflow.ellipsis,
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 4.0.h),
                  child: BlueBlackShaderMask(
                    child: Text(
                      feedback,
                      maxLines: 1,
                      style: AppTextStyle.regularBlack10.responsive,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                )
              ],
            ),
          ),
          // shop button and featured tag
          // shopping bag
          Positioned(
            bottom: 10.h,
            right: 10.w,
            child: Container(
              height: 34.h,
              width: 34.w,
              decoration: const BoxDecoration(
                  color: AppColors.lightBlue, shape: BoxShape.circle),
              alignment: Alignment.center,
              child: Icon(
                Icons.add_rounded,
                size: 24.w,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
