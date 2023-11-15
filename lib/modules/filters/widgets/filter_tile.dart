import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_mart/common/widgets/blue_smooth_shader_mask.dart';
import 'package:tech_mart/utils/extentions.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_textstyle.dart';

class FilterTile extends StatelessWidget {
  const FilterTile({
    super.key,
    required this.options,
    required this.onSelection,
    required this.title,
    this.children,
    this.selectedValue,
  });
  final List<String> options;
  final Function(String) onSelection;
  final String title;
  final List<Widget>? children;
  final String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      tilePadding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 20.w),
      collapsedShape: Border(
          bottom: BorderSide(color: AppColors.shadowColor.withOpacity(0.1))),
      shape: Border(
          bottom: BorderSide(color: AppColors.shadowColor.withOpacity(0.1))),
      title: BlueSmoothShaderMask(
        child: Text(
          title,
          style: AppTextStyle.regularBlack14.responsive,
        ),
      ),
      children: children ??
          [
            ...List.generate(options.length, (index) {
              final option = options[index];
              final selected = option == selectedValue;
              return Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.0.w,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            borderRadius: BorderRadius.circular(5.0.w),
                            onTap: () => onSelection(option),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5.0.w, vertical: 10.h),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0.w),
                                gradient:
                                    selected ? AppColors.goldenGradient : null,
                              ),
                              child: Text(
                                option,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: selected
                                    ? AppTextStyle.boldBlack14
                                        .copyWith(
                                            color: AppColors.blue,
                                            fontWeight: FontWeight.w500)
                                        .responsive
                                    : AppTextStyle.mediumGrey14
                                        .copyWith(color: AppColors.lightGrey)
                                        .responsive,
                              ),
                            ),
                          ),
                          Divider(
                            color: (options.last == option)
                                ? Colors.transparent
                                : AppColors.lightGrey.withOpacity(0.2),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }),
          ],
    );
  }
}
