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
import 'staggered_grid.dart';

class ProductGridView extends StatelessWidget {
  const ProductGridView({
    super.key,
    this.buttonText,
    required this.products,
    this.title,
    this.iconPath,
    this.onButtonPressed,
    this.horizontalPadding,
  });
  final String? buttonText;
  final String? title;
  final List<ProductModel> products;
  final String? iconPath;
  final VoidCallback? onButtonPressed;
  final double? horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return products.isEmpty
        ? const SizedBox()
        : Column(
            children: [
              if (title != null) ...[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          if (iconPath != null) ...[
                            Image(
                              image: AssetImage(iconPath!),
                              height: 24,
                              width: 24,
                            ),
                            20.horizontal
                          ],
                          Text(
                            title!,
                            style: AppTextStyle.mediumBlack18
                                .copyWith(color: AppColors.blue),
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
              AnimationLimiter(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 245.h,
                      crossAxisSpacing: 26.w,
                      mainAxisSpacing: 14.h),
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(
                      vertical: title != null ? 20.0 : 10.0,
                      horizontal: horizontalPadding ?? 0),
                  physics: const NeverScrollableScrollPhysics(),
                  // crossAxisCount: 2,
                  // childAspectRatio: 9 / 12.5,
                  // crossAxisSpacing: 29.0,
                  // crossAxisSpacing: 36.0,
                  // mainAxisSpacing: 14.0,
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return FittedBox(
                      fit: BoxFit.cover,
                      child: StaggeredGrid(
                        columnCount: 2,
                        position: index,
                        child: ProductItem(
                            imageUrl: product.imageUrl,
                            imageCount: product.imageCount,
                            videoCount: product.videoCount,
                            title: product.title,
                            price: product.price,
                            rating: product.rating,
                            isFeatured: product.isFeatured),
                      ),
                    );
                  },
                  // children: [
                  //   ...List.generate(products.length, (index) {
                  //     final product = products[index];
                  //     return FittedBox(
                  //       fit: BoxFit.cover,
                  //       child: StaggeredGrid(
                  //         columnCount: 2,
                  //         position: index,
                  //         child: ProductItem(
                  //             imageUrl: product.imageUrl,
                  //             imageCount: product.imageCount,
                  //             videoCount: product.videoCount,
                  //             title: product.title,
                  //             price: product.price,
                  //             rating: product.rating,
                  //             isFeatured: product.isFeatured),
                  //       ),
                  //     );
                  //   })
                  // ],
                ),
              ),
              if (buttonText != null) ...[
                2.vertical,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppButton(
                      onPressed: () {},
                      faded: false,
                      width: 344.w,
                      height: 62.h,
                      style: AppTextStyle.mediumBlack18,
                      text: buttonText!,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ],
                ),
              ],
              22.vertical,
            ],
          );
  }
}
