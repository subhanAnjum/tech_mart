import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_mart/common/widgets/app_button.dart';
import 'package:tech_mart/common/widgets/blue_black_shader.dart';
import 'package:tech_mart/utils/app_colors.dart';
import 'package:tech_mart/utils/app_textstyle.dart';
import 'package:tech_mart/utils/extentions.dart';

class UpgradePremiumDialog extends StatefulWidget {
  const UpgradePremiumDialog({
    super.key,
  });

  @override
  State<UpgradePremiumDialog> createState() => _UpgradePremiumDialogState();
}

class _UpgradePremiumDialogState extends State<UpgradePremiumDialog> {
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
        padding: EdgeInsets.fromLTRB(30.w, 30.h, 24.w, 62.h),
        width: double.infinity,
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisSize: MainAxisSize.min,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.centerLeft,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BlueBlackShaderMask(
                        child: Text(
                      'Upgrade to Premium',
                      style:
                          AppTextStyle.mediumBlack30.copyWith(fontSize: 30.h),
                    )),
                  ],
                ),
                Positioned(
                  left: -17.w,
                  top: -10.h,
                  child: const BackButton(),
                )
              ],
            ),
            20.verticalSpace,
            Text(
              'Your Feature service order has been confirmed. You have opted to feature your product for \$25.00 for next 24 hours',
              textAlign: TextAlign.center,
              style: AppTextStyle.mediumBlack12.copyWith(
                color: AppColors.lightBlack,
              ),
            ),
            35.verticalSpace,
            AppButton(
              onPressed: () {
                context.pop();
              },
              text: 'Upgrade to Premium',
              faded: false,
              height: 62.h,
              width: 300.w,
              style: AppTextStyle.mediumBlack18,
            ),
            15.verticalSpace,
            AppButton(
              onPressed: () {
                context.pop();
              },
              inversed: true,
              text: 'Cancle',
              faded: false,
              height: 62.h,
              width: 300.w,
              style: AppTextStyle.mediumBlack18,
            ),
          ],
        ),
      ),
    );
  }
}
