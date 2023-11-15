import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_mart/utils/app_images.dart';
import 'package:tech_mart/utils/extentions.dart';

import '../../../common/widgets/blue_black_shader.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_textstyle.dart';

class CommentTile extends StatefulWidget {
  const CommentTile({
    super.key,
    this.replies,
    required this.userName,
    required this.timeAgo,
    required this.comment,
    required this.noOfLikes,
    this.onTapLike,
    this.onTapReply,
    required this.userProfilePath,
  });
  final List<CommentTile>? replies;
  final String userName;
  final String timeAgo;
  final String comment;
  final String userProfilePath;
  final String noOfLikes;
  final VoidCallback? onTapLike;
  final VoidCallback? onTapReply;

  @override
  State<CommentTile> createState() => _CommentTileState();
}

class _CommentTileState extends State<CommentTile> {
  bool viewAll = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  BlueBlackShaderMask(
                      child: Text(
                    widget.userName,
                    style: AppTextStyle.mediumBlack14.responsive,
                  )),
                  5.horizontalSpace,
                  Text(
                    widget.timeAgo,
                    style: AppTextStyle.regularGrey14
                        .copyWith(color: AppColors.darkGrey)
                        .responsive,
                  )
                ],
              ),
              Text(
                widget.comment,
                style: AppTextStyle.regularGrey14
                    .copyWith(color: AppColors.blueGrey)
                    .responsive,
              )
            ],
          ),
          trailing:
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            IconButton(
              onPressed: widget.onTapLike ?? () {},
              style: IconButton.styleFrom(
                  padding: const EdgeInsets.all(0.0),
                  visualDensity:
                      const VisualDensity(horizontal: -4, vertical: -4)),
              icon: Image.asset(
                AppImages.ic_heart_outline,
                height: 16.h,
                width: 16.w,
                color: AppColors.darkGrey,
              ),
            ),
            Expanded(
              child: Text(
                '74',
                style: AppTextStyle.regularGrey14
                    .copyWith(
                      color: AppColors.darkGrey,
                    )
                    .responsive,
              ),
            )
          ]),
          subtitle: InkWell(
            onTap: widget.onTapReply,
            child: SizedBox(
              child: Text(
                'Reply',
                style: AppTextStyle.mediumGrey14
                    .copyWith(color: AppColors.darkGrey)
                    .responsive,
              ),
            ),
          ),
          leading: Container(
            height: 40.w,
            width: 40.w,
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage(widget.userProfilePath),
                    fit: BoxFit.cover)),
          ),
        ),
        if (widget.replies?.isNotEmpty ?? false) ...[
          10.verticalSpace,
          if (widget.replies!.length > 1 && !viewAll)
            ...[widget.replies!.first].map(
              (e) => Row(
                children: [
                  SizedBox(
                    width: context.width * 0.125,
                  ),
                  Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          e,
                          10.verticalSpace,
                          InkWell(
                            onTap: () {
                              setState(() {
                                viewAll = true;
                              });
                            },
                            child: Row(
                              children: [
                                4.horizontalSpace,
                                Container(
                                  width: 53.w,
                                  height: 1.h,
                                  color: AppColors.darkGrey.withOpacity(0.3),
                                ),
                                4.horizontalSpace,
                                Text(
                                  'View ${widget.replies!.length - 1} more reply',
                                  style: AppTextStyle.regularGrey12
                                      .copyWith(
                                        color: AppColors.darkGrey,
                                      )
                                      .responsive,
                                )
                              ],
                            ),
                          )
                        ],
                      ))
                ],
              ),
            ),
          if (viewAll)
            ...widget.replies!.map(
              (e) => Row(
                children: [
                  SizedBox(
                    width: context.width * 0.125,
                  ),
                  Expanded(flex: 2, child: e)
                ],
              ),
            ),
        ]
      ],
    );
  }
}
