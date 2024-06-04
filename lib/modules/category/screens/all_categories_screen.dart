import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:tech_mart/common/widgets/actions_button.dart';
import 'package:tech_mart/common/widgets/custom_app_bar.dart';
import 'package:tech_mart/common/widgets/search_text_field.dart';
import 'package:tech_mart/utils/app_images.dart';
import 'package:tech_mart/utils/extentions.dart';

import '../../../common/models/product_model.dart';
import '../../../common/widgets/product_horizontal_view.dart';
import '../../../common/widgets/staggered_grid.dart';
import '../../../common/widgets/category_item.dart';
import 'category_screen.dart';

class AllCategoriesScreen extends StatelessWidget {
  const AllCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String? title = 'Categories';
    List<Widget>? actions = [
      const ActionsButton(
        image: AppImages.icNotification,
        isSquared: true,
      ),
      const ActionsButton(
        image: AppImages.icMessages,
        isSquared: true,
      ),
      16.horizontal,
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
                padding: EdgeInsets.symmetric(horizontal: 18.0.w),
                withFilter: false,
              ),
              24.verticalSpace,
              //grid categories section
              AnimationLimiter(
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  mainAxisSpacing: 24.h,
                  crossAxisSpacing: 15.w,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.only(left: 20.0.w, right: 20.0.w),
                  children: [
                    ...List.generate(11, (index) {
                      const imageUrl = AppImages.gpu;
                      const lable = 'Graphic Cards';
                      return StaggeredGrid(
                          columnCount: 3,
                          position: index,
                          child: CategoryItem(
                            imageUrl: imageUrl,
                            lable: lable,
                            onTap: () => const CategoryScreen().push(context),
                          ));
                    }),
                  ],
                ),
              ),
              ProductHorizontalView(
                buttonText: 'See all Featured Ads',
                title: 'Featured Products',
                products: List.generate(3, (index) => ProductModel(0)),
              ),
            ]),
      ),
    );
  }
}
