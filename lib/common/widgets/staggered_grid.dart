import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class StaggeredGrid extends StatelessWidget {
  const StaggeredGrid(
      {super.key,
      required this.position,
      this.horizontalOffset,
      required this.child,
      required this.columnCount,
      this.verticalOffset});
  final int position;
  final double? horizontalOffset;
  final double? verticalOffset;
  final Widget child;
  final int columnCount;

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredGrid(
      columnCount: columnCount,
      position: position,
      child: SlideAnimation(
        horizontalOffset: horizontalOffset ?? 50,
        verticalOffset: verticalOffset ?? 25,
        child: child,
      ),
    );
  }
}
