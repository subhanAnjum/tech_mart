import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_mart/common/widgets/app_button.dart';
import 'package:tech_mart/common/widgets/blue_black_shader.dart';
import 'package:tech_mart/utils/app_colors.dart';
import 'package:tech_mart/utils/app_images.dart';
import 'package:tech_mart/utils/app_textstyle.dart';
import 'package:tech_mart/utils/extentions.dart';

class FeatureYourProductsDialog extends StatelessWidget {
  const FeatureYourProductsDialog({
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
                  'Feature Your Product',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.mediumBlack30.responsive,
                )),
              ],
            ),
            25.verticalSpace,
            BlueBlackShaderMask(
              child: Text(
                'Upgrade to a Featured Product',
                textAlign: TextAlign.center,
                style: AppTextStyle.mediumBlack14.responsive,
              ),
            ),
            20.verticalSpace,
            Text(
              'Be on top! This upgrade will attract more, Customers/Users to your Profile/Store. The Product will be displayed in the Feature Product listing .',
              textAlign: TextAlign.center,
              style: AppTextStyle.mediumBlack12
                  .copyWith(
                    color: AppColors.blueGrey,
                  )
                  .responsive,
            ),
            16.verticalSpace,
            BlueBlackShaderMask(
              child: Text(
                'Feature your Product For next 24 hour for \$25.00 ',
                textAlign: TextAlign.center,
                style: AppTextStyle.mediumBlack14.responsive,
              ),
            ),
            22.verticalSpace,
            Padding(
              padding: EdgeInsets.only(left: 23.0.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        AppImages.ic_tick,
                        width: 10.8.w,
                        height: 7.9.h,
                      ),
                      28.horizontalSpace,
                      Expanded(
                        child: BlueBlackShaderMask(
                            child: Text(
                          'Increase visibility at top of searches.',
                          style: AppTextStyle.regularBlack12.responsive,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        )),
                      ),
                    ],
                  ),
                  20.verticalSpace,
                  Row(
                    children: [
                      Image.asset(
                        AppImages.ic_tick,
                        width: 10.8.w,
                        height: 7.9.h,
                      ),
                      28.horizontalSpace,
                      Expanded(
                        child: BlueBlackShaderMask(
                            child: Text(
                          'Increase sales by reaching new customers.',
                          style: AppTextStyle.regularBlack12.responsive,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        )),
                      ),
                    ],
                  ),
                  20.verticalSpace,
                  Row(
                    children: [
                      Image.asset(
                        AppImages.ic_tick,
                        width: 10.8.w,
                        height: 7.9.h,
                      ),
                      28.horizontalSpace,
                      Expanded(
                        child: BlueBlackShaderMask(
                            child: Text(
                          'Build a larger community or following.',
                          style: AppTextStyle.regularBlack12.responsive,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        )),
                      ),
                    ],
                  ),
                  20.verticalSpace,
                  Row(
                    children: [
                      Image.asset(
                        AppImages.ic_tick,
                        width: 10.8.w,
                        height: 7.9.h,
                      ),
                      28.horizontalSpace,
                      Expanded(
                        child: BlueBlackShaderMask(
                            child: Text(
                          'Attract potential customers or users.',
                          style: AppTextStyle.regularBlack12.responsive,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        )),
                      ),
                    ],
                  ),
                  20.verticalSpace,
                  Row(
                    children: [
                      Image.asset(
                        AppImages.ic_tick,
                        width: 10.8.w,
                        height: 7.9.h,
                      ),
                      28.horizontalSpace,
                      Expanded(
                        child: BlueBlackShaderMask(
                            child: Text(
                          'Improve your chances of success or growth.',
                          style: AppTextStyle.regularBlack12.responsive,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        )),
                      ),
                    ],
                  ),
                  20.verticalSpace,
                  Row(
                    children: [
                      Image.asset(
                        AppImages.ic_tick,
                        width: 10.8.w,
                        height: 7.9.h,
                      ),
                      28.horizontalSpace,
                      BlueBlackShaderMask(
                          child: Text(
                        'Increase visibility at top of searches.',
                        style: AppTextStyle.regularBlack12.responsive,
                        maxLines: 1,
                      )),
                    ],
                  ),
                  32.verticalSpace,
                  AppButton(
                    onPressed: () {
                      context.pop();
                    },
                    text: 'Confirm & Pay',
                    faded: false,
                    height: 65.h,
                    width: 300.w,
                    style: AppTextStyle.mediumBlack18,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
