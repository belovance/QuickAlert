import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_options.dart';
import 'package:quickalert/models/quickalert_type.dart';

class QuickAlertButtons extends StatelessWidget {
  final QuickAlertOptions options;

  const QuickAlertButtons({
    Key? key,
    required this.options,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top:
              (!options.showCancelBtn! && !options.showConfirmBtn!) ? 0 : 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          cancelBtn(context),
          options.type != QuickAlertType.loading
              ? okayBtn(context)
              : const SizedBox.shrink(),
        ],
      ),
    );
  }

  Widget okayBtn(context) {
    if (!options.showConfirmBtn!) {
      return const SizedBox();
    }
    final showCancelBtn =
        options.type == QuickAlertType.confirm ? true : options.showCancelBtn!;

    final okayBtn = buildButton(
        context: context,
        isOkayBtn: true,
        text: options.confirmBtnText!,
        onTap: () {
          options.timer?.cancel();
          options.onConfirmBtnTap != null
              ? options.onConfirmBtnTap!()
              : Navigator.pop(context);
        });

    if (showCancelBtn) {
      return Expanded(child: okayBtn);
    } else {
      return okayBtn;
    }
  }

  Widget cancelBtn(context) {
    final showCancelBtn =
        options.type == QuickAlertType.confirm ? true : options.showCancelBtn!;

    final cancelBtn = buildButton(
        context: context,
        isOkayBtn: false,
        text: options.cancelBtnText!,
        onTap: () {
          options.timer?.cancel();
          options.onCancelBtnTap != null
              ? options.onCancelBtnTap!()
              : Navigator.pop(context);
        });

    if (showCancelBtn) {
      return Expanded(child: cancelBtn);
    } else {
      return const SizedBox();
    }
  }

  Widget buildButton({
    BuildContext? context,
    required bool isOkayBtn,
    required String text,
    VoidCallback? onTap,
  }) {
    final btnText = Text(
      text,
      style: defaultTextStyle(isOkayBtn),
    );

    final okayBtn = MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: options.confirmBtnColor ?? Theme.of(context!).primaryColor,
      onPressed: onTap,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(7.5),
          child: btnText,
        ),
      ),
    );

    final cancelBtn = GestureDetector(
      onTap: onTap,
      child: Center(
        child: btnText,
      ),
    );

    return isOkayBtn ? okayBtn : cancelBtn;
  }

  TextStyle defaultTextStyle(bool isOkayBtn) {
    final textStyle = TextStyle(
      color: isOkayBtn ? Colors.white : Colors.grey,
      fontWeight: FontWeight.w600,
      fontSize: 18.0,
    );

    if (isOkayBtn) {
      return options.confirmBtnTextStyle ?? textStyle;
    } else {
      return options.cancelBtnTextStyle ?? textStyle;
    }
  }
}
