import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:tech_mart/common/widgets/product_list_tile.dart';
import 'package:tech_mart/common/widgets/staggered_list_horizontal.dart';

import '../../utils/app_textstyle.dart';
import '../models/product_model.dart';
import 'app_button.dart';

class ProductsVerticalView extends StatelessWidget {
  const ProductsVerticalView({
    super.key,
    required this.products,
    this.padding,
    this.onButtonPressed,
    this.buttonText,
  });

  final List<ProductModel> products;
  final EdgeInsets? padding;
  final VoidCallback? onButtonPressed;
  final String? buttonText;

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: Column(
        children: [
          ListView.separated(
              itemCount: products.length,
              padding: padding,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) =>
                  index + 1 == (products.length)
                      ? 0.verticalSpace
                      : 10.verticalSpace,
              itemBuilder: (context, index) {
                final product = products[index];
                return StaggeredListHorizontal(
                    position: index, child: ProductListTile(product: product));
              }),
          if (buttonText != null) ...[
            20.verticalSpace,
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
        ],
      ),
    );
  }
}
