import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:tech_mart/common/widgets/actions_button.dart';
import 'package:tech_mart/common/widgets/custom_app_bar.dart';
import 'package:tech_mart/common/widgets/search_text_field.dart';
import 'package:tech_mart/common/widgets/staggered_list_horizontal.dart';
import 'package:tech_mart/modules/category/screens/sub_category_screen.dart';
import 'package:tech_mart/utils/app_colors.dart';
import 'package:tech_mart/utils/app_images.dart';
import 'package:tech_mart/utils/app_textstyle.dart';
import 'package:tech_mart/utils/extentions.dart';

import '../../../common/models/product_model.dart';
import '../../../common/widgets/product_horizontal_view.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String? title = 'Fashion';
    List<Widget>? actions = [
      const ActionsButton(
        image: AppImages.icNotification,
        isSquared: true,
      ),
      const ActionsButton(
        image: AppImages.icMessages,
        isSquared: true,
      ),
      16.horizontalSpace,
    ];
    return Scaffold(
      appBar: customAppBar(
        title: title,
        actions: actions,
      ),
      body: AnimationLimiter(
        child: ListView(
            padding: EdgeInsets.symmetric(vertical: 15.0.h),
            children: [
              SearchTextField(
                padding:
                    EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 17.h),
              ),
              10.verticalSpace,
              //legend section
              StaggeredListHorizontal(
                position: 0,
                child: Container(
                  height: 186.h,
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                        color: AppColors.shadowColor.withOpacity(0.1),
                        offset: Offset(1.w, 1.h),
                        spreadRadius: 0,
                        blurRadius: 8.0.w)
                  ]),
                  child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Image(image: AssetImage(AppImages.legend))]),
                ),
              ),
              15.verticalSpace,
              ProductHorizontalView(
                buttonText: 'See all Featured Products',
                title: 'Featured Products',
                products: List.generate(3, (index) => ProductModel()),
              ),
              ...List.generate(
                3,
                (index) => Material(
                  elevation: 0,
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => SubCategoryScreen().push(context),
                    child: Container(
                      margin: EdgeInsets.fromLTRB(10.w, 0, 16.w, 10.h),
                      height: 62.h,
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      decoration: BoxDecoration(
                        gradient: AppColors.goldenGradient,
                        borderRadius: BorderRadius.circular(5.w),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Men’s Clothing',
                            maxLines: 1,
                            style: AppTextStyle.regularBlack14
                                .copyWith(
                                    color: AppColors.blue,
                                    fontWeight: FontWeight.w500)
                                .responsive,
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                CupertinoIcons.chevron_down,
                                color: AppColors.black,
                                size: 14.w,
                              ),
                              4.verticalSpace,
                              Text(
                                '50 Products',
                                maxLines: 1,
                                style: AppTextStyle.regularBlack10
                                    .copyWith(
                                      color: AppColors.blue,
                                    )
                                    .responsive,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
