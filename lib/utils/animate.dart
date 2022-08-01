import 'package:flutter/widgets.dart';
import 'package:vector_math/vector_math.dart' as math;

class Animate {
  static Transform scale({
    required Widget child,
    required Animation<double> animation,
  }) {
    return Transform.scale(
      scale: animation.value,
      child: Opacity(
        opacity: animation.value,
        child: child,
      ),
    );
  }

  static Transform rotate({
    required Widget child,
    required Animation<double> animation,
  }) {
    return Transform.rotate(
      angle: math.radians(animation.value * 360),
      child: Opacity(
        opacity: animation.value,
        child: child,
      ),
    );
  }

  static Transform slideInDown({
    required Widget child,
    required Animation<double> animation,
  }) {
    final curvedValue = Curves.easeInOutBack.transform(animation.value) - 1.0;
    return Transform(
      transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
      child: Opacity(
        opacity: animation.value,
        child: child,
      ),
    );
  }

  static Transform slideInUp({
    required Widget child,
    required Animation<double> animation,
  }) {
    final curvedValue = Curves.easeInOutBack.transform(animation.value) - 1.0;
    return Transform(
      transform: Matrix4.translationValues(0.0, curvedValue * -200, 0.0),
      child: Opacity(
        opacity: animation.value,
        child: child,
      ),
    );
  }

  static Transform slideInLeft({
    required Widget child,
    required Animation<double> animation,
  }) {
    final curvedValue = Curves.easeInOutBack.transform(animation.value) - 1.0;
    return Transform(
      transform: Matrix4.translationValues(curvedValue * 200, 0.0, 0.0),
      child: Opacity(
        opacity: animation.value,
        child: child,
      ),
    );
  }

  static Transform slideInRight({
    required Widget child,
    required Animation animation,
  }) {
    final curvedValue = Curves.easeInOutBack.transform(animation.value) - 1.0;
    return Transform(
      transform: Matrix4.translationValues(curvedValue * -200, 0, 0),
      child: Opacity(
        opacity: animation.value,
        child: child,
      ),
    );
  }
}
