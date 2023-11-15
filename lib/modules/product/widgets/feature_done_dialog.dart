import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_mart/common/widgets/app_button.dart';
import 'package:tech_mart/common/widgets/blue_black_shader.dart';
import 'package:tech_mart/utils/app_colors.dart';
import 'package:tech_mart/utils/app_images.dart';
import 'package:tech_mart/utils/app_textstyle.dart';
import 'package:tech_mart/utils/extentions.dart';

class FeatureDoneDialog extends StatelessWidget {
  const FeatureDoneDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
      backgroundColor: Colors.white,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0.w),
          color: Colors.white,
        ),
        padding: EdgeInsets.fromLTRB(27.w, 27.h, 40.w, 55.h),
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                BackButton(
                  style: IconButton.styleFrom(
                    iconSize: 20.w,
                    visualDensity: VisualDensity(vertical: -4),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlueBlackShaderMask(
                    child: Text(
                  'Feature Done',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.mediumBlack30.responsive,
                )),
              ],
            ),
            25.verticalSpace,
            Text(
              'Your Feature service order has been confirmed. You have opted to feature your product for \$25.00 for next 24 hours',
              textAlign: TextAlign.center,
              style: AppTextStyle.mediumBlack12
                  .copyWith(
                    color: AppColors.blueGrey,
                  )
                  .responsive,
            ),
            // 16.verticalSpace,
            Image.asset(
              AppImages.rocket_animation,
              height: 380.h,
              fit: BoxFit.cover,
            ),
            // 16.verticalSpace,
            AppButton(
              onPressed: () {
                context.pop();
              },
              text: 'Okay',
              faded: false,
              height: 65.h,
              width: 300.w,
              style: AppTextStyle.mediumBlack18,
            ),
          ],
        ),
      ),
    );
  }
}
