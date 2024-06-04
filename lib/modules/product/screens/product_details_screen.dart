import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_reaction_button/flutter_reaction_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:tech_mart/common/widgets/actions_button.dart';
import 'package:tech_mart/common/widgets/app_button.dart';
import 'package:tech_mart/common/widgets/blue_black_shader.dart';
import 'package:tech_mart/common/widgets/custom_app_bar.dart';
import 'package:tech_mart/modules/product/screens/add_product_screen.dart';
import 'package:tech_mart/modules/product/widgets/comments_bottom_sheet.dart';
import 'package:tech_mart/modules/product/widgets/feature_done_dialog.dart';
import 'package:tech_mart/modules/product/widgets/feature_your_products_dialog.dart';
import 'package:tech_mart/modules/product/widgets/shipping_details_dialog.dart';
import 'package:tech_mart/utils/app_colors.dart';
import 'package:tech_mart/utils/app_images.dart';
import 'package:tech_mart/utils/app_textstyle.dart';
import 'package:tech_mart/utils/extentions.dart';
import 'package:tech_mart/utils/helper.dart';

import '../../../common/models/product_model.dart';
import '../../../common/widgets/arrow_button.dart';
import '../../../common/widgets/blue_smooth_shader_mask.dart';
import '../../../common/widgets/product_horizontal_view.dart';
import '../../../common/widgets/staggered_list_horizontal.dart';
import '../../home/widgets/story_item.dart';
import '../widgets/calculate_shipping_dialog.dart';
import '../widgets/drop_down_tile.dart';
import '../widgets/product_review_tile.dart';
import '../widgets/product_stack_button.dart';
import '../widgets/product_top_button.dart';
import '../widgets/products_image_slider.dart';
import '../widgets/rating_progress_bar.dart';
import '../widgets/reactions_bottom_sheet.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen>
    with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  OverlayEntry? _overlayEntry;

  OverlayEntry _createOverlayEntryPhone() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    // final offset = renderBox.localToGlobal(Offset.zero);
    return OverlayEntry(builder: (context) {
      return SafeArea(
        child: Stack(
          children: [
            //fill widget to dismiss overlay
            Positioned.fill(
                child: GestureDetector(
                    onPanDown: (details) {
                      setState(() {
                        isSelected = false;
                      });
                      _overlayEntry?.remove();
                      _overlayEntry = null;
                    },
                    child: Container(
                      color: Colors.transparent,
                      height: size.height,
                      width: size.width,
                    ))),
            Positioned(
                left: 78.w,
                top: 60.h + 65.w,
                width: 155.w,
                child: Material(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10.w),
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        height: 102.h,
                        width: 155.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.w),
                        ),
                        child: Column(
                          children: [
                            Expanded(
                                child: InkWell(
                              onTap: () {
                                setState(() {
                                  isSelected = false;
                                });
                                _overlayEntry?.remove();
                                _overlayEntry = null;
                              },
                              child: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // Expanded(
                                    //   child: Image.asset(
                                    //     AppImages.ic_app_call,
                                    //     height: 24.w,
                                    //     width: 24.w,
                                    //   ),
                                    // ),
                                    // 8.w.verticalSpace,
                                    Text(
                                      'Phone Call',
                                      style: TextStyle(fontSize: 12.h),
                                    )
                                  ],
                                ),
                              ),
                            )),
                            Divider(
                              color: AppColors.shadowColor.withOpacity(0.2),
                            ),
                            Expanded(
                                child: InkWell(
                              onTap: () {
                                setState(() {
                                  isSelected = false;
                                });
                                _overlayEntry?.remove();
                                _overlayEntry = null;
                              },
                              child: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // Expanded(
                                    //   child: Image.asset(
                                    //     AppImages.ic_call,
                                    //     height: 24.w,
                                    //     width: 24.w,
                                    //   ),
                                    // ),
                                    // 8.w.verticalSpace,
                                    Text(
                                      'App Audio Call',
                                      style: TextStyle(fontSize: 12.h),
                                    )
                                  ],
                                ),
                              ),
                            )),
                          ],
                        ),
                      ),
                      Positioned(
                        top: -13.h,
                        child: Image(
                          image: const AssetImage(AppImages.triangle_down),
                          height: 13.h,
                          width: 21.w,
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      );
    });
  }

  OverlayEntry _createOverlayEntryMessage() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    // final offset = renderBox.localToGlobal(Offset.zero);
    return OverlayEntry(builder: (context) {
      return SafeArea(
        child: Stack(
          children: [
            //fill widget to dismiss overlay
            Positioned.fill(
                child: GestureDetector(
                    onPanDown: (details) {
                      setState(() {
                        isSelectedMessage = false;
                      });
                      _overlayEntry?.remove();
                      _overlayEntry = null;
                    },
                    child: Container(
                      color: Colors.transparent,
                      height: size.height,
                      width: size.width,
                    ))),
            Positioned(
                left: 190.w,
                top: 60.h + 65.w,
                width: 155.w,
                child: Material(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10.w),
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        height: 102.h,
                        width: 155.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.w),
                        ),
                        child: Column(
                          children: [
                            Expanded(
                                child: InkWell(
                              onTap: () {
                                setState(() {
                                  isSelectedMessage = false;
                                });
                                _overlayEntry?.remove();
                                _overlayEntry = null;
                              },
                              child: SizedBox(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // Expanded(
                                    //   child: Image.asset(
                                    //     AppImages.ic_sms,
                                    //     height: 24.w,
                                    //     width: 24.w,
                                    //   ),
                                    // ),
                                    // 8.w.verticalSpace,
                                    Text(
                                      'Phone Messages',
                                      style: TextStyle(fontSize: 12.h),
                                    )
                                  ],
                                ),
                              ),
                            )),
                            Divider(
                              color: AppColors.shadowColor.withOpacity(0.2),
                            ),
                            Expanded(
                                child: InkWell(
                              onTap: () {
                                setState(() {
                                  isSelectedMessage = false;
                                });
                                _overlayEntry?.remove();
                                _overlayEntry = null;
                              },
                              child: SizedBox(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // Expanded(
                                    //   child: Image.asset(
                                    //     AppImages.ic_sms,
                                    //     height: 24.w,
                                    //     width: 24.w,
                                    //   ),
                                    // ),
                                    // 8.w.verticalSpace,
                                    Text(
                                      'In App Inbox',
                                      style: TextStyle(fontSize: 12.h),
                                    )
                                  ],
                                ),
                              ),
                            )),
                          ],
                        ),
                      ),
                      Positioned(
                        top: -13.h,
                        child: Image(
                          image: const AssetImage(AppImages.triangle_down),
                          height: 13.h,
                          width: 21.w,
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      );
    });
  }

  bool isSelected = false;
  bool isSelectedMessage = false;
  bool readMore = false;
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
    final commonHorizontalPadding = EdgeInsets.symmetric(horizontal: 25.0.w);
    return Scaffold(
      key: _scaffoldKey,
      appBar: customAppBar(title: 'Apple iPhone 14 Pro', actions: actions),
      body: Stack(
        children: [
          AnimationLimiter(
            child: ListView(
              padding: EdgeInsets.symmetric(vertical: 18.0.h),
              children: [
                StaggeredListHorizontal(
                    position: 0,
                    verticalOffset: 10,
                    child: buildTopButtons(commonHorizontalPadding)),
                18.verticalSpace,
                StaggeredListHorizontal(
                  position: 1,
                  verticalOffset: 10,
                  child: ProductsImageSlider(
                    initialWidget: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                          AppImages.buggati,
                          fit: BoxFit.cover,
                        ),
                        Container(
                          height: 200.h,
                          width: 200.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.black.withOpacity(0.2)),
                          child: Icon(
                            Icons.play_arrow,
                            color: AppColors.white,
                            size: 100.w,
                          ),
                        ),
                      ],
                    ),
                    margin: commonHorizontalPadding,
                    height: 400.h,
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 44),
                    sliderList: [
                      ...List.generate(11, (index) => AppImages.buggati),
                    ],
                  ),
                ),
                18.verticalSpace,
                StaggeredListHorizontal(
                    horizontalOffset: -50,
                    verticalOffset: -10,
                    position: 2,
                    child: buildReactionSection()),
                18.verticalSpace,
                StaggeredListHorizontal(
                    verticalOffset: 20,
                    position: 3,
                    child: buildTitleSection()),
                StaggeredListHorizontal(
                    verticalOffset: 30,
                    horizontalOffset: 0,
                    position: 3,
                    child: buildVariationsSection()),
                StaggeredListHorizontal(position: 4, child: buildMainButtons()),
                18.verticalSpace,
                StaggeredListHorizontal(
                    horizontalOffset: -50,
                    position: 5,
                    child: buildAboutSection()),
                18.verticalSpace,
                StaggeredListHorizontal(
                    position: 6,
                    child:
                        buildShoppingAndReturnSection(commonHorizontalPadding)),
                18.verticalSpace,
                StaggeredListHorizontal(
                    horizontalOffset: -50,
                    position: 7,
                    child: buildAboutThisSeller()),
                18.verticalSpace,
                StaggeredListHorizontal(
                    position: 8, child: buildReviewsSection()),
                6.verticalSpace,
                ProductHorizontalView(
                  buttonText: 'See all Featured Products',
                  title: 'Featured Products',
                  products: List.generate(3, (index) => ProductModel()),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Live Feeds',
                                style: AppTextStyle.mediumBlack18.responsive
                                    .copyWith(color: AppColors.blue),
                              ),
                            ],
                          ),
                          ArrowButton(
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                    //Live Feed
                    SizedBox(
                      height: 102.h,
                      child: AnimationLimiter(
                        child: ListView.separated(
                          itemCount: 12,
                          padding: EdgeInsets.only(
                            left: 16.0.w,
                            right: 16.0.w,
                          ),
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (context, index) =>
                              10.horizontalSpace,
                          itemBuilder: (context, index) {
                            bool isCurrentUser = false;
                            bool notHasStories = false;
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
                    ),
                  ],
                ),
                10.verticalSpace,
                ProductHorizontalView(
                  buttonText: 'See all Recommended',
                  title: 'Recommended By Tech Mart',
                  products: List.generate(3, (index) => ProductModel(1)),
                ),
              ],
            ),
          ),
          Positioned(
            top: 90.h,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ProductStackButton(
                  assetPath: AppImages.ic_white_crown,
                  onTap: () {
                    showDialog(
                            context: context,
                            builder: (context) => FeatureYourProductsDialog())
                        .then((value) => showDialog(
                            context: context,
                            builder: (context) => FeatureDoneDialog()));
                  },
                ),
                10.verticalSpace,
                ProductStackButton(
                  assetPath: AppImages.ic_edit,
                  onTap: () {
                    AddProductScreen().push(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container buildReviewsSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25.0.w, vertical: 16.0.h),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BlueSmoothShaderMask(
                child: Text(
                  'Reviews',
                  style: AppTextStyle.mediumBlack18.responsive,
                ),
              ),
              6.horizontalSpace,
              Text(
                '(860 Review)',
                style: AppTextStyle.mediumBlack14.responsive,
              )
            ],
          ),
          20.verticalSpace,
          Row(
            children: [
              //ratings legend
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      BlueSmoothShaderMask(
                        child: Text(
                          '4.8',
                          style: AppTextStyle.mediumBlack24
                              .copyWith(fontSize: 26)
                              .responsive,
                        ),
                      ),
                      4.horizontalSpace,
                      Padding(
                        padding: EdgeInsets.only(bottom: 6.0.h),
                        child: Icon(
                          Icons.star_rounded,
                          size: 14.w,
                          color: AppColors.primary,
                        ),
                      )
                    ],
                  ),
                  Text(
                    'Ratings',
                    style: AppTextStyle.mediumGrey14.responsive,
                  )
                ],
              ),
              30.horizontalSpace,
              //chart
              const Expanded(
                child: SizedBox(
                    height: 87,
                    child: Column(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              RatingProgressBar(
                                title: '5',
                                currentValue: 80,
                              ),
                              RatingProgressBar(
                                title: '4',
                                currentValue: 50,
                              ),
                              RatingProgressBar(
                                title: '3',
                                currentValue: 20,
                              ),
                              RatingProgressBar(
                                title: '2',
                                currentValue: 30,
                              ),
                              RatingProgressBar(
                                title: '1',
                                currentValue: 10,
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
              )
            ],
          ),
          40.verticalSpace,
          Builder(builder: (context) {
            const name = 'Al Nadir';
            const double rating = 4.5;
            const review =
                'Just as i expected. Reliable comfort, and still cool. I was very impressed by the quality, all seams and overlays are stitched nicely.';
            const date = 'February 23, 2023';
            final padding = EdgeInsets.only(bottom: 26.h);

            return ProductReviewTile(
                padding: padding,
                name: name,
                rating: rating,
                review: review,
                date: date);
          }),
          Builder(builder: (context) {
            const name = 'Emon';
            const double rating = 3.7;
            const review =
                'Just as i expected. Reliable comfort, and still cool. I was very impressed by the quality, all seams and overlays are stitched nicely.';
            const date = 'February 23, 2023';
            final padding = EdgeInsets.only(bottom: 26);

            return ProductReviewTile(
                padding: padding,
                name: name,
                rating: rating,
                review: review,
                date: date);
          }),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      visualDensity: const VisualDensity(vertical: -4)),
                  child: Text(
                    'View All',
                    style: const TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 14,
                            color: Colors.black)
                        .responsive,
                  )),
            ],
          )
        ],
      ),
    );
  }

  Container buildAboutThisSeller() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlueSmoothShaderMask(
            child: Text(
              'About this Seller',
              style: AppTextStyle.mediumBlack18.responsive,
            ),
          ),
          10.verticalSpace,
          Row(
            children: [
              Container(
                height: 70.h,
                width: 70.w,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(
                        AppImages.buggati,
                      ),
                      fit: BoxFit.cover,
                    )),
              ),
              16.horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BlueSmoothShaderMask(
                    child: Text(
                      'Apple',
                      style: AppTextStyle.mediumBlack14.responsive,
                    ),
                  ),
                  4.verticalSpace,
                  BlueSmoothShaderMask(
                    child: Text(
                      '98% positive feedback',
                      style: AppTextStyle.mediumBlack14.responsive,
                    ),
                  ),
                  4.verticalSpace,
                  Container(
                    height: 24.h,
                    width: 97.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: AppColors.lightBlue),
                    child: Text(
                      'Follow',
                      style: AppTextStyle.mediumWhite14.responsive,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  Image.asset(
                    AppImages.arrow_forward,
                    height: 28.h,
                    width: 16.w,
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Container buildShoppingAndReturnSection(EdgeInsets commonHorizontalPadding) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0.h),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: commonHorizontalPadding,
            child: BlueSmoothShaderMask(
              child: Text(
                'Shipping&Return',
                style: AppTextStyle.mediumBlack18.responsive,
              ),
            ),
          ),
          35.verticalSpace,
          Padding(
            padding: commonHorizontalPadding,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: BlueSmoothShaderMask(
                        child: Text(
                  'Est Delivery',
                  style: AppTextStyle.mediumBlack14.responsive,
                ))),
                Expanded(
                  flex: 2,
                  child: BlueSmoothShaderMask(
                    child: Text(
                      'Delivery options and fees may vary based on your location',
                      style: AppTextStyle.regularBlack14.responsive,
                    ),
                  ),
                )
              ],
            ),
          ),
          35.verticalSpace,
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return CalculateShippingDialog();
                    }).then((value) => showDialog(
                    context: context,
                    builder: (context) {
                      return ShippingDetailsDialog();
                    }));
              },
              child: Container(
                height: 75.h,
                padding: commonHorizontalPadding,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.secondary.withOpacity(0.2),
                      AppColors.primary.withOpacity(0.2),
                    ],
                  ),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BlueSmoothShaderMask(
                        child: Text(
                          'Calculate Shipping',
                          style: AppTextStyle.mediumBlack18.responsive,
                        ),
                      ),
                      Icon(
                        CupertinoIcons.chevron_forward,
                        size: 24.sp,
                      )
                    ]),
              ),
            ),
          ),
          35.verticalSpace,
          Padding(
            padding: commonHorizontalPadding,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: BlueSmoothShaderMask(
                        child: Text(
                  'Returns',
                  style: AppTextStyle.mediumBlack14.responsive,
                ))),
                Expanded(
                  flex: 2,
                  child: BlueSmoothShaderMask(
                    child: Text(
                      'Refer to Tech Mart Return Policy for more details. You are covered by the Tech Mart Money Back Guarantee if you receive an item that is not as described in the listing.',
                      style: AppTextStyle.regularBlack14.responsive,
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: commonHorizontalPadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        visualDensity: VisualDensity(vertical: -4)),
                    child: Text(
                      'Learn more',
                      style: const TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 14,
                              color: Colors.black)
                          .responsive,
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }

  Container buildAboutSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25.0.w, vertical: 10.0.h),
      color: Colors.white,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        BlueSmoothShaderMask(
            child: Text(
          'About this item',
          style: AppTextStyle.mediumBlack18.responsive,
        )),
        20.verticalSpace,
        Row(
          children: [
            Expanded(
              child: Text('Condition',
                  style: AppTextStyle.mediumGrey14.responsive
                      .copyWith(color: AppColors.lightGrey)),
            ),
            Expanded(
              flex: 2,
              child: BlueSmoothShaderMask(
                  child: Text(
                'New - Refurbished',
                style: AppTextStyle.mediumBlack14.responsive,
              )),
            ),
          ],
        ),
        12.verticalSpace,
        Row(
          children: [
            Expanded(
              child: Text('Brand',
                  style: AppTextStyle.mediumGrey14.responsive
                      .copyWith(color: AppColors.lightGrey)),
            ),
            Expanded(
              flex: 2,
              child: BlueSmoothShaderMask(
                  child: Text(
                'Apple',
                style: AppTextStyle.mediumBlack14.responsive,
              )),
            ),
          ],
        ),
        24.verticalSpace,
        Divider(
          height: 2,
          color: AppColors.grey.withOpacity(0.7),
        ),
        24.verticalSpace,
        BlueSmoothShaderMask(
            child: Text(
          'Description',
          style: AppTextStyle.mediumBlack18.responsive,
        )),
        8.verticalSpace,
        Builder(builder: (context) {
          const text =
              'Lorem ipsum dolor sit amet consectetur adipiscing elit Ut et massa mi. Aliquam in hendrerit urna. Pellentesque sit amet sapien fringilla, mattis ligula consectetur, ultrices mauris. ';
          return BlueSmoothShaderMask(
            child: Text(
              readMore
                  ? text
                  : '${text.substring(0, text.length > 150 ? 150 : text.length)}...',
              style: AppTextStyle.regularBlack14.responsive,
            ),
          );
        }),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  setState(() {
                    readMore = !readMore;
                  });
                },
                style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    visualDensity: const VisualDensity(vertical: -4)),
                child: Text(
                  readMore ? 'Read less' : 'Read more',
                  style: const TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 14,
                          color: Colors.black)
                      .responsive,
                ))
          ],
        )
      ]),
    );
  }

  Column buildMainButtons() {
    return Column(
      children: [
        AppButton(
          height: 60.h,
          width: 344.h,
          onPressed: () {},
          faded: false,
          text: 'Buy It Now',
          style: AppTextStyle.mediumBlack18,
        ),
        10.verticalSpace,
        AppButton(
          inversed: true,
          height: 60.h,
          width: 344.h,
          onPressed: () {},
          faded: false,
          text: 'Add to Cart',
          style: AppTextStyle.mediumBlack18,
        ),
        10.verticalSpace,
        AppButton(
          inversed: true,
          height: 60.h,
          width: 344.h,
          onPressed: () {},
          faded: false,
          text: 'Add to Wishlist',
          style: AppTextStyle.mediumBlack18,
        ),
      ],
    );
  }

  Container buildVariationsSection() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 25.0.w,
        vertical: 20.h,
      ),
      child: Column(
        children: [
          DropDownTile(
            lable: 'Storage',
            items: ['16 gb', '32 gb', '64 gb']
                .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(
                        e,
                        style: TextStyle(
                                fontSize: 14,
                                color: AppColors.blueGrey.withOpacity(0.4))
                            .responsive,
                      ),
                    ))
                .toList(),
            hintText: 'Select',
            onChanges: (p0) {},
          ),
          15.verticalSpace,
          DropDownTile(
            lable: 'Color',
            items: ['16 gb', '32 gb', '64 gb']
                .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(
                        e,
                        style: TextStyle(
                                fontSize: 14,
                                color: AppColors.blueGrey.withOpacity(0.4))
                            .responsive,
                      ),
                    ))
                .toList(),
            hintText: 'Select',
            onChanges: (p0) {},
          ),
          15.verticalSpace,
          DropDownTile(
            lable: 'Quantity',
            items: ['1', '2', '3']
                .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(
                        e,
                        style: TextStyle(
                                fontSize: 14,
                                color: AppColors.blueGrey.withOpacity(0.4))
                            .responsive,
                      ),
                    ))
                .toList(),
            hintText: 'Select',
            onChanges: (p0) {},
          ),
        ],
      ),
    );
  }

  Container buildTitleSection() {
    return Container(
      padding: EdgeInsets.fromLTRB(25.0.w, 8.0.h, 25.0.w, 12.0.h),
      color: Colors.white,
      child: Column(children: [
        BlueSmoothShaderMask(
            child: Text(
          'Lorem ipsum dolor sit amet consectetur adipiscing elit Ut.',
          style: AppTextStyle.mediumBlack18.responsive,
        )),
        12.verticalSpace,
        Row(
          children: [
            const Icon(
              Icons.star_rounded,
              color: AppColors.primary,
            ),
            10.horizontalSpace,
            Text(
              '4.9',
              style: AppTextStyle.regularBlack14.responsive,
            ),
            5.horizontalSpace,
            Text(
              '(840 Reviews)',
              style: AppTextStyle.regularGrey14.responsive,
            ),
          ],
        ),
        25.verticalSpace,
        Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 4.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: AppColors.lightBlack),
              child: Text(
                'Negotiable',
                style: AppTextStyle.mediumWhite12.responsive,
              ),
            ),
            15.horizontalSpace,
            BlueSmoothShaderMask(
                child: Text(
              '1,530 USD',
              style: AppTextStyle.mediumBlack20.responsive,
            )),
            20.horizontalSpace,
            const Icon(Icons.more_horiz),
          ],
        ),
      ]),
    );
  }

  Reaction<int>? selectedReaction;

  Container buildReactionSection() {
    Reaction<int> placeHolder = Reaction<int>(
        value: 99,
        icon: Image.asset(
          AppImages.ic_heart_outline,
          height: 20.h,
          width: 20.w,
        ));
    return Container(
      height: 90.h,
      padding: EdgeInsets.fromLTRB(20.w, 8.h, 5.w, 8.h),
      color: Colors.white,
      child: Row(children: [
        Expanded(
            flex: 9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //reaction buttons
                Row(
                  children: [
                    Container(
                      height: 22.h,
                      width: 22.w,
                      margin: EdgeInsets.all(5.0.w),
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: ReactionButton<int>(
                          selectedReaction: selectedReaction,
                          placeholder: placeHolder,
                          itemScale: 0.9,
                          itemSize: Size(45.w, 45.h),
                          onReactionChanged: (Reaction<int>? value) {
                            setState(() {
                              selectedReaction = value;
                            });
                            Helper.playReactionSound();
                          },
                          reactions: [
                            Reaction<int>(
                                value: 0,
                                icon: Image.asset(
                                  AppImages.reaction_like,
                                  height: 45.h,
                                  width: 45.w,
                                )),
                            Reaction<int>(
                                value: 1,
                                icon: Image.asset(
                                  AppImages.reaction_heart,
                                  height: 45.h,
                                  width: 45.w,
                                )),
                            Reaction<int>(
                                value: 2,
                                icon: Image.asset(
                                  AppImages.reaction_care,
                                  height: 45.h,
                                  width: 45.w,
                                )),
                            Reaction<int>(
                                value: 3,
                                icon: Image.asset(
                                  AppImages.reaction_laugh,
                                  height: 45.h,
                                  width: 45.w,
                                )),
                            Reaction<int>(
                                value: 4,
                                icon: Image.asset(
                                  AppImages.reaction_wow,
                                  height: 45.h,
                                  width: 45.w,
                                )),
                            Reaction<int>(
                                value: 5,
                                icon: Image.asset(
                                  AppImages.reaction_sad,
                                  height: 45.h,
                                  width: 45.w,
                                )),
                            Reaction<int>(
                                value: 6,
                                icon: Image.asset(
                                  AppImages.reaction_angry,
                                  height: 45.h,
                                  width: 45.w,
                                )),
                          ],
                          // child: Container(
                          //   padding: const EdgeInsets.all(5.0),
                          //   child: Image.asset(
                          //     AppImages.ic_heart_outline,
                          //     height: 17.h,
                          //     width: 18.w,
                          //   ),
                          // ),
                        ),
                      ),
                    ),
                    if (selectedReaction != null) ...[
                      8.horizontalSpace,
                      Text(
                        selectedReaction!.convertToText.text,
                        style: selectedReaction!.convertToText.style,
                      ),
                    ],
                    8.horizontalSpace,
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                            backgroundColor: Colors.transparent,
                            context: context,
                            isScrollControlled: true,
                            builder: (context) {
                              return CommentsBottomSheet();
                            });
                      },
                      child: Container(
                        padding: EdgeInsets.all(5.0.w),
                        child: Image.asset(
                          AppImages.ic_comment,
                          height: 22.h,
                          width: 22.w,
                        ),
                      ),
                    ),
                    8.horizontalSpace,
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.all(5.0.w),
                        child: Image.asset(
                          AppImages.ic_share,
                          height: 22.h,
                          width: 22.w,
                        ),
                      ),
                    ),
                  ],
                )
                //likes infor
                ,
                Builder(builder: (context) {
                  return InkWell(
                    onTap: () {
                      showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          context: context,
                          isScrollControlled: true,
                          builder: (context) {
                            return ReactionsBottomSheet();
                          });
                    },
                    child: Row(
                      children: [
                        //reactions image stack
                        Stack(
                          children: [
                            SizedBox(
                              width: 50.w,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Image.asset(
                                    AppImages.reaction_wow,
                                    height: 18.w,
                                    width: 18.w,
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              right: 15.w,
                              child: Image.asset(
                                AppImages.reaction_heart,
                                height: 18.w,
                                width: 18.w,
                              ),
                            ),
                            Positioned(
                              right: 30.w,
                              child: Image.asset(
                                AppImages.reaction_like,
                                height: 18.w,
                                width: 18.w,
                              ),
                            ),
                          ],
                        ),
                        5.horizontalSpace,

                        Text(
                          '21,707 likes',
                          style: AppTextStyle.regularBlack14.responsive,
                        ),
                        5.horizontalSpace,
                        Container(
                          height: 12.h,
                          width: 1,
                          color: AppColors.grey,
                        ),
                        5.horizontalSpace,
                        Text(
                          '21,707 views',
                          style: AppTextStyle.regularBlack14.responsive,
                        ),
                      ],
                    ),
                  );
                }),
              ],
            )),
        Expanded(
          flex: 5,
          child: Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              Row(
                children: [
                  Container(
                    width: 90.w,
                    height: 43.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.w),
                        gradient: AppColors.goldenGradient),
                    padding: EdgeInsets.only(right: 10.w),
                    alignment: Alignment.center,
                    child: BlueBlackShaderMask(
                        child: Text(
                      'Visit Store',
                      style: AppTextStyle.mediumBlack14.responsive,
                    )),
                  ),
                ],
              ),
              Positioned(
                right: 10.w,
                child: Container(
                  height: 60.w,
                  width: 60.w,
                  decoration: const BoxDecoration(
                      gradient: AppColors.goldenGradient,
                      shape: BoxShape.circle),
                  alignment: Alignment.center,
                  child: Container(
                    height: 50.w,
                    width: 50.w,
                    decoration: const BoxDecoration(
                        color: AppColors.lightBlack, shape: BoxShape.circle),
                    alignment: Alignment.center,
                    child: Image(
                      image: const AssetImage(AppImages.ic_store),
                      height: 25.h,
                      width: 34.w,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }

  Padding buildTopButtons(EdgeInsets commonHorizontalPadding) {
    return Padding(
      padding: commonHorizontalPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProductTopButton(
                    onTap: () {},
                    assetImage: AppImages.ic_video_call,
                  ),
                  ProductTopButton(
                    assetImage: AppImages.ic_email,
                  ),
                  ProductTopButton(
                    isSelected: isSelected,
                    onTap: () {
                      setState(() {
                        isSelected = !isSelected;
                      });
                      if (isSelected) {
                        _overlayEntry = _createOverlayEntryPhone();
                        Overlay.of(context).insert(_overlayEntry!);
                      } else {
                        _overlayEntry?.remove();
                        _overlayEntry = null;
                      }
                    },
                    assetImage: AppImages.ic_audio_call,
                  ),
                  ProductTopButton(
                    onTap: () {},
                    assetImage: AppImages.ic_whatsapp,
                  ),
                  ProductTopButton(
                    isSelected: isSelectedMessage,
                    onTap: () {
                      setState(() {
                        isSelectedMessage = !isSelectedMessage;
                      });
                      if (isSelectedMessage) {
                        _overlayEntry = _createOverlayEntryMessage();
                        Overlay.of(context).insert(_overlayEntry!);
                      } else {
                        _overlayEntry?.remove();
                        _overlayEntry = null;
                      }
                    },
                    assetImage: AppImages.ic_sms,
                  ),
                ]),
          ),
          45.w.horizontalSpace,
          ProductTopButton(
            width: 76.w,
            assetImage: AppImages.ic_gift,
          ),
        ],
      ),
    );
  }
}
