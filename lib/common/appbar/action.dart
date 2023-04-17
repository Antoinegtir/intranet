import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// [ActionControls], [Widget] function that return a personnalize button for [BottomBar] icons.
/// [_webViewControllerFuture], [Future] necessary in order to launch correct url with good cookie.
/// [key], [Key] necessary in order to have a correct [Widget] tree.
/// [icon], [IconData] necessary in order to have a personalize icon.
/// [controller], [WebViewController] necessary in order to launch correct url with good cookie.

class ActionControls extends StatefulWidget {
  final Future<WebViewController> _webViewControllerFuture;
  const ActionControls(this._webViewControllerFuture, {super.key});

  @override
  State<ActionControls> createState() => _ActionControlsState();
}

class _ActionControlsState extends State<ActionControls> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WebViewController>(
      future: widget._webViewControllerFuture,
      builder:
          (BuildContext context, AsyncSnapshot<WebViewController> snapshot) {
        final bool webViewReady =
            snapshot.connectionState == ConnectionState.done;
        final WebViewController controller = snapshot.data!;
        return IconButton(
          icon: const Icon(
            Iconsax.refresh,
            color: Colors.white,
          ),
          onPressed: !webViewReady
              ? null
              : () {
                  controller.reload();
                },
        );
      },
    );
  }
}
