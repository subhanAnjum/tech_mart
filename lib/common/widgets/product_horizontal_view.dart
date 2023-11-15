import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:tech_mart/utils/extentions.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_textstyle.dart';
import '../models/product_model.dart';
import 'app_button.dart';
import 'arrow_button.dart';
import 'product_item.dart';
import 'staggered_list_horizontal.dart';

class ProductHorizontalView extends StatelessWidget {
  const ProductHorizontalView({
    super.key,
    this.buttonText,
    required this.products,
    this.title,
    this.iconPath,
    this.onButtonPressed,
  });
  final String? buttonText;
  final String? title;
  final List<ProductModel> products;
  final String? iconPath;
  final VoidCallback? onButtonPressed;

  @override
  Widget build(BuildContext context) {
    return products.isEmpty
        ? const SizedBox()
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (title != null) ...[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          if (iconPath != null) ...[
                            Image(
                              image: AssetImage(iconPath!),
                              height: 24.h,
                              width: 24.w,
                            ),
                            20.horizontalSpace
                          ],
                          Text(
                            title!,
                            style: AppTextStyle.mediumBlack18
                                .copyWith(color: AppColors.blue)
                                .responsive,
                          ),
                        ],
                      ),
                      ArrowButton(
                        onTap: onButtonPressed,
                      ),
                    ],
                  ),
                ),
              ],
              SizedBox(
                height: 248.h,
                child: AnimationLimiter(
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                    itemBuilder: (context, index) {
                      final product = products[index];

                      return StaggeredListHorizontal(
                          position: index,
                          verticalOffset: 50,
                          horizontalOffset: 10,
                          child: ProductItem(
                              onReactionTap: (p0) {
                                print('reaction selected: $p0');
                              },
                              imageUrl: product.imageUrl,
                              imageCount: product.imageCount,
                              videoCount: product.videoCount,
                              title: product.title,
                              price: product.price,
                              rating: product.rating,
                              isFeatured: product.isFeatured));
                    },
                    separatorBuilder: (context, index) {
                      return 10.horizontalSpace;
                    },
                    itemCount: products.length,
                  ),
                ),
              ),
              12.verticalSpace,
              if (buttonText != null) ...[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppButton(
                        borderRadius: BorderRadius.circular(5.w),
                        width: 233.h,
                        height: 36.w,
                        onPressed: onButtonPressed,
                        text: buttonText!),
                  ],
                ),
              ],
              22.verticalSpace,
            ],
          );
  }
}
