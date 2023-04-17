import 'package:webview_flutter/webview_flutter.dart';

/// [loadUrl], [Future] function that load [url] with [controller] as parameter recursively.

/// [url], [String] necessary in order to load url
/// [controller], [WebViewController] controller in order to load [url] with cookie

void loadUrl(String url, WebViewController controller) async {
  await controller.loadUrl(url);
}
