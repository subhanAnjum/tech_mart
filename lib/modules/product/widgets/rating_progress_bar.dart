import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_mart/utils/extentions.dart';

import '../../../common/widgets/blue_black_shader.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_textstyle.dart';

class RatingProgressBar extends StatelessWidget {
  const RatingProgressBar({
    super.key,
    required this.title,
    this.maxValue,
    this.currentValue,
  });
  final String title;
  final double? maxValue;
  final double? currentValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlueBlackShaderMask(
          child: Text(
            title,
            style: AppTextStyle.mediumBlack10,
          ),
        ),
        18.horizontal,
        Expanded(
          child: FAProgressBar(
            size: 10.h,
            progressGradient: AppColors.goldenGradient,
            backgroundColor: AppColors.grey.withOpacity(0.2),
            currentValue: currentValue ?? 10,
            maxValue: maxValue ?? 100,
            borderRadius: BorderRadius.circular(500.0),
          ),
        ),
      ],
    );
  }
}
