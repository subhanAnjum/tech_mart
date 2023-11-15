import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:tech_mart/common/models/store_model.dart';
import 'package:tech_mart/common/widgets/store_item.dart';
import 'package:tech_mart/utils/extentions.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_textstyle.dart';
import 'app_button.dart';
import 'arrow_button.dart';
import 'staggered_grid.dart';

class StoreGridView extends StatelessWidget {
  const StoreGridView({
    super.key,
    this.buttonText,
    required this.stores,
    this.title,
    this.iconPath,
    this.onButtonPressed,
  });
  final String? buttonText;
  final String? title;
  final List<StoreModel> stores;
  final String? iconPath;
  final VoidCallback? onButtonPressed;

  @override
  Widget build(BuildContext context) {
    return stores.isEmpty
        ? const SizedBox()
        : Column(
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
                            style: AppTextStyle.mediumBlack18.responsive
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
                      mainAxisExtent: 251.h,
                      crossAxisSpacing: 17.w,
                      mainAxisSpacing: 16.h),
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(vertical: 20.0.h),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: stores.length,
                  itemBuilder: (context, index) {
                    final store = stores[index];

                    return FittedBox(
                      fit: BoxFit.cover,
                      child: StaggeredGrid(
                        columnCount: 2,
                        position: index,
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: StoretItem(
                              imageUrl: store.imageUrl,
                              title: store.title,
                              rating: store.rating,
                              feedback: store.feedback),
                        ),
                      ),
                    );
                  },
                  // children: [
                  //   ...List.generate(stores.length, (index) {
                  //     final store = stores[index];
                  //     return FittedBox(
                  //       fit: BoxFit.cover,
                  //       child: StaggeredGrid(
                  //         columnCount: 2,
                  //         position: index,
                  //         child: FittedBox(
                  //           fit: BoxFit.contain,
                  //           child: StoretItem(
                  //               imageUrl: store.imageUrl,
                  //               title: store.title,
                  //               rating: store.rating,
                  //               feedback: store.feedback),
                  //         ),
                  //       ),
                  //     );
                  //   })
                  // ],
                ),
              ),
              2.verticalSpace,
              if (buttonText != null) ...[
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
                      borderRadius: BorderRadius.circular(10.0.w),
                    ),
                  ],
                ),
              ],
              22.verticalSpace,
            ],
          );
  }
}
