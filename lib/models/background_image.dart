import 'package:flutter/material.dart';

class MVBackground extends StatelessWidget {
  final child;

  MVBackground({this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: child,
        decoration: BoxDecoration(
            image: DecorationImage(
                colorFilter: ColorFilter.mode(
                    Colors.grey.withOpacity(0.2),
                    BlendMode.saturation),
                repeat: ImageRepeat.repeat,
                image: AssetImage("assets/images/sprinkles_background.png"))));
  }
}
