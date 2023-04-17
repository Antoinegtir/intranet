// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:intra/theme/color.dart';
import 'package:intra/theme/text.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// [onClearCookies], [Future] function that clear cookies with [controller] as parameter.

void onClearCookies(BuildContext context) async {
  final CookieManager cookieManager = CookieManager();
  final bool hadCookies = await cookieManager.clearCookies();

  String message = 'There were cookies. Now, they are gone!';
  if (!hadCookies) {
    message = 'There are no cookies.';
  }
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40), topRight: Radius.circular(40))),
    backgroundColor: IntraColor.white,
    content: Container(
        alignment: Alignment.center,
        height: 30,
        child: Text(message, style: textStyle)),
  ));
}
