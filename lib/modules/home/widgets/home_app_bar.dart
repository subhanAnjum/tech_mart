import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_mart/common/widgets/actions_button.dart';
import 'package:tech_mart/utils/app_colors.dart';
import 'package:tech_mart/utils/app_images.dart';
import 'package:tech_mart/utils/extentions.dart';

AppBar homeAppbar({
  required BuildContext context,
  VoidCallback? onTapMenu,
  VoidCallback? onTapNotification,
  VoidCallback? onTapMessages,
  String? notificationBadgeText,
  String? messagesBadgeText,
}) {
  return AppBar(
    toolbarHeight: 143.h,
    flexibleSpace: Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              color: AppColors.systemColor,
              child: Container(
                height: 88.h,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [AppColors.secondary, AppColors.primary],
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: onTapMenu ?? () {},
                      icon: Image.asset(
                        AppImages.icMenu,
                        height: 12.67.h,
                        width: 19.w,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ActionsButton(
                          image: AppImages.icNotification,
                          badgeText: notificationBadgeText,
                          onTap: onTapNotification,
                        ),
                        ActionsButton(
                          image: AppImages.icMessages,
                          badgeText: messagesBadgeText,
                          onTap: onTapMessages,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            (143.h - 88.h).vertical,
          ],
        ),
        Image(
            image: const AssetImage(AppImages.homeLogo),
            height: 143.h,
            width: 143.w),
      ],
    ),
  );
}
