import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_colors.dart';
import 'blue_black_shader.dart';

class ArrowButton extends StatelessWidget {
  const ArrowButton({
    super.key,
    this.onTap,
  });
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onTap ?? () {},
        padding: EdgeInsets.zero,
        style: IconButton.styleFrom(padding: EdgeInsets.zero),
        icon: Container(
          height: 24.w,
          width: 24.w,
          decoration: const BoxDecoration(
              gradient: AppColors.goldenGradient, shape: BoxShape.circle),
          alignment: Alignment.center,
          child: BlueBlackShaderMask(
              child: Icon(
            Icons.arrow_forward,
            size: 22.w,
          )),
        ));
  }
}
