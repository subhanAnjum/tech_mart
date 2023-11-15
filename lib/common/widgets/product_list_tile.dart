import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_mart/utils/extentions.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_images.dart';
import '../../utils/app_textstyle.dart';
import '../models/product_model.dart';
import 'blue_black_shader.dart';

class ProductListTile extends StatelessWidget {
  const ProductListTile({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 127.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0.w),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 5,
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 127.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0.w),
                            bottomLeft: Radius.circular(10.0.w),
                          ),
                          color: AppColors.black,
                          image: DecorationImage(
                              image: AssetImage(product.imageUrl),
                              fit: BoxFit.cover)),
                    ),

                    // image and video count
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
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
                                2.horizontal,
                                Text(
                                  product.imageCount,
                                  style: AppTextStyle.regularWhite8.responsive,
                                ),
                              ],
                            ),
                            4.horizontalSpace,
                            Row(
                              children: [
                                Icon(
                                  Icons.videocam,
                                  size: 8.w,
                                  color: AppColors.grey,
                                ),
                                2.horizontalSpace,
                                Text(
                                  product.videoCount,
                                  style: AppTextStyle.regularWhite8.responsive,
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
                          decoration:
                              BoxDecoration(shape: BoxShape.circle, boxShadow: [
                            BoxShadow(
                                offset: const Offset(0, 0),
                                color: AppColors.shadowColor.withOpacity(0.1),
                                spreadRadius: 1.0,
                                blurRadius: 2.0.w)
                          ]),
                          child: IconButton(
                            padding: const EdgeInsets.all(0.0),
                            visualDensity: const VisualDensity(
                                horizontal: -1, vertical: -4),
                            onPressed: () {},
                            icon: Icon(
                              Icons.favorite_rounded,
                              size: 24.w,
                              color: Colors.white,
                            ),
                          ),
                        )),

                    if (product.isFeatured)
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 22.h,
                          width: 79.w,
                          decoration: BoxDecoration(
                            gradient: AppColors.goldenGradient,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0.w),
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
                      ),

                    // if (product.isFeatured)
                    //   Positioned(
                    //     bottom: 0,
                    //     right: 0,
                    //     child: Container(
                    //       height: 16,
                    //       width: 69,
                    //       decoration: const BoxDecoration(
                    //         gradient: AppColors.goldenGradient,
                    //         borderRadius: BorderRadius.only(
                    //           topLeft: Radius.circular(6.0),
                    //         ),
                    //       ),
                    //       alignment: Alignment.center,
                    //       child: BlueBlackShaderMask(
                    //         child: Text(
                    //           'Featured',
                    //           // gradientDirection: GradientDirection.ttb,
                    //           // colors: AppColors.blueBlackGradient.colors,
                    //           style: AppTextStyle.mediumBlack8,
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                  ],
                ),
              ),
              Expanded(
                  flex: 6,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 8.h),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BlueBlackShaderMask(
                          child: Text(
                            product.title +
                                'Lorem ipsum dolor sit amet consectetur.',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyle.mediumBlack14.responsive,
                          ),
                        ),
                        //price
                        Text(
                          product.price,
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
                              product.rating,
                              style: AppTextStyle.regularBlack14.responsive,
                            )
                          ],
                        ),
                        //seller
                        BlueBlackShaderMask(
                          child: Text(
                            product.sellerName,
                            maxLines: 1,
                            style: AppTextStyle.regularBlack12.responsive
                                .copyWith(color: AppColors.blue),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
        //shopping bag icon

        Positioned(
          bottom: 10.h,
          right: 16.w,
          child: Container(
            height: 34.h,
            width: 34.w,
            decoration: const BoxDecoration(
                color: AppColors.bgColor, shape: BoxShape.circle),
            alignment: Alignment.center,
            child: Image.asset(
              AppImages.icBag,
              height: 20.h,
              width: 20.w,
            ),
          ),
        ),
      ],
    );
  }
}
