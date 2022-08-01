import 'package:flutter/widgets.dart';
import 'package:quickalert/models/quickalert_animtype.dart';
import 'package:quickalert/models/quickalert_type.dart';

/// Alert Options
class QuickAlertOptions {
  /// Title of the dialog
  String? title;

  /// Text of the dialog
  String? text;

  /// Custom Widget of the dialog
  Widget? widget;

  /// Alert type [success, error, warning, confirm, info, loading, custom]
  QuickAlertType type;

  /// Animation type  [scale, rotate, slideInDown, slideInUp, slideInLeft, slideInRight]
  QuickAlertAnimType? animType;

  /// Barrier Dissmisable
  bool? barrierDismissible = false;

  /// Triggered when confirm button is tapped
  VoidCallback? onConfirmBtnTap;

  /// Triggered when cancel button is tapped
  VoidCallback? onCancelBtnTap;

  /// Confirmation button text
  String? confirmBtnText;

  /// Cancel button text
  String? cancelBtnText;

  /// Color for confirm button
  Color? confirmBtnColor;

  /// TextStyle for confirm button
  TextStyle? confirmBtnTextStyle;

  /// Determines if cancel button is shown or not
  TextStyle? cancelBtnTextStyle;

  /// Dialog Border Radius
  bool? showCancelBtn;

  /// Asset path of your Image file
  double? borderRadius;

  /// Width of the dialog
  String? customAsset;

  /// Determines how long the dialog stays open for before closing, [default] is null. When it is null, it won't autoclose
  double? width;

  /// Alert Options
  QuickAlertOptions({
    /// Title of the dialog
    this.title,

    /// Text of the dialog
    this.text,

    /// Custom Widget of the dialog
    this.widget,

    /// Alert type [success, error, warning, confirm, info, loading, custom]
    required this.type,

    /// Animation type  [scale, rotate, slideInDown, slideInUp, slideInLeft, slideInRight]
    this.animType,

    /// Barrier Dissmisable
    this.barrierDismissible,

    /// Triggered when confirm button is tapped
    this.onConfirmBtnTap,

    /// Triggered when cancel button is tapped
    this.onCancelBtnTap,

    /// Confirmation button text
    this.confirmBtnText,

    /// Cancel button text
    this.cancelBtnText,

    /// Color for confirm button
    this.confirmBtnColor,

    /// TextStyle for confirm button
    this.confirmBtnTextStyle,

    /// Determines if cancel button is shown or not
    this.cancelBtnTextStyle,

    /// Dialog Border Radius
    this.showCancelBtn,

    /// Asset path of your Image file
    this.borderRadius,

    /// Width of the dialog
    this.customAsset,

    /// Determines how long the dialog stays open for before closing, [default] is null. When it is null, it won't autoclose
    this.width,
  });
}
