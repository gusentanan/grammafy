import 'package:flutter/material.dart';
import 'package:grammafy/widgets/animation/transition_model.dart';

@immutable
abstract class EnterTransition {
  TransitionData get data;

  /// Combines different enter transitions.
  /// * [enter]- another EnterTransition to be combined
  EnterTransition operator +(EnterTransition enter) {
    return EnterTransitionImpl(
      TransitionData(
        opacity: data.opacity ?? enter.data.opacity,
        slide: data.slide ?? enter.data.slide,
      ),
    );
  }
}

@immutable
class EnterTransitionImpl extends EnterTransition {
  @override
  final TransitionData data;

  EnterTransitionImpl(this.data);
}

//ExitTransition defines how an AnimatedVisibility Widget
// disappears from screen as it becomes invisible.
@immutable
abstract class ExitTransition {
  TransitionData get data;

  /// Combines different exit transitions.
  ExitTransition operator +(ExitTransition exit) {
    return ExitTransitionImpl(
      TransitionData(
        opacity: data.opacity ?? exit.data.opacity,
        slide: data.slide ?? exit.data.slide,
      ),
    );
  }
}

class ExitTransitionImpl extends ExitTransition {
  @override
  final TransitionData data;

  ExitTransitionImpl(this.data);
}

// ===== Method for slide in Animation =====
// Slide In
EnterTransition slideIn({
  Offset initialOffset = const Offset(1.0, 1.0),
  Curve curve = Curves.linear,
}) {
  final slideTransition =
      Tween(begin: initialOffset, end: const Offset(0.0, 0.0))
          .chain(CurveTween(curve: curve));
  return EnterTransitionImpl(
    TransitionData(slide: Slide(initialOffset, slideTransition)),
  );
}

EnterTransition slideInHorizontally({
  double initialOffsetX = 1.0,
  Curve curve = Curves.linear,
}) {
  return slideIn(initialOffset: Offset(initialOffsetX, 0.0), curve: curve);
}

EnterTransition slideInVertically({
  double initialOffsetY = 1.0,
  Curve curve = Curves.linear,
}) {
  return slideIn(initialOffset: Offset(0.0, initialOffsetY), curve: curve);
}

// Slide Out
ExitTransition slideOut({
  Offset targetOffset = const Offset(1.0, 1.0),
  Curve curve = Curves.linear,
}) {
  final slideTransition =
      Tween(begin: const Offset(0.0, 0.0), end: targetOffset)
          .chain(CurveTween(curve: curve));
  return ExitTransitionImpl(
    TransitionData(slide: Slide(targetOffset, slideTransition)),
  );
}

ExitTransition slideOutHorizontally({
  double targetOffsetX = 1.0,
  Curve curve = Curves.linear,
}) {
  return slideOut(targetOffset: Offset(targetOffsetX, 0.0), curve: curve);
}

ExitTransition slideOutVertically({
  double targetOffsetY = 1.0,
  Curve curve = Curves.linear,
}) {
  return slideOut(targetOffset: Offset(0.0, targetOffsetY), curve: curve);
}

// ===== Method for fade Animation =====
// Fade

EnterTransition fadeIn({
  double initialAlpha = 0.0,
  Curve curve = Curves.linear,
}) {
  final Animatable<double> fadeInTransition = Tween<double>(
    begin: initialAlpha,
    end: 1.0,
  ).chain(CurveTween(curve: curve));

  return EnterTransitionImpl(
    TransitionData(opacity: fadeInTransition),
  );
}

ExitTransition fadeOut({
  double targetAlpha = 0.0,
  Curve curve = Curves.linear,
}) {
  final Animatable<double> fadeOutTransition = Tween<double>(
    begin: 1.0,
    end: targetAlpha,
  ).chain(CurveTween(curve: curve));

  return ExitTransitionImpl(
    TransitionData(opacity: fadeOutTransition),
  );
}
