import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_mart/utils/app_textstyle.dart';
import 'package:tech_mart/utils/extentions.dart';

import '../../../utils/app_colors.dart';

class StoryItem extends StatelessWidget {
  const StoryItem({
    super.key,
    required this.notHasStories,
    required this.imgUrl,
    required this.name,
    required this.isCurrentUser,
    required this.isLive,
  });

  final bool notHasStories;
  final String imgUrl;
  final String name;
  final bool isCurrentUser;
  final bool isLive;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 78.h,
                  width: 78.w,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: notHasStories ? AppColors.grey : null,
                      gradient:
                          notHasStories ? null : AppColors.pinkYellowGradient),
                  alignment: Alignment.center,
                  child: Container(
                    height: 73.h,
                    width: 73.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage(imgUrl), fit: BoxFit.cover),
                    ),
                  ),
                ),
                // add button
                if (isCurrentUser)
                  Positioned(
                    right: 2.w,
                    child: Container(
                      height: 22.h,
                      width: 22.w,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: Container(
                        height: 18.h,
                        width: 18.w,
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.add,
                          size: 16.w,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                //live banner
                if (isLive)
                  Positioned(
                    bottom: -4.h,
                    left: 24.w,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                      decoration: BoxDecoration(
                        gradient: AppColors.goldenGradient,
                        border: Border.all(color: AppColors.white),
                        borderRadius: BorderRadius.circular(5.0.w),
                      ),
                      child: ShaderMask(
                          shaderCallback: (rect) {
                            return AppColors.blueBlackGradient
                                .createShader(rect);
                          },
                          blendMode: BlendMode.srcIn,
                          child: Text(
                            'LIVE',
                            style:
                                AppTextStyle.boldBlack8.copyWith(fontSize: 8.h),
                          )),
                    ),
                  ),
              ],
            ),
            5.verticalSpace,
            SizedBox(
              width: 78.w,
              child: Text(
                isCurrentUser ? 'Your Story' : name,
                maxLines: 1,
                textAlign: TextAlign.center,
                style: AppTextStyle.regularBlack12.responsive,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ],
    );
  }
}
