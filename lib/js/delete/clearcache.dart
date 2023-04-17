// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:intra/theme/color.dart';
import 'package:intra/theme/text.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// [onClearCache], [Future] function that clear cache with [controller] as parameter.

void onClearCache(WebViewController controller, BuildContext context) async {
  await controller.clearCache();
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40), topRight: Radius.circular(40))),
    backgroundColor: IntraColor.white,
    content: Container(
        alignment: Alignment.center,
        height: 30,
        child:  Text(
          'Cache cleared',
          style: textStyle,
        )),
  ));
}
