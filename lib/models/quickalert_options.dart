import 'package:flutter/widgets.dart';
import 'package:quickalert/models/quickalert_animtype.dart';
import 'package:quickalert/models/quickalert_type.dart';

class QuickAlertOptions {
  String? title;
  String? text;
  Widget? widget;
  QuickAlertType type;
  QuickAlertAnimType? animType;
  bool? barrierDismissible = false;
  VoidCallback? onConfirmBtnTap;
  VoidCallback? onCancelBtnTap;
  String? confirmBtnText;
  String? cancelBtnText;
  Color? confirmBtnColor;
  TextStyle? confirmBtnTextStyle;
  TextStyle? cancelBtnTextStyle;
  bool? showCancelBtn;
  double? borderRadius;
  String? customAsset;
  double? width;

  QuickAlertOptions({
    this.title,
    this.text,
    this.widget,
    required this.type,
    this.animType,
    this.barrierDismissible,
    this.onConfirmBtnTap,
    this.onCancelBtnTap,
    this.confirmBtnText,
    this.cancelBtnText,
    this.confirmBtnColor,
    this.confirmBtnTextStyle,
    this.cancelBtnTextStyle,
    this.showCancelBtn,
    this.borderRadius,
    this.customAsset,
    this.width,
  });
}
