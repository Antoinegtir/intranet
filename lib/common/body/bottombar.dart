import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intra/theme/color.dart';
import 'package:intra/widget/icon.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// [BottomBar], [Widget] that return a [BottomNavigationBar] with [BottomNavigationBarItem] and [icon] function.
/// [icon], [Widget] function that return a personnalize button for [BottomBar] icons.

class BottomBar extends StatelessWidget {
  /// [build], [Widget] function that return a [Container] with [Row] and [icon] function.
  /// [WebViewController], [WebViewController] necessary in order to launch correct url with good cookie.
  /// [_webViewControllerFuture], [WebViewController] necessary in order to launch correct url with good cookie.

  final Future<WebViewController> _webViewControllerFuture;
  const BottomBar(this._webViewControllerFuture, {super.key});

  @override
  Widget build(BuildContext context) {
    Widget split = Container(
      width: 40,
    );
    return FutureBuilder<WebViewController>(
      future: _webViewControllerFuture,
      builder:
          (BuildContext context, AsyncSnapshot<WebViewController> snapshot) {
        final WebViewController controller = snapshot.data!;
        return Container(
            decoration: const BoxDecoration(
                color: IntraColor.epiblue,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40))),
            height: 80,
            child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(width: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      icon("https://intra.epitech.eu/module/#", Iconsax.note,
                          controller),
                      split,
                      icon("https://intra.epitech.eu/planning/#/",
                          Iconsax.calendar, controller),
                      split,
                      icon("https://intra.epitech.eu/e-learning/#!",
                          Iconsax.video_play, controller),
                      split,
                      icon("https://intra.epitech.eu/admin/", Iconsax.setting_2,
                          controller),
                      Container(
                        width: 30,
                      ),
                      icon("https://intra.epitech.eu/user/#!/netsoul",
                          Iconsax.user, controller),
                      Container(
                        width: 22,
                      )
                    ],
                  )
                ])));
      },
    );
  }
}
