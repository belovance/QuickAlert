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

    /// Alert type [success, error, warning, confirm, info, loading, custom]
    required QuickAlertType type,

    /// content options
    required AlertContentOptions contentOptions,

    /// Animation type  [scale, rotate, slideInDown, slideInUp, slideInLeft, slideInRight]
    QuickAlertAnimType animType = QuickAlertAnimType.scale,

    /// Barrier dismissible
    bool barrierDismissible = true,

    /// Barrier Color of dialog
    Color? barrierColor,

    /// Width of the dialog
    double? width,

    /// timer for dismissing dialog (Ok button)
    Timer? timer,

    /// header options
    AlertHeaderOptions? headerOptions,

    /// title options
    AlertTitleOptions? titleOptions,

    /// button options
    AlertButtonOptions? buttonOptions,

    /// Background Color for dialog
    Color backgroundColor = Colors.white,

    /// Dialog Border Radius
    double borderRadius = 10.0,

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
      headerOptions: headerOptions ?? AlertHeaderOptions(),
      alertTitleOptions: titleOptions ?? AlertTitleOptions(),
      contentOptions: contentOptions,
      buttonOptions: buttonOptions ??
          AlertButtonOptions(
            cancelButton: AlertButton(
              type: AlertButtonType.cancel,
              text: "Cancel",
              color: Colors.grey,
            ),
          ),
      type: type,
      animType: animType,
      barrierDismissible: barrierDismissible,
      backgroundColor: backgroundColor,
      borderRadius: borderRadius,
      width: width,
    );

    Widget child = PopScope(
      onPopInvokedWithResult: (didPop, result) async {
        options.timer?.cancel();
        if (options.type == QuickAlertType.loading && !disableBackBtn) {
          if (options.buttonOptions?.cancelButton?.onTap != null) {
            options.buttonOptions?.cancelButton?.onTap!();
          }
        }
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
      child = KeyboardListener(
        focusNode: FocusNode(),
        autofocus: true,
        onKeyEvent: (event) {
          if (event is KeyUpEvent &&
              event.logicalKey == LogicalKeyboardKey.enter) {
            options.timer?.cancel();

            if (options.buttonOptions?.confirmButton?.onTap != null) {
              options.buttonOptions?.confirmButton?.onTap!();
            } else {
              Navigator.pop(context);
            }
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
