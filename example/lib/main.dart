import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_options.dart';
import 'package:quickalert/quickalert.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QuickAlert Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final successAlert = buildButton(
      onTap: () {
        QuickAlert.show(
          context: context,
          type: QuickAlertType.success,
          contentOptions: AlertContentOptions(
            text: 'Transaction Completed Successfully!',
          ),
          autoCloseDuration: const Duration(seconds: 2),
        );
      },
      title: 'Success',
      text: 'Transaction Completed Successfully!',
      leadingImage: 'assets/success.gif',
    );

    final errorAlert = buildButton(
      onTap: () {
        QuickAlert.show(
          context: context,
          type: QuickAlertType.error,
          titleOptions:
              AlertTitleOptions(title: 'Oops...', color: Colors.white),
          contentOptions: AlertContentOptions(
            text: 'Sorry, something went wrong',
            color: Colors.white,
          ),
          backgroundColor: Colors.black,
        );
      },
      title: 'Error',
      text: 'Sorry, something went wrong',
      leadingImage: 'assets/error.gif',
    );

    final warningAlert = buildButton(
      onTap: () {
        QuickAlert.show(
          context: context,
          type: QuickAlertType.warning,
          contentOptions: AlertContentOptions(
            text: 'You just broke protocol',
          ),
        );
      },
      title: 'Warning',
      text: 'You just broke protocol',
      leadingImage: 'assets/warning.gif',
    );

    final infoAlert = buildButton(
      onTap: () {
        QuickAlert.show(
          context: context,
          type: QuickAlertType.info,
          contentOptions: AlertContentOptions(
            text: 'Buy two, get one free',
          ),
        );
      },
      title: 'Info',
      text: 'Buy two, get one free',
      leadingImage: 'assets/info.gif',
    );

    final confirmAlert = buildButton(
      onTap: () {
        QuickAlert.show(
          context: context,
          type: QuickAlertType.confirm,
          contentOptions: AlertContentOptions(
            text: 'Do you want to logout',
            alignment: TextAlign.right,
            color: Colors.white,
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          ),
          titleOptions: AlertTitleOptions(
              title: "title", alignment: TextAlign.right, color: Colors.white),
          headerOptions: AlertHeaderOptions(
            backgroundColor: Colors.grey,
          ),
          buttonOptions: AlertButtonOptions(
            direction: Axis.horizontal,
            confirmButton: AlertButton(
              type: AlertButtonType.confirm,
              text: "Yes",
              height: 40,
              width: 100,
              color: Colors.white,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              backgroundColor: Colors.yellow,
            ),
            cancelButton: AlertButton(
                height: 40,
                width: 200,
                type: AlertButtonType.cancel,
                text: "No",
                onTap: () {
                  Navigator.pop(context);
                }),
          ),
          backgroundColor: Colors.black,
          barrierColor: Colors.white,
        );
      },
      title: 'Confirm',
      text: 'Do you want to logout',
      leadingImage: 'assets/confirm.gif',
    );

    final loadingAlert = buildButton(
      onTap: () {
        QuickAlert.show(
          context: context,
          type: QuickAlertType.loading,
          titleOptions: AlertTitleOptions(
            title: 'Loading',
          ),
          contentOptions: AlertContentOptions(
            text: 'Fetching your data',
          ),
        );
      },
      title: 'Loading',
      text: 'Fetching your data',
      leadingImage: 'assets/loading.gif',
    );

    final customAlert = buildButton(
      onTap: () {
        var message = '';
        QuickAlert.show(
          context: context,
          type: QuickAlertType.custom,
          barrierDismissible: true,
          contentOptions: AlertContentOptions(
            content: TextFormField(
              decoration: const InputDecoration(
                alignLabelWithHint: true,
                hintText: 'Enter Phone Number',
                prefixIcon: Icon(
                  Icons.phone_outlined,
                ),
              ),
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.phone,
              onChanged: (value) => message = value,
            ),
          ),
          headerOptions: AlertHeaderOptions(
            header: Container(
              decoration: const BoxDecoration(color: Colors.white), // 设置装饰
              width: double.infinity,
              height: 100,
              clipBehavior: Clip.antiAlias,
              child: Image.asset('assets/custom.gif',
                  fit: BoxFit.cover, width: double.infinity),
            ),
          ),
          buttonOptions: AlertButtonOptions(
            confirmButton: AlertButton(
              text: 'Save',
              type: AlertButtonType.confirm,
              onTap: () async {
                if (message.length < 5) {
                  await QuickAlert.show(
                    context: context,
                    type: QuickAlertType.error,
                    contentOptions: AlertContentOptions(
                      text: 'Please input something',
                    ),
                  );
                  return;
                }
                Navigator.pop(context);
                if (mounted) {
                  QuickAlert.show(
                    context: context,
                    type: QuickAlertType.success,
                    contentOptions: AlertContentOptions(
                      text: "Phone number '$message' has been saved!.",
                    ),
                  );
                }
              },
            ),
          ),
        );
      },
      title: 'Custom',
      text: 'Custom Widget Alert',
      leadingImage: 'assets/custom.gif',
    );

    /**
     * set a custom header widget
     * set confirm button radius
     */
    const borderRadius = 20.0;
    final customHeaderConfirm = buildButton(
      onTap: () {
        QuickAlert.show(
          context: context,
          type: QuickAlertType.confirm,
          headerOptions: AlertHeaderOptions(
            backgroundColor: Colors.grey,
            header: Container(
              height: 100,
              width: double.infinity,
              // margin: const EdgeInsets.symmetric(horizontal: 2),
              decoration: const BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(borderRadius), // 左上角圆角
                  topRight: Radius.circular(borderRadius), // 右上角圆角
                ),
              ),
              child: TextButton(
                onPressed: () {},
                child: const Text('this is a custom header ',
                    style: TextStyle(color: Colors.black, fontSize: 18)),
              ),
            ),
          ),
          titleOptions: AlertTitleOptions(
              alignment: TextAlign.right, color: Colors.white),
          contentOptions: AlertContentOptions(
            text: 'Do you want to logout',
            alignment: TextAlign.center,
            color: Colors.white,
          ),
          buttonOptions: AlertButtonOptions(
            direction: Axis.horizontal,
            confirmButton: AlertButton(
              type: AlertButtonType.confirm,
              text: "Yes",
              color: Colors.white,
              radius: 6,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            cancelButton: AlertButton(
              type: AlertButtonType.cancel,
              text: "No",
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ),
          backgroundColor: Colors.black,
          borderRadius: borderRadius,
          barrierColor: Colors.white,
        );
      },
      title: 'Custom header',
      text: 'Do you want to logout',
      leadingImage: 'assets/confirm.gif',
    );

    final confirmButtonsVertical = buildButton(
      onTap: () {
        QuickAlert.show(
          context: context,
          type: QuickAlertType.confirm,
          contentOptions: AlertContentOptions(
            text: 'Do you want to logout',
            alignment: TextAlign.right,
            color: Colors.white,
          ),
          titleOptions: AlertTitleOptions(
              alignment: TextAlign.right, color: Colors.white),
          headerOptions: AlertHeaderOptions(
            backgroundColor: Colors.grey,
          ),
          buttonOptions: AlertButtonOptions(
            direction: Axis.vertical,
            confirmButton: AlertButton(
              type: AlertButtonType.confirm,
              text: "Yes",
              color: Colors.white,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            cancelButton: AlertButton(
                type: AlertButtonType.cancel,
                text: "No",
                onTap: () {
                  Navigator.pop(context);
                }),
          ),
          backgroundColor: Colors.black,
          barrierColor: Colors.white,
        );
      },
      title: 'Confirm buttons vertical',
      text: 'Do you want to logout',
      leadingImage: 'assets/confirm.gif',
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          "QuickAlert Demo",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 20),
          successAlert,
          const SizedBox(height: 20),
          errorAlert,
          const SizedBox(height: 20),
          warningAlert,
          const SizedBox(height: 20),
          infoAlert,
          const SizedBox(height: 20),
          confirmAlert,
          const SizedBox(height: 20),
          loadingAlert,
          const SizedBox(height: 20),
          customAlert,
          const SizedBox(height: 20),
          customHeaderConfirm,
          const SizedBox(height: 20),
          confirmButtonsVertical,
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Card buildButton({
    required onTap,
    required title,
    required text,
    required leadingImage,
  }) {
    return Card(
      shape: const StadiumBorder(),
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      clipBehavior: Clip.antiAlias,
      elevation: 1,
      child: ListTile(
        onTap: onTap,
        leading: CircleAvatar(
          backgroundImage: AssetImage(
            leadingImage,
          ),
        ),
        title: Text(title ?? ""),
        subtitle: Text(text ?? ""),
        trailing: const Icon(
          Icons.keyboard_arrow_right_rounded,
        ),
      ),
    );
  }
}
