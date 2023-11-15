import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_mart/utils/app_colors.dart';
import 'package:tech_mart/utils/extentions.dart';

import '../../../utils/app_textstyle.dart';

class ReactionUserListTile extends StatelessWidget {
  const ReactionUserListTile({
    super.key,
    required this.name,
    required this.reactionImage,
    required this.userProfileImage,
    this.onTap,
    this.onTapFollow,
    this.isFollowed = false,
  });
  final String name;
  final String reactionImage;
  final String userProfileImage;
  final VoidCallback? onTap;
  final VoidCallback? onTapFollow;
  final bool isFollowed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.0.w),
      child: ListTile(
        onTap: onTap,
        title: Text(
          name,
          style: AppTextStyle.regularBlack16.responsive,
        ),
        trailing: GestureDetector(
          onTap: onTapFollow,
          child: Container(
            height: 36.h,
            width: 125.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: isFollowed
                    ? AppColors.grey.withOpacity(0.3)
                    : AppColors.lightBlue,
                borderRadius: BorderRadius.circular(5.w)),
            child: Text(
              isFollowed ? 'Following' : 'Follow',
              style: isFollowed
                  ? AppTextStyle.mediumBlack14
                      .copyWith(color: AppColors.lightGrey)
                      .responsive
                  : AppTextStyle.mediumWhite14.responsive,
            ),
          ),
        ),
        leading: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.bottomRight,
          children: [
            Container(
              height: 64.w,
              width: 64.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage(userProfileImage), fit: BoxFit.cover),
              ),
            ),
            Image.asset(
              reactionImage,
              height: 16.w,
              width: 16.w,
            ),
          ],
        ),
      ),
    );
  }
}
