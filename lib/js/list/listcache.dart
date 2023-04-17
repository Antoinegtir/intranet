// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// [onListCache], [Future] function that list cache with [controller] as parameter.

void onListCache(WebViewController controller, BuildContext context) async {
  await controller.evaluateJavascript('caches.keys()'
      '.then((cacheKeys) => JSON.stringify({"cacheKeys" : cacheKeys, "localStorage" : localStorage}))'
      '.then((caches) => Toaster.postMessage(caches))');
}
