import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_mart/common/models/reaction_model.dart';
import 'package:tech_mart/modules/product/screens/product_details_screen.dart';
import 'package:tech_mart/utils/extentions.dart';
import 'package:tech_mart/utils/helper.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../../utils/app_textstyle.dart';
import 'blue_black_shader.dart';
import 'reaction_item.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({
    super.key,
    required this.imageUrl,
    required this.imageCount,
    required this.videoCount,
    required this.title,
    required this.price,
    required this.rating,
    required this.isFeatured,
    this.onTap,
    this.onTapBag,
    this.onReactionTap,
  });

  final String imageUrl;
  final String imageCount;
  final String videoCount;
  final String title;
  final String price;
  final String rating;
  final bool isFeatured;
  final VoidCallback? onTap;
  final VoidCallback? onTapBag;
  final void Function(int)? onReactionTap;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  bool showReactions = false;
  _reactionTapped(int value) {
    if (widget.onReactionTap != null) {
      widget.onReactionTap!(value);
    }
    setState(() {
      showReactions = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.only(
      topLeft: Radius.circular(16.0.w),
      topRight: Radius.circular(16.0.w),
      bottomLeft: Radius.circular(16.0.w),
      bottomRight: Radius.circular(!widget.isFeatured ? 16.0.w : 0.0),
    );
    return Align(
      alignment: Alignment.center,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Material(
            color: Colors.white24,
            borderRadius: borderRadius,
            child: InkWell(
              borderRadius: borderRadius,
              onTapDown: (_) {
                setState(() {
                  showReactions = false;
                });
              },
              onTap: widget.onTap ??
                  () {
                    const ProductDetailsScreen().push(context);
                  },
              child: Container(
                padding: EdgeInsets.all(5.0.w),
                width: 184.w,
                height: 239.h,
                decoration: BoxDecoration(
                  borderRadius: borderRadius,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.shadowColor.withOpacity(0.2),
                        offset: Offset(2.w, 2.h),
                        spreadRadius: 0,
                        blurRadius: 3.0.w)
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //image
                    Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 130.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0.w),
                              image: DecorationImage(
                                  image: AssetImage(widget.imageUrl),
                                  fit: BoxFit.cover)),
                        ),

                        // image and video count
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 2.h),
                          decoration: BoxDecoration(
                              color: AppColors.shadowColor.withOpacity(0.3),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(16.0.w),
                                  topRight: Radius.circular(16.0.w))),
                          child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.camera,
                                      size: 8.w,
                                      color: AppColors.grey,
                                    ),
                                    4.horizontal,
                                    Text(
                                      widget.imageCount,
                                      style:
                                          AppTextStyle.regularWhite8.responsive,
                                    ),
                                  ],
                                ),
                                10.horizontal,
                                Row(
                                  children: [
                                    Icon(
                                      Icons.videocam,
                                      size: 8.w,
                                      color: AppColors.grey,
                                    ),
                                    4.horizontal,
                                    Text(
                                      widget.videoCount,
                                      style:
                                          AppTextStyle.regularWhite8.responsive,
                                    ),
                                  ],
                                ),
                              ]),
                        ),
                        //heart icon
                        Positioned(
                            top: 0,
                            right: 0,
                            child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                        offset: const Offset(0, 0),
                                        color: AppColors.shadowColor
                                            .withOpacity(0.1),
                                        spreadRadius: 1.0,
                                        blurRadius: 2.0)
                                  ]),
                              child: IconButton(
                                padding: const EdgeInsets.all(0.0),
                                visualDensity: const VisualDensity(
                                    horizontal: -1, vertical: -4),
                                onPressed: () {
                                  setState(() {
                                    showReactions = true;
                                  });
                                },
                                icon: Icon(
                                  Icons.favorite_rounded,
                                  size: 24.w,
                                  color: Colors.white,
                                ),
                              ),
                            ))
                      ],
                    ),
                    //Title
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              BlueBlackShaderMask(
                                child: Text(
                                  widget.title,
                                  // colors: AppColors.blueBlackGradient.colors,
                                  // gradientDirection: GradientDirection.ttb,
                                  maxLines: 2,
                                  style: AppTextStyle.regularBlack14.responsive,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                        34.horizontalSpace,
                      ],
                    ),
                    //price
                    Text(
                      widget.price,
                      maxLines: 1,
                      style: AppTextStyle.regularBlack14
                          .copyWith(color: AppColors.orange)
                          .responsive,
                      overflow: TextOverflow.ellipsis,
                    ),
                    //rating
                    Row(
                      children: [
                        Icon(
                          Icons.star_rounded,
                          color: AppColors.primary,
                          size: 20.w,
                        ),
                        4.horizontalSpace,
                        Text(
                          widget.rating,
                          style: AppTextStyle.regularBlack14.responsive,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          // shop button and featured tag
          if (widget.isFeatured)
            Container(
              height: 22.h,
              width: 79.w,
              decoration: const BoxDecoration(
                gradient: AppColors.goldenGradient,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                ),
              ),
              alignment: Alignment.center,
              child: BlueBlackShaderMask(
                child: Text(
                  'Featured',
                  // gradientDirection: GradientDirection.ttb,
                  // colors: AppColors.blueBlackGradient.colors,
                  style: AppTextStyle.mediumBlack12.responsive,
                ),
              ),
            ),
          // shopping bag
          Positioned(
            bottom: 10.h + (widget.isFeatured ? 22.h : 0),
            right: 10.w,
            child: Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(500.0),
              child: InkWell(
                borderRadius: BorderRadius.circular(500.0),
                onTap: widget.onTapBag ?? () {},
                child: Container(
                  height: 34.w,
                  width: 34.w,
                  decoration: const BoxDecoration(
                      color: AppColors.bgColor, shape: BoxShape.circle),
                  alignment: Alignment.center,
                  child: Image.asset(
                    AppImages.icBag,
                    height: 20.w,
                    width: 20.w,
                  ),
                ),
              ),
            ),
          ),

          //reaction pop up
          if (showReactions)
            FutureBuilder<bool>(
                future: Future.delayed(
                    const Duration(milliseconds: 50), () => true),
                builder: (context, snapshot) {
                  final completedFuture = snapshot.data ?? false;
                  return Positioned(
                    top: 0,
                    right: 0,
                    child: AnimatedOpacity(
                      opacity: (showReactions && completedFuture) ? 1 : 0,
                      duration: const Duration(
                        milliseconds: 200,
                      ),
                      child: Container(
                        height: 208.h,
                        width: 120.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16.w),
                          boxShadow: [
                            BoxShadow(
                                color: AppColors.shadowColor.withOpacity(0.2),
                                offset: Offset(2.w, 2.h),
                                spreadRadius: 0,
                                blurRadius: 3.0.w)
                          ],
                        ),
                        alignment: Alignment.center,
                        child: Wrap(
                            spacing: 16.w,
                            runSpacing: 9.h,
                            alignment: WrapAlignment.center,
                            children: <ReactionModel>[
                              ReactionModel(0, AppImages.reaction_like),
                              ReactionModel(
                                1,
                                AppImages.reaction_heart,
                              ),
                              ReactionModel(
                                2,
                                AppImages.reaction_care,
                              ),
                              ReactionModel(
                                3,
                                AppImages.reaction_laugh,
                              ),
                              ReactionModel(
                                4,
                                AppImages.reaction_wow,
                              ),
                              ReactionModel(
                                5,
                                AppImages.reaction_sad,
                              ),
                              ReactionModel(
                                6,
                                AppImages.reaction_angry,
                              ),
                            ].map((e) {
                              onTap() {
                                _reactionTapped(e.value);
                                Helper.playReactionSound();
                              }

                              return ReactionIcon(
                                onTap: onTap,
                                imagePath: e.imagePath,
                              );
                            }).toList()),
                      ),
                    ),
                  );
                }),
        ],
      ),
    );
  }
}
