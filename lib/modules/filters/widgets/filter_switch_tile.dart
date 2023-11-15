import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tech_mart/utils/extentions.dart';

import '../../../common/widgets/blue_black_shader.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';
import '../../../utils/app_textstyle.dart';

class FilterSwitchTile extends StatelessWidget {
  const FilterSwitchTile({
    super.key,
    required this.isSwithc,
    required this.text,
    this.onChanged,
  });

  final bool isSwithc;
  final String text;
  final void Function(bool)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: Theme.of(context).copyWith(useMaterial3: false),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12.0.h),
          child: SwitchListTile(
            enableFeedback: true,
            value: isSwithc,
            dense: true,
            visualDensity: VisualDensity(vertical: -4),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            title: BlueBlackShaderMask(
                child: Text(
              text,
              style: AppTextStyle.regularBlack14.responsive,
            )),
            activeThumbImage: const AssetImage(AppImages.activeSwitch),
            inactiveThumbImage: const AssetImage(AppImages.inactiveSwitch),
            activeColor: AppColors.blue.withOpacity(0.7),
            inactiveTrackColor: Colors.grey,
            overlayColor:
                MaterialStatePropertyAll(AppColors.blue.withOpacity(0.05)),
            inactiveThumbColor: AppColors.grey,
            activeTrackColor: AppColors.blue,
            onChanged: onChanged,
          ),
        ));
  }
}
