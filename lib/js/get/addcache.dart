// ignore_for_file: use_build_context_synchronously, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:intra/theme/text.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// [onAddToCache], [Future] function that add a test entry to cache with [controller] as parameter.

void onAddToCache(WebViewController controller, BuildContext context) async {
  await controller.evaluateJavascript(
      'caches.open("test_caches_entry"); localStorage["test_localStorage"] = "dummy_entry";');
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40), topRight: Radius.circular(40))),
    backgroundColor: Colors.white,
    content: Container(
        alignment: Alignment.center,
        height: 30,
        child: Text('Added a test entry to cache.', style: textStyle)),
  ));
}
