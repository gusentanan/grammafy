import 'package:flutter/material.dart';

@immutable
class TransitionData {
  final Slide? slide;
  final Animatable<double>? opacity;

  const TransitionData({
    this.slide,
    this.opacity,
  });
}

@immutable
class Slide {
  final Offset offset;
  final Animatable<Offset> animation;
  const Slide(
    this.offset,
    this.animation,
  );
}

@immutable
class Fade {
  final Animatable<double> animation;
  const Fade(this.animation);
}
