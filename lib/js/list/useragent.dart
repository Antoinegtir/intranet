// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// [onShowUserAgent], [Future] function that show user agent with [controller] as parameter.

void onShowUserAgent(WebViewController controller, BuildContext context) async {
  await controller.evaluateJavascript(
      'Toaster.postMessage("User Agent: " + navigator.userAgent);');
}
