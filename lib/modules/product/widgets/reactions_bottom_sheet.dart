import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_mart/modules/product/models/tab_model.dart';
import 'package:tech_mart/modules/product/widgets/reactions_list_view.dart';
import 'package:tech_mart/utils/app_images.dart';
import 'package:tech_mart/utils/extentions.dart';

import '../../../common/widgets/blue_black_shader.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_textstyle.dart';
import 'reaction_user_list_tile.dart';

class ReactionsBottomSheet extends StatelessWidget {
  const ReactionsBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.w), topLeft: Radius.circular(20.0.w)),
      child: DefaultTabController(
        length: 8,
        child: Container(
          height: context.height * 0.8,
          color: AppColors.bgColor,
          child: Column(
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
                'People Who Reacted',
                style: AppTextStyle.mediumBlack16.responsive,
              )),
              12.verticalSpace,
              Divider(
                thickness: 2.h,
                color: Colors.blueGrey,
              ),
              SizedBox(
                height: 42.h,
                child: TabBar(
                  dividerColor: Colors.transparent,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.blueGrey,
                  labelStyle: AppTextStyle.mediumGrey14.responsive,
                  unselectedLabelStyle: AppTextStyle.mediumGrey14.responsive,
                  indicator: BoxDecoration(),
                  indicatorPadding: EdgeInsets.zero,
                  indicatorWeight: 0,
                  indicatorSize: null,
                  tabs: [
                    ...<TabModel>[
                      TabModel(lable: '130K', imagePath: null),
                      TabModel(
                          lable: '72K', imagePath: AppImages.reaction_like),
                      TabModel(
                          lable: '72K', imagePath: AppImages.reaction_heart),
                      TabModel(
                          lable: '72K', imagePath: AppImages.reaction_care),
                      TabModel(lable: '72K', imagePath: AppImages.reaction_wow),
                      TabModel(
                          lable: '72K', imagePath: AppImages.reaction_laugh),
                      TabModel(
                          lable: '72K', imagePath: AppImages.reaction_angry),
                      TabModel(lable: '72K', imagePath: AppImages.reaction_sad),
                    ]
                        .map((e) => Tab(
                              child: SizedBox(
                                  width: context.width * 0.2,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      if (e.imagePath == null) Text('All'),
                                      if (e.imagePath != null)
                                        Image.asset(
                                          e.imagePath!,
                                          fit: BoxFit.contain,
                                          height: 14.h,
                                          width: 14.w,
                                        ),
                                      4.horizontalSpace,
                                      Text(e.lable),
                                    ],
                                  )),
                            ))
                        .toList(),
                  ],
                  isScrollable: true,
                ),
              ),
              Divider(
                thickness: 2,
                color: Colors.blueGrey,
              ),
              Expanded(
                child: TabBarView(
                  // controller: scrollController,
                  children: List.generate(
                    8,
                    (index) => ReactionListView(
                      children: [
                        ReactionUserListTile(
                          name: 'Darrell Steward',
                          userProfileImage: AppImages.buggati,
                          reactionImage: AppImages.reaction_like,
                        ),
                        ReactionUserListTile(
                          name: 'Darrell Steward',
                          userProfileImage: AppImages.buggati,
                          reactionImage: AppImages.reaction_angry,
                          isFollowed: true,
                        ),
                        ReactionUserListTile(
                          name: 'Darrell Steward',
                          userProfileImage: AppImages.buggati,
                          reactionImage: AppImages.reaction_laugh,
                        ),
                        ReactionUserListTile(
                          name: 'Darrell Steward',
                          userProfileImage: AppImages.buggati,
                          reactionImage: AppImages.reaction_heart,
                        ),
                        ...List.generate(
                          10,
                          (index) => ReactionUserListTile(
                            name: 'Darrell Steward',
                            userProfileImage: AppImages.buggati,
                            reactionImage: AppImages.reaction_laugh,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
