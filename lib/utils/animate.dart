import 'package:flutter/widgets.dart';
import 'package:vector_math/vector_math.dart' as math;

/// Define Animation Type
class Animate {
  /// scale Animation
  static Transform scale({
    /// child
    required Widget child,

    /// animation
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

  /// rotate Animation
  static Transform rotate({
    /// child
    required Widget child,

    /// animation
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

  /// slideInDown Animation
  static Transform slideInDown({
    /// child
    required Widget child,

    /// animation
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

  /// slideInUp Animation
  static Transform slideInUp({
    /// child
    required Widget child,

    /// animation
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

  /// slideInLeft Animation
  static Transform slideInLeft({
    /// child
    required Widget child,

    /// animation
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

  /// slideInRight Animation
  static Transform slideInRight({
    /// child
    required Widget child,

    /// animation
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
