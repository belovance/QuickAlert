import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:quickalert/models/quickalert_animtype.dart';
import 'package:quickalert/models/quickalert_type.dart';

class AlertHeaderOptions {
  /// Header Widget
  Widget? header;

  /// Header Backgroung Color for dialog
  Color? backgroundColor;

  /// default height of the header
  double? height;

  AlertHeaderOptions({
    this.header,
    this.backgroundColor,
  });
}

class AlertTitleOptions {
  /// Title of the dialog
  String? title;

  /// TitleAlignment of the dialog
  TextAlign? alignment;

  /// Header Backgroung Color for dialog
  Color? backgroundColor;

  /// Header Backgroung Color for dialog
  Color? color;

  /// Color of title
  TextStyle? style;

  /// padding of the content
  EdgeInsetsGeometry? padding;

  AlertTitleOptions({
    this.title,
    this.alignment,
    this.backgroundColor,
    this.style,
    this.color,
    this.padding,
  });
}

class AlertContentOptions {
  /// Text of the dialog
  String? text;

  /// TextAlignment of the dialog
  TextAlign? alignment;

  /// Custom Widget of the dialog
  Widget? content;

  /// padding of the content
  EdgeInsetsGeometry? padding;

  /// Color of text
  Color? color;

  AlertContentOptions({
    this.text,
    this.alignment,
    this.content,
    this.padding,
    this.color,
  });
}

enum AlertButtonType {
  confirm,
  cancel,
}

class AlertButton {
  AlertButtonType type;

  VoidCallback? onTap;

  String? text;

  /// Color of title
  TextStyle? style;

  double? radius;

  double? width;

  double? height;

  Widget? button;

  Color? color;

  Color? backgroundColor;

  AlertButton({
    required this.type,
    this.onTap,
    this.text,
    this.style,
    this.radius,
    this.width,
    this.height,
    this.button,
    this.color,
    this.backgroundColor,
  });
}

class AlertButtonOptions {
  AlertButton? confirmButton;
  AlertButton? cancelButton;
  Axis? direction;

  AlertButtonOptions({
    this.direction,
    this.confirmButton,
    this.cancelButton,
  });
}

/// Alert Options
class QuickAlertOptions {
  /// Alert type [success, error, warning, confirm, info, loading, custom]
  QuickAlertType type;

  /// Animation type  [scale, rotate, slideInDown, slideInUp, slideInLeft, slideInRight]
  QuickAlertAnimType? animType;

  /// Barrier dismissible
  bool? barrierDismissible = false;

  /// Backgroung Color for dialog
  Color? backgroundColor;

  /// Dialog Border Radius
  double? borderRadius;

  /// Width of the dialog
  double? width;

  /// timer for dismissing dialog (Ok button)
  Timer? timer;

  AlertHeaderOptions? headerOptions;

  AlertContentOptions? contentOptions;

  AlertButtonOptions? buttonOptions;

  AlertTitleOptions? alertTitleOptions;

  /// Alert Options
  QuickAlertOptions({
    /// Alert type [success, error, warning, confirm, info, loading, custom]
    required this.type,

    /// Animation type  [scale, rotate, slideInDown, slideInUp, slideInLeft, slideInRight]
    this.animType,

    /// Barrier Dissmisable
    this.barrierDismissible,

    /// Backgroung Color for dialog
    this.backgroundColor,

    /// Dialog Border Radius
    this.borderRadius,

    /// Width of the dialog
    this.width,

    /// timer for dismissing dialog (Ok button)
    this.timer,
    this.headerOptions,
    this.alertTitleOptions,
    this.contentOptions,
    this.buttonOptions,
  });
}
