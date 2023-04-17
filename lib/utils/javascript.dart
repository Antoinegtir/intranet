import 'package:flutter/material.dart';
import 'package:intra/theme/color.dart';
import 'package:intra/theme/text.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// [toasterJavascriptChannel], function that return [JavascriptChannel] allow to print message in [SnackBar]

/// [context], [BuildContext] necessary in order to show [SnackBar]
/// [JavascriptChannel], [JavascriptChannel] that allow to print message in [SnackBar]
/// [JavascriptMessage], [JavascriptMessage] that contain the message to print in [SnackBar]
/// [ScaffoldMessenger], [ScaffoldMessenger] that allow to show [SnackBar]
/// [SnackBar], [SnackBar] that allow to print message in [SnackBar]

JavascriptChannel toasterJavascriptChannel(BuildContext context) {
  return JavascriptChannel(
      name: 'Toaster',
      onMessageReceived: (JavascriptMessage message) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40))),
          backgroundColor: IntraColor.white,
          content: Container(
              alignment: Alignment.center,
              height: 30,
              child: Text(message.message, style: textStyle)),
        ));
      });
}
