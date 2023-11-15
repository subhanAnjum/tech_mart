import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:tech_mart/common/widgets/blue_black_shader.dart';
import 'package:tech_mart/utils/app_colors.dart';
import 'package:tech_mart/utils/app_textstyle.dart';

class AppButton extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double height;
  final Gradient gradient;
  final VoidCallback? onPressed;
  final String text;
  final TextStyle? style;
  final bool faded;
  final bool inversed;

  const AppButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.borderRadius,
    this.width,
    this.height = 44.0,
    this.gradient = AppColors.goldenGradient,
    this.style,
    this.faded = true,
    this.inversed = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = this.borderRadius ?? BorderRadius.circular(10.0.w);
    return InkWell(
      onTap: onPressed,
      borderRadius: borderRadius.resolve(TextDirection.ltr),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: inversed ? null : gradient,
          color: inversed ? Colors.white : null,
          border: inversed
              ? Border.all(color: AppColors.shadowColor.withOpacity(0.6))
              : null,
          borderRadius: borderRadius,
        ),
        child: ElevatedButton(
          onPressed: faded ? null : onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            elevation: 0,
            disabledBackgroundColor: AppColors.white.withOpacity(0.4),
            shape: RoundedRectangleBorder(borderRadius: borderRadius),
          ),
          child: BlueBlackShaderMask(
            child: Text(
              text,
              maxLines: 1,
              // colors: AppColors.blueBlackGradient.colors,
              // gradientDirection: GradientDirection.ttb,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: style?.copyWith(fontSize: style?.fontSize?.h) ??
                  AppTextStyle.mediumBlack14.copyWith(fontSize: 14.h),
            ),
          ),
        ),
      ),
    );
  }
}
