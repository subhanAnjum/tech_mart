import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_mart/common/models/product_model.dart';
import 'package:tech_mart/common/widgets/actions_button.dart';
import 'package:tech_mart/common/widgets/custom_app_bar.dart';
import 'package:tech_mart/common/widgets/product_horizontal_view.dart';
import 'package:tech_mart/common/widgets/products_grid_view.dart';
import 'package:tech_mart/common/widgets/search_text_field.dart';

import '../../../utils/app_images.dart';

class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final actions = [
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
      appBar: customAppBar(title: 'Men\'s Fashion', actions: actions),
      body:
          ListView(padding: EdgeInsets.symmetric(vertical: 15.0.h), children: [
        SearchTextField(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
        ),
        24.verticalSpace,
        ProductHorizontalView(
          buttonText: 'See all Featured Products',
          title: 'Featured Products',
          products: List.generate(3, (index) => ProductModel()),
        ),
        ProductGridView(
            horizontalPadding: 18.0.w,
            products: List.generate(12, (index) => ProductModel(1))),
      ]),
    );
  }
}
