import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bounce_animator.dart';

class ReactionIcon extends StatefulWidget {
  const ReactionIcon({
    super.key,
    required this.onTap,
    required this.imagePath,
  });

  final Null Function() onTap;
  final String imagePath;

  @override
  State<ReactionIcon> createState() => _ReactionIconState();
}

class _ReactionIconState extends State<ReactionIcon>
    with TickerProviderStateMixin {
  bool showAnimation = false;

  @override
  Widget build(BuildContext context) {
    final child = Image.asset(
      widget.imagePath,
      height: 38.h,
      width: 38.w,
    );
    const duration = Duration(milliseconds: 350);
    return InkWell(
      onTap: () async {
        setState(() {
          showAnimation = true;
        });
        await Future.delayed(duration);
        widget.onTap();
      },
      child: showAnimation
          ? BounceAnimator(
              duration: Duration(milliseconds: duration.inMilliseconds ~/ 2),
              child: child)
          : child,
    );
  }
}
