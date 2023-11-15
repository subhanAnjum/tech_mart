import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';

class BottomNavigationItem extends StatelessWidget {
  const BottomNavigationItem({
    super.key,
    required this.onTap,
    required this.isSelected,
    required this.iconPath,
  });
  final VoidCallback onTap;
  final bool isSelected;
  final String iconPath;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Material(
          elevation: 0,
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(500.0),
            onTap: onTap,
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: !isSelected ? null : AppColors.white.withOpacity(0.15),
              ),
              alignment: Alignment.center,
              child: ShaderMask(
                shaderCallback: (rect) {
                  return LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: !isSelected
                        ? [AppColors.white, AppColors.white]
                        : [AppColors.secondary, AppColors.primary],
                  ).createShader(rect);
                },
                blendMode: BlendMode.srcIn,
                child: Image.asset(
                  iconPath,
                  height: 24,
                  width: 24,
                  // color: !isSelected ? AppColorshite : AppColors.primary,
                ),
              ),
            ),
          ),
        ),
        Container(
          height: 5,
          width: 30,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              gradient: !isSelected
                  ? null
                  : const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [AppColors.secondary, AppColors.primary],
                    )),
        )
      ],
    );
  }
}
