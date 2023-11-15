import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_mart/common/widgets/app_button.dart';
import 'package:tech_mart/common/widgets/app_text_field.dart';
import 'package:tech_mart/common/widgets/blue_black_shader.dart';
import 'package:tech_mart/utils/app_colors.dart';
import 'package:tech_mart/utils/app_images.dart';
import 'package:tech_mart/utils/app_textstyle.dart';
import 'package:tech_mart/utils/extentions.dart';

class ProductOptionsDialog extends StatefulWidget {
  const ProductOptionsDialog({
    super.key,
  });

  @override
  State<ProductOptionsDialog> createState() => _ProductOptionsDialogState();
}

class _ProductOptionsDialogState extends State<ProductOptionsDialog> {
  bool isTyping = false;
  List<String> options = [];
  final TextEditingController optionsC = TextEditingController();
  @override
  void dispose() {
    optionsC.dispose();
    super.dispose();
  }

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
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisSize: MainAxisSize.min,
          shrinkWrap: true,
          physics: options.isNotEmpty ? null : NeverScrollableScrollPhysics(),
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
                      'Product Option',
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
            AppTextField(
              lable: 'Title',
              gradientBorder: false,
              initialValue: 'Size',
              bottomText: '15 Characters Maximum',
            ),
            26.verticalSpace,
            ...options.map(
              (e) => Row(
                children: [
                  Container(
                    height: 60.h,
                    width: 147.w,
                    margin: EdgeInsets.only(bottom: 20.h),
                    child: AppTextField(
                      initialValue: e,
                      isDisabled: true,
                      gradientBorder: false,
                    ),
                  )
                ],
              ),
            ),
            Row(
              children: [
                isTyping
                    ? SizedBox(
                        height: 60.h,
                        width: 147.w,
                        child: DottedBorder(
                          borderType: BorderType.RRect,
                          color: AppColors.grey,
                          padding: EdgeInsets.zero,
                          strokeWidth: 2.w,
                          dashPattern: [5, 4],
                          radius: Radius.circular(5.w),
                          child: AppTextField(
                            borderColor: Colors.transparent,
                            controller: optionsC,
                            gradientBorder: false,
                          ),
                        ),
                      )
                    : SizedBox(
                        height: 43.h,
                        width: 138.w,
                        child: Row(
                          children: [
                            Expanded(
                              child: Directionality(
                                textDirection: TextDirection.rtl,
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    setState(() {
                                      isTyping = true;
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.lightBlue,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.w),
                                      )),
                                  label: Text(
                                    'Add Option',
                                    style: AppTextStyle.mediumWhite12
                                        .copyWith(fontSize: 12)
                                        .responsive,
                                  ),
                                  icon: Icon(
                                    Icons.add_rounded,
                                    color: Colors.white,
                                    size: 12.w,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                //check cross buttons
                if (isTyping)
                  Row(
                    children: [
                      37.horizontalSpace,
                      InkWell(
                        borderRadius: BorderRadius.circular(500),
                        onTap: () {
                          if (optionsC.text.isEmpty) return;
                          setState(() {
                            isTyping = false;
                            options.add(optionsC.text);
                            optionsC.clear();
                          });
                        },
                        child: Icon(
                          Icons.check_circle_rounded,
                          size: 25.w,
                          color: Colors.green,
                        ),
                      ),
                      37.horizontalSpace,
                      InkWell(
                        borderRadius: BorderRadius.circular(500),
                        onTap: () {
                          setState(() {
                            isTyping = false;
                            optionsC.clear();
                          });
                        },
                        child: Image.asset(
                          AppImages.ic_circle_close,
                          height: 23.w,
                          width: 23.w,
                        ),
                      ),
                    ],
                  )
              ],
            ),
            62.verticalSpace,
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
            65.verticalSpace,
          ],
        ),
      ),
    );
  }
}
