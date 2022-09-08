import 'package:flutter/material.dart';

typedef CarouselBuilder = Widget Function(
  BuildContext context,
  int index,
);

class Carousel extends StatelessWidget {
  final PageController? carouselController;
  final CarouselBuilder carouselBuilder;
  final int itemCount;

  const Carousel(
      {Key? key,
      required this.carouselBuilder,
      required this.itemCount,
      this.carouselController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      padEnds: false,
      pageSnapping: true,
      itemCount: this.itemCount,
      itemBuilder: this.carouselBuilder,
      controller: this.carouselController ?? PageController(),
    );
  }
}
