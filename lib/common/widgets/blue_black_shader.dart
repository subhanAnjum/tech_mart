import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';

class BlueBlackShaderMask extends StatelessWidget {
  const BlueBlackShaderMask({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
        shaderCallback: (rect) {
          // return AppColors.blueBlackGradient.createShader(rect);
          return AppColors.blueSmoothGradient.createShader(rect);
        },
        blendMode: BlendMode.srcIn,
        child: child);

    // return child;
  }
}
