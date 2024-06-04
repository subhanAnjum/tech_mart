import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_mart/common/widgets/app_button.dart';
import 'package:tech_mart/common/widgets/app_drop_down_button.dart';
import 'package:tech_mart/common/widgets/blue_black_shader.dart';
import 'package:tech_mart/utils/app_colors.dart';
import 'package:tech_mart/utils/app_textstyle.dart';
import 'package:tech_mart/utils/extentions.dart';

class CalculateShippingDialog extends StatelessWidget {
  const CalculateShippingDialog({
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
        padding: EdgeInsets.fromLTRB(30.w, 30.h, 24.w, 48.h),
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
                      'Calculate Shipping',
                      style:
                          AppTextStyle.mediumBlack30.copyWith(fontSize: 30.h),
                    )),
                  ],
                ),
                Positioned(
                  left: -17.w,
                  top: -2.h,
                  child: const BackButton(),
                )
              ],
            ),
            20.verticalSpace,
            AppDropDownButton(
                lable: 'Country',
                value: null,
                onChanges: (p0) {},
                items: ['USA', 'QATAR', 'UAE']
                    .map((e) => DropdownMenuItem(
                          child: Text(
                            e,
                            style: TextStyle(color: AppColors.grey).responsive,
                          ),
                          value: e,
                        ))
                    .toList(),
                hintText: ''),
            20.verticalSpace,
            AppDropDownButton(
                lable: 'City',
                value: null,
                onChanges: (p0) {},
                items: ['Dubai', 'Riyadh', 'Sharjah']
                    .map((e) => DropdownMenuItem(
                          child: Text(
                            e,
                            style: TextStyle(color: AppColors.grey).responsive,
                          ),
                          value: e,
                        ))
                    .toList(),
                hintText: ''),
            160.verticalSpace,
            AppButton(
              onPressed: () {
                context.pop();
              },
              text: 'Save',
              faded: false,
              height: 65.h,
              width: 300.w,
              style: AppTextStyle.mediumBlack18,
            ),
            26.verticalSpace,
            Text(
              'Kindly note Shipping cost will depend on your Location',
              textAlign: TextAlign.center,
              style: AppTextStyle.mediumBlack12.responsive,
            ),
          ],
        ),
      ),
    );
  }
}
