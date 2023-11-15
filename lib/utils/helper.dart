import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class Helper {
  static final player = AudioPlayer();
  static Route createRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  static playReactionSound() async {
    await player.play(AssetSource('sounds/woosh.flac'));
  }
}
