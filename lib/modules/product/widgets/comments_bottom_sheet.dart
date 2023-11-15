import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_mart/utils/app_images.dart';
import 'package:tech_mart/utils/extentions.dart';

import '../../../common/widgets/blue_black_shader.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_textstyle.dart';
import 'comment_tile.dart';

class CommentsBottomSheet extends StatelessWidget {
  const CommentsBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.w), topLeft: Radius.circular(20.0.w)),
      child: Container(
        color: AppColors.bgColor,
        height: context.height * 0.7,
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom + 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            10.verticalSpace,
            Container(
              height: 5.h,
              width: 40.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.w),
                  color: AppColors.lightBlack),
            ),
            12.verticalSpace,
            BlueBlackShaderMask(
                child: Text(
              'Comments',
              style: AppTextStyle.mediumBlack16.responsive,
            )),
            12.verticalSpace,
            Divider(
              thickness: 2,
              color: AppColors.black.withOpacity(0.5),
            ),
            Expanded(
              child: ListView(
                children: const [
                  CommentTile(
                    comment: 'Checking for birdies',
                    noOfLikes: '74',
                    timeAgo: '2w',
                    userProfilePath: AppImages.buggati,
                    userName: 'bedford_the_bengal',
                    replies: [
                      CommentTile(
                        comment: 'Checking for birdies',
                        noOfLikes: '74',
                        timeAgo: '2w',
                        userProfilePath: AppImages.buggati,
                        userName: 'bedford_the_bengal',
                        replies: [],
                      ),
                      CommentTile(
                        comment: 'Checking for birdies',
                        noOfLikes: '74',
                        timeAgo: '2w',
                        userProfilePath: AppImages.buggati,
                        userName: 'bedford_the_bengal',
                        replies: [],
                      ),
                      CommentTile(
                        comment: 'Checking for birdies',
                        noOfLikes: '74',
                        timeAgo: '2w',
                        userProfilePath: AppImages.buggati,
                        userName: 'bedford_the_bengal',
                        replies: [],
                      )
                    ],
                  )
                ],
              ),
            ),
            12.verticalSpace,
            TextField(
              autofocus: true,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 14.h),
                  prefixIcon: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 40.w,
                          width: 40.w,
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: AssetImage(AppImages.buggati),
                                  fit: BoxFit.cover)),
                        ),
                      ]),
                  hintText: 'Add a comment for the bengalalex...'),
            )
          ],
        ),
      ),
    );
  }
}
