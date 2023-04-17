import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intra/theme/text.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// [LeadingControls], [Widget] function that return a personnalize button for [AppBar] icons.
/// [_webViewControllerFuture], [Future<WebViewController>] necessary in order to launch correct url with good cookie.
/// [key], [Key] necessary in order to have a correct [Widget] tree.

class LeadingControls extends StatefulWidget {
  final Future<WebViewController> _webViewControllerFuture;
  const LeadingControls(this._webViewControllerFuture, {super.key});

  @override
  State<LeadingControls> createState() => _LeadingControlsState();
}

class _LeadingControlsState extends State<LeadingControls> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WebViewController>(
      future: widget._webViewControllerFuture,
      builder:
          (BuildContext context, AsyncSnapshot<WebViewController> snapshot) {
        final bool webViewReady =
            snapshot.connectionState == ConnectionState.done;
        final WebViewController controller = snapshot.data!;
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              icon: const Icon(
                Iconsax.arrow_left,
                color: Colors.white,
              ),
              onPressed: !webViewReady
                  ? null
                  : () async {
                      if (await controller.canGoBack()) {
                        await controller.goBack();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40),
                                  topRight: Radius.circular(40))),
                          backgroundColor: Colors.white,
                          content: Container(
                              alignment: Alignment.center,
                              height: 30,
                              child: Text(
                                'No back history item',
                                style: textStyle,
                              )),
                        ));
                        return;
                      }
                    },
            ),
            IconButton(
              icon: const Icon(
                Iconsax.arrow_right_1,
                color: Colors.white,
              ),
              onPressed: !webViewReady
                  ? null
                  : () async {
                      if (await controller.canGoForward()) {
                        await controller.goForward();
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(40),
                                  topRight: Radius.circular(40))),
                          backgroundColor: Colors.white,
                          content: Container(
                              alignment: Alignment.center,
                              height: 30,
                              child: Text(
                                'No forward history item',
                                style: textStyle,
                              )),
                        ));
                        return;
                      }
                    },
            ),
          ],
        );
      },
    );
  }
}
