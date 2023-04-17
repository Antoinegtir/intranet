import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:intra/theme/color.dart';
import 'package:intra/utils/url.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// [icon], [Widget] function that return a personnalize button for [BottomBar] icons.

/// [url], [String] necessary in order to launch other page and navigate from [BottomBar]
/// [iconsax], [IconData] necessary in order to have a personalize icon.
/// [controller], [WebViewController] necessary in order to launch correct url with good cookie.

Widget icon(String url, IconData iconsax, WebViewController controller) {
  return BouncingWidget(
      scaleFactor: 2,
      onPressed: () {
        loadUrl(url, controller);
      },
      child: Icon(
        iconsax,
        color: IntraColor.white,
        size: 30,
      ));
}
