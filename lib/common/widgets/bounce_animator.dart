import 'dart:developer';

import 'package:flutter/material.dart';

class BounceAnimator extends StatefulWidget {
  const BounceAnimator(
      {super.key, required this.duration, required this.child});
  final Duration duration;
  final Widget child;

  @override
  State<StatefulWidget> createState() => _BounceAnimator();
}

class _BounceAnimator extends State<BounceAnimator>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(duration: widget.duration, vsync: this);
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    log('bounce');
    return ScaleTransition(
      scale: Tween(begin: 1.0, end: 1.5).animate(
          CurvedAnimation(parent: _controller, curve: Curves.bounceInOut)),
      child: widget.child,
    );
  }
}
