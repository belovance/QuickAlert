import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quickalert/models/quickalert_animtype.dart';
import 'package:quickalert/models/quickalert_options.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/utils/animate.dart';
import 'package:quickalert/widgets/quickalert_container.dart';

/// QuickAlert
class QuickAlert {
  /// Instantly display animated alert dialogs such as success, error, warning, confirm, loading or even a custom dialog.
  static Future show({
    /// BuildContext
    required BuildContext context,

    /// Title of the dialog
    String? title,

    /// Text of the dialog
    String? text,

    /// TitleAlignment of the dialog
    TextAlign? titleAlignment,

    /// TextAlignment of the dialog
    TextAlign? textAlignment,

    /// Custom Widget of the dialog
    Widget? widget,

    /// Alert type [success, error, warning, confirm, info, loading, custom]
    required QuickAlertType type,

    /// Animation type  [scale, rotate, slideInDown, slideInUp, slideInLeft, slideInRight]
    QuickAlertAnimType animType = QuickAlertAnimType.scale,

    /// Barrier Dismissible
    bool barrierDismissible = true,

    /// Triggered when confirm button is tapped
    VoidCallback? onConfirmBtnTap,

    /// Triggered when cancel button is tapped
    VoidCallback? onCancelBtnTap,

    /// Confirmation button text
    String confirmBtnText = 'Okay',

    /// Cancel button text
    String cancelBtnText = 'Cancel',

    /// Color for confirm button
    Color confirmBtnColor = Colors.blue,

    /// TextStyle for confirm button
    TextStyle? confirmBtnTextStyle,

    /// TextStyle for cancel button
    TextStyle? cancelBtnTextStyle,

    /// ButtonStyle for cancel button
    ButtonStyle? cancelButtonStyle,

    /// Background Color for dialog
    Color backgroundColor = Colors.white,

    /// Header Background Color for dialog
    Color headerBackgroundColor = Colors.white,

    /// Color of title
    Color titleColor = Colors.black,

    /// Color of text
    Color textColor = Colors.black,

    /// Barrier Color of dialog
    Color? barrierColor,

    /// Determines if cancel button is shown or not
    bool showCancelBtn = false,

    /// Determines if confirm button is shown or not
    bool showConfirmBtn = true,

    /// Dialog Border Radius
    double borderRadius = 15.0,

    /// Asset path of your Image file
    String? customAsset,

    /// Width of the dialog
    double? width,

    /// Determines how long the dialog stays open for before closing, [default] is null. When it is null, it won't auto close
    Duration? autoCloseDuration,

    /// Disable Back Button
    bool disableBackBtn = false,
  }) {
    Timer? timer;
    if (autoCloseDuration != null) {
      timer = Timer(autoCloseDuration, () {
        Navigator.of(context, rootNavigator: true).pop();
      });
    }

    final options = QuickAlertOptions(
      timer: timer,
      title: title,
      text: text,
      titleAlignment: titleAlignment,
      textAlignment: textAlignment,
      widget: widget,
      type: type,
      animType: animType,
      barrierDismissible: barrierDismissible,
      onConfirmBtnTap: onConfirmBtnTap,
      onCancelBtnTap: onCancelBtnTap,
      confirmBtnText: confirmBtnText,
      cancelBtnText: cancelBtnText,
      confirmBtnColor: confirmBtnColor,
      confirmBtnTextStyle: confirmBtnTextStyle,
      cancelBtnTextStyle: cancelBtnTextStyle,
      cancelButtonStyle: cancelButtonStyle,
      backgroundColor: backgroundColor,
      headerBackgroundColor: headerBackgroundColor,
      titleColor: titleColor,
      textColor: textColor,
      showCancelBtn: showCancelBtn,
      showConfirmBtn: showConfirmBtn,
      borderRadius: borderRadius,
      customAsset: customAsset,
      width: width,
    );

    Widget child = WillPopScope(
      onWillPop: () async {
        options.timer?.cancel();
        if (options.type == QuickAlertType.loading &&
            !disableBackBtn &&
            showCancelBtn) {
          if (options.onCancelBtnTap != null) {
            options.onCancelBtnTap!();
            return false;
          }
        }
        return !disableBackBtn;
      },
      child: AlertDialog(
        contentPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        content: QuickAlertContainer(
          options: options,
        ),
      ),
    );

    if (options.type != QuickAlertType.loading) {
      child = RawKeyboardListener(
        focusNode: FocusNode(),
        autofocus: true,
        onKey: (event) {
          if (event is RawKeyUpEvent &&
              event.logicalKey == LogicalKeyboardKey.enter) {
            options.timer?.cancel();
            options.onConfirmBtnTap != null
                ? options.onConfirmBtnTap!()
                : Navigator.pop(context);
          }
        },
        child: child,
      );
    }

    return showGeneralDialog(
      barrierColor: barrierColor ?? Colors.black.withOpacity(0.5),
      transitionBuilder: (context, anim1, __, widget) {
        switch (animType) {
          case QuickAlertAnimType.scale:
            return Animate.scale(child: child, animation: anim1);

          case QuickAlertAnimType.rotate:
            return Animate.rotate(child: child, animation: anim1);

          case QuickAlertAnimType.slideInDown:
            return Animate.slideInDown(child: child, animation: anim1);

          case QuickAlertAnimType.slideInUp:
            return Animate.slideInUp(child: child, animation: anim1);

          case QuickAlertAnimType.slideInLeft:
            return Animate.slideInLeft(child: child, animation: anim1);

          case QuickAlertAnimType.slideInRight:
            return Animate.slideInRight(child: child, animation: anim1);

          default:
            return child;
        }
      },
      transitionDuration: const Duration(milliseconds: 200),
      barrierDismissible:
          autoCloseDuration != null ? false : barrierDismissible,
      barrierLabel: '',
      context: context,
      pageBuilder: (context, _, __) => Container(),
    );
  }
}
