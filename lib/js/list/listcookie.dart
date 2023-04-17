// ignore_for_file: use_build_context_synchronously, deprecated_member_use

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:intra/js/get/getcookie.dart';

/// [onListCookies], [Future] function that list cookies with [controller] as parameter.

void onListCookies(WebViewController controller, BuildContext context) async {
  final String cookies = await controller.evaluateJavascript('document.cookie');
  if (kDebugMode) {
    print(cookies);
  }
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40))),
      backgroundColor: Colors.white,
      content: Container(
        alignment: Alignment.center,
        height: 600,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Text(
              'Cookies:',
              style: TextStyle(color: Colors.black),
            ),
            getCookieList(cookies),
          ],
        ),
      )));
}
