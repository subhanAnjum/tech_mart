import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class StaggeredListHorizontal extends StatelessWidget {
  const StaggeredListHorizontal(
      {super.key,
      required this.position,
      this.horizontalOffset,
      required this.child,
      this.verticalOffset});
  final int position;
  final double? horizontalOffset;
  final double? verticalOffset;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: position,
      duration: const Duration(milliseconds: 500),
      child: SlideAnimation(
        verticalOffset: verticalOffset,
        horizontalOffset: horizontalOffset ?? 50,
        child: child,
      ),
    );
  }
}
