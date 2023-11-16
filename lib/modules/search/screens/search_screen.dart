import 'dart:math' show pi;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:tech_mart/common/models/product_model.dart';
import 'package:tech_mart/common/models/store_model.dart';
import 'package:tech_mart/common/widgets/custom_app_bar.dart';
import 'package:tech_mart/common/widgets/products_grid_view.dart';
import 'package:tech_mart/common/widgets/search_text_field.dart';
import 'package:tech_mart/common/widgets/staggered_list_horizontal.dart';
import 'package:tech_mart/common/widgets/stores_grid_view.dart';
import 'package:tech_mart/utils/app_colors.dart';
import 'package:tech_mart/utils/app_images.dart';
import 'package:tech_mart/utils/app_textstyle.dart';
import 'package:tech_mart/utils/extentions.dart';
import 'package:tech_mart/utils/globals.dart';
import 'package:tech_mart/utils/triangle_painter.dart';

import '../../../common/widgets/blue_black_shader.dart';
import '../../../common/widgets/product_horizontal_view.dart';
import '../../../common/widgets/products_vertical_view.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool isSearching = false;
  bool showProductsView = false;
  bool showStoresView = false;
  bool isGridView = true;
  bool isSorting = false;
  final TextEditingController searchC = TextEditingController();
  @override
  void dispose() {
    isSearching = false;
    isSorting = false;

    if (overlayEntry != null) {
      overlayEntry?.remove();
      overlayEntry = null;
    }
    searchC.dispose();
    super.dispose();
  }

  OverlayEntry? overlayEntry;

  OverlayEntry _createOverlayEntry(BuildContext context) {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;
    var offset = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
        builder: (context) => Positioned(
              top: offset.dy + size.height + 5.0.h,
              right: offset.dx / 10.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: 375.w,
                        alignment: Alignment.center,
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                isSearching = false;
                                isSorting = false;
                              });
                              overlayEntry?.remove();
                              overlayEntry = null;
                            },
                            child: Container(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 5.0.w),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20.w),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    20.verticalSpace,
                                    Padding(
                                      padding: EdgeInsets.only(left: 8.0.w),
                                      child: BlueBlackShaderMask(
                                        child: Text(
                                          'SORT BY',
                                          maxLines: 1,
                                          style: AppTextStyle
                                              .mediumBlack14.responsive,
                                        ),
                                      ),
                                    ),
                                    Divider(
                                      color: AppColors.shadowColor
                                          .withOpacity(0.2),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 4.h, horizontal: 10.w),
                                      child: BlueBlackShaderMask(
                                          child: Text(
                                        'Most Recent',
                                        style: AppTextStyle
                                            .regularBlack12.responsive,
                                      )),
                                    ),
                                    Divider(
                                      color: AppColors.shadowColor
                                          .withOpacity(0.1),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 4.h, horizontal: 10.w),
                                      child: BlueBlackShaderMask(
                                          child: Text(
                                        'Price - Lowest to Highest',
                                        style: AppTextStyle
                                            .regularBlack12.responsive,
                                      )),
                                    ),
                                    Divider(
                                      color: AppColors.shadowColor
                                          .withOpacity(0.1),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 4.h, horizontal: 10.w),
                                      child: BlueBlackShaderMask(
                                          child: Text(
                                        'Price - Highest to Lowest',
                                        style: AppTextStyle
                                            .regularBlack12.responsive,
                                      )),
                                    ),
                                    10.verticalSpace,
                                  ],
                                )),
                          ),
                        ),
                      ),
                      Positioned(
                          top: -2,
                          right: 50.w,
                          child: BlueBlackShaderMask(
                            child: Transform.rotate(
                              angle: pi,
                              child: CustomPaint(
                                  painter: TrianglePainter(
                                      paintingStyle: PaintingStyle.fill,
                                      strokeColor: AppColors.blue),
                                  child: Container(
                                    height: 23.h,
                                    width: 21.w,
                                  )),
                            ),
                          ))
                    ],
                  ),
                ],
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
          title:
              'Search${showProductsView ? ' Products' : showStoresView ? ' Stores' : ''}'),
      body: ValueListenableBuilder(
          valueListenable: searchC,
          builder: (context, value, _) {
            return Stack(
              children: [
                value.text.length > 4
                    ? Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 20.0.h, horizontal: 55.0.w),
                        child: Column(
                          children: [
                            100.verticalSpace,
                            Image.asset(
                              AppImages.confusedRobot,
                              height: 230.h,
                              width: 230.w,
                            ),
                            Text(
                              'No Product Found For Your Search',
                              style: AppTextStyle.mediumBlack14,
                            ),
                            16.verticalSpace,
                            Divider(
                              color: AppColors.shadowColor.withOpacity(0.2),
                            ),
                            10.verticalSpace,
                            TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                    visualDensity: VisualDensity(
                                        horizontal: -4, vertical: -4)),
                                child: Text(
                                  'Search usernames for: \'${value.text}\'',
                                  style: AppTextStyle.mediumBlack14.responsive
                                      .copyWith(
                                    color: AppColors.lightBlue,
                                  ),
                                ))
                          ],
                        ),
                      )
                    : AnimationLimiter(
                        child: ListView(
                          padding: EdgeInsets.symmetric(
                              vertical: 20.0.h,
                              horizontal:
                                  (showProductsView || showStoresView) &&
                                          searchC.text.isNotEmpty
                                      ? 16.0.w
                                      : 0),
                          shrinkWrap: true,
                          children: [
                            55.verticalSpace,
                            //search field
                            20.verticalSpace,
                            //image gallery
                            if (!showProductsView && !showStoresView)
                              StaggeredListHorizontal(
                                verticalOffset: 50,
                                horizontalOffset: 0,
                                position: 0,
                                child: GridView.count(
                                  crossAxisCount: 3,
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  children: [
                                    ...List.generate(
                                      15,
                                      (index) => Image.asset(
                                        AppImages.buggati,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            //searchHistory
                            searchHistorySection(),
                            if ((showProductsView || showStoresView) &&
                                searchC.text.isNotEmpty) ...[
                              // results
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      if (showProductsView)
                                        Text(
                                          'Mobile Results 594',
                                          maxLines: 1,
                                          style: AppTextStyle
                                              .mediumPrimary18.responsive
                                              .copyWith(color: AppColors.blue),
                                        ),
                                      if (showStoresView)
                                        Text(
                                          'Mobile... Store Results 351',
                                          maxLines: 1,
                                          style: AppTextStyle
                                              .mediumPrimary18.responsive
                                              .copyWith(color: AppColors.blue),
                                        ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Builder(builder: (context) {
                                        return InkWell(
                                          onTap: () {
                                            setState(() {
                                              isSorting = true;
                                              isSearching = true;
                                            });
                                            overlayEntry =
                                                _createOverlayEntry(context);
                                            Overlay.of(context)
                                                .insert(overlayEntry!);
                                          },
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(8.0.w),
                                            bottomLeft: Radius.circular(8.0.w),
                                          ),
                                          child: Container(
                                            width: 48.w,
                                            height: 37.h,
                                            decoration: BoxDecoration(
                                              gradient: isSorting
                                                  ? AppColors.blueBlackGradient
                                                  : LinearGradient(
                                                      colors: [
                                                          AppColors.secondary
                                                              .withOpacity(0.6),
                                                          AppColors.primary
                                                              .withOpacity(0.5)
                                                        ],
                                                      begin:
                                                          Alignment.topCenter,
                                                      end: Alignment
                                                          .bottomCenter),
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(8.0.w),
                                                bottomLeft:
                                                    Radius.circular(8.0.w),
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            child: Image.asset(
                                              AppImages.icArrowUpDown,
                                              height: 20.h,
                                              width: 20.w,
                                              color: isSorting
                                                  ? Colors.white
                                                  : null,
                                            ),
                                          ),
                                        );
                                      }),
                                      5.horizontalSpace,
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            isGridView = !isGridView;
                                          });
                                        },
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(8.0.w),
                                          bottomRight: Radius.circular(8.0.w),
                                        ),
                                        child: Container(
                                          width: 48.w,
                                          height: 37.h,
                                          decoration: BoxDecoration(
                                            gradient: isGridView
                                                ? LinearGradient(
                                                    colors: [
                                                        AppColors.secondary
                                                            .withOpacity(0.6),
                                                        AppColors.primary
                                                            .withOpacity(0.5)
                                                      ],
                                                    begin: Alignment.topCenter,
                                                    end: Alignment.bottomCenter)
                                                : AppColors.blueBlackGradient,
                                            borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(8.0.w),
                                              bottomRight: Radius.circular(8.0),
                                            ),
                                          ),
                                          alignment: Alignment.center,
                                          child: Image.asset(
                                            AppImages.icWindow,
                                            height: 20.h,
                                            width: 20.w,
                                            color: !isGridView
                                                ? Colors.white
                                                : null,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              if (showProductsView)
                                isGridView
                                    ? ProductGridView(
                                        products: List.generate(
                                            4, (index) => ProductModel()),
                                        buttonText: 'Show More',
                                      )
                                    : Padding(
                                        padding: EdgeInsets.only(top: 20.0.h),
                                        child: ProductsVerticalView(
                                            buttonText: 'Show More',
                                            products: List.generate(
                                                4, (index) => ProductModel()),
                                            padding: EdgeInsets.zero),
                                      ),
                              if (showProductsView) 10.verticalSpace,
                              // result in store if products searching

                              if (showProductsView)
                                Text(
                                  'Results 25 in Stores',
                                  style: AppTextStyle.mediumPrimary18.responsive
                                      .copyWith(color: AppColors.blue),
                                ),

                              StoreGridView(
                                  buttonText: 'Show More',
                                  stores: List.generate(
                                      4, (index) => StoreModel())),
                            ],

                            100.verticalSpace,
                          ],
                        ),
                      ),
                if (isSearching)
                  Positioned.fill(
                      child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isSearching = false;
                        isSorting = false;
                      });
                      FocusScope.of(context).unfocus();

                      if (overlayEntry != null) {
                        overlayEntry?.remove();
                        overlayEntry = null;
                      }
                    },
                    child: Container(
                      color: AppColors.shadowColor.withOpacity(0.3),
                    ),
                  )),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SearchTextField(
                      hintText: showProductsView
                          ? 'Search for products...'
                          : showStoresView
                              ? 'Search for stores...'
                              : 'Search...',
                      controller: searchC,
                      withOverlay: true,
                      onFocusChange: (hasFocus) {
                        if (isSearching != hasFocus) {
                          setState(() {
                            isSearching = hasFocus;
                          });
                        }
                      },
                      onTapProduct: () => setState(() {
                        showProductsView = !showProductsView;
                        showStoresView = false;
                      }),
                      onTapStore: () => setState(() {
                        showStoresView = !showStoresView;
                        showProductsView = false;
                      }),
                      onTapFilter: () {
                        globalScaffoldKey.currentState!.openEndDrawer();
                      },
                      padding: EdgeInsets.only(
                        left: 20.0.w,
                        right: 20.0.w,
                        top: 20.0.h,
                      ),
                    ),
                  ],
                ),
              ],
            );
          }),
    );
  }

  Widget searchHistorySection() {
    final products = List.generate(3, (i) => ProductModel(i));
    final padding = EdgeInsets.only(
      top: 8.h,
      right: 16.w,
      bottom: 26.h,
      left: 16.w,
    );
    final text = searchC.text;
    if (text.isEmpty && (!showProductsView && !showStoresView)) {
      return const SizedBox();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: text.isNotEmpty
          ? [const SizedBox()]
          : [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                child: Text(
                  'Search History',
                  style: AppTextStyle.mediumPrimary18.responsive
                      .copyWith(color: AppColors.blue),
                ),
              ),
              ProductsVerticalView(products: products, padding: padding),
              ProductHorizontalView(
                buttonText: 'See all Featured Ads',
                title: 'Featured Products',
                products: List.generate(3, (index) => ProductModel(index + 1)),
              ),
            ],
    );
  }
}
