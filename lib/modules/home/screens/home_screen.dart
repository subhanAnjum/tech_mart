import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:tech_mart/common/models/product_model.dart';
import 'package:tech_mart/common/widgets/app_button.dart';
import 'package:tech_mart/common/widgets/arrow_button.dart';
import 'package:tech_mart/common/widgets/staggered_grid.dart';
import 'package:tech_mart/common/widgets/staggered_list_horizontal.dart';
import 'package:tech_mart/modules/category/screens/all_categories_screen.dart';
import 'package:tech_mart/modules/category/screens/category_screen.dart';
import 'package:tech_mart/utils/app_colors.dart';
import 'package:tech_mart/utils/app_images.dart';
import 'package:tech_mart/utils/app_textstyle.dart';
import 'package:tech_mart/utils/extentions.dart';

import '../../../common/widgets/product_horizontal_view.dart';
import '../../../common/widgets/category_item.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/story_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _storyScrollController = ScrollController();
  @override
  void dispose() {
    _storyScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: ListView(
        children: [
          homeAppbar(
            context: context,
            notificationBadgeText: '3',
            messagesBadgeText: '1',
            onTapMenu: () {},
            onTapMessages: () {},
            onTapNotification: () {},
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.0.w),
            child: Text(
              'Welcome Faz Sam,',
              style: AppTextStyle.mediumPrimary24
                  .copyWith(color: AppColors.blue)
                  .responsive,
            ),
          ),
          //stories
          Container(
            height: 101.h,
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 10.0.h, bottom: 10.0.h),
            child: Stack(
              alignment: Alignment.centerRight,
              children: [
                AnimationLimiter(
                  child: ListView.separated(
                    controller: _storyScrollController,
                    itemCount: 12,
                    padding: EdgeInsets.only(
                      left: 16.0.w,
                      right: 16.0.w,
                    ),
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) => 10.horizontalSpace,
                    itemBuilder: (context, index) {
                      bool isCurrentUser = index == 0;
                      bool notHasStories = index == 0;
                      bool isLive = index == 2;
                      const name = 'Samsung mobile Texh';
                      const imgUrl = AppImages.story;

                      return StaggeredListHorizontal(
                        position: index,
                        child: StoryItem(
                          notHasStories: notHasStories,
                          imgUrl: imgUrl,
                          name: name,
                          isCurrentUser: isCurrentUser,
                          isLive: isLive,
                        ),
                      );
                    },
                  ),
                ),
                Positioned(
                  bottom: 26.5.h,
                  child: ArrowButton(
                    onTap: () {
                      _storyScrollController.animateTo(
                          _storyScrollController.position.maxScrollExtent,
                          duration: const Duration(seconds: 1),
                          curve: Curves.easeIn);
                    },
                  ),
                )
              ],
            ),
          ),
          //feature ads
          ProductHorizontalView(
            buttonText: 'See all Feature Ads',
            // title: 'Featured Ads',
            products: List.generate(3, (index) => ProductModel()),
          ),

          Padding(
            padding: EdgeInsets.only(left: 16.0.w),
            child: Text(
              'Categories',
              style: AppTextStyle.mediumPrimary20
                  .copyWith(color: AppColors.blue)
                  .responsive,
            ),
          ),
          8.vertical,
          AnimationLimiter(
            child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 3,
              mainAxisSpacing: 13.h,
              crossAxisSpacing: 13.w,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.only(left: 15.0.w, right: 15.0.w),
              children: [
                ...List.generate(6, (index) {
                  final imageUrl = AppImages.gpu;
                  final lable = 'Graphic Cards';
                  return StaggeredGrid(
                      columnCount: 3,
                      position: index,
                      child: CategoryItem(
                        imageUrl: imageUrl,
                        lable: lable,
                        onTap: () => CategoryScreen().push(context),
                      ));
                }),
              ],
            ),
          ),
          20.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppButton(
                width: 233.h,
                height: 36.w,
                text: 'See All Categories',
                borderRadius: BorderRadius.circular(5.w),
                onPressed: () => AllCategoriesScreen().push(context),
              ),
            ],
          ),
          22.verticalSpace,

          ProductHorizontalView(
            buttonText: 'See all New Arrival',
            title: 'New Arrival',
            products: List.generate(3, (index) => ProductModel(1)),
            iconPath: AppImages.icArrival,
          ),
          ProductHorizontalView(
            buttonText: 'See all Top Ranking',
            title: 'Top Ranking Products',
            products: List.generate(3, (index) => ProductModel(1)),
            iconPath: AppImages.icTrending,
          ),
          ProductHorizontalView(
            buttonText: 'See all Recommended',
            title: 'Recommended By Tech Mart',
            products: List.generate(3, (index) => ProductModel(1)),
          ),
          ProductHorizontalView(
            buttonText: 'See all Based on your Search',
            title: 'Based on your Search',
            products: List.generate(3, (index) => ProductModel(1)),
          ),
          ProductHorizontalView(
            buttonText: 'See all Followed Stores',
            title: 'Followed Stores',
            products: List.generate(3, (index) => ProductModel(1)),
          ),
          ProductHorizontalView(
            buttonText: 'See all Last Activity',
            title: 'Last Activity',
            products: List.generate(3, (index) => ProductModel(index)),
          ),
          ProductHorizontalView(
            buttonText: 'See all Fashion',
            title: 'Fashion',
            products: List.generate(3, (index) => ProductModel(1)),
          ),
          120.verticalSpace,
        ],
      ),
    );
  }
}
