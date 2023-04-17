// ignore_for_file: deprecated_member_use, library_private_types_in_public_api
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intra/html/export.dart';
import 'package:intra/theme/color.dart';
import 'package:intra/utils/javascript.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:intra/common/export.dart';

/// [WebViews] is the main widget of the webview page.

class WebViews extends StatefulWidget {
  /// [url] is the url of the page that will be loaded.
  /// [key] is the key of the [WebViews] widget.
  /// [WebViews] is the main widget of the webview page.

  final String url;
  const WebViews({Key? key, required this.url}) : super(key: key);

  @override
  _WebViewsState createState() => _WebViewsState();
}

/// [_WebViewsState] is the state of the [WebViews] widget.
/// [_controller] is the [Completer] that will be used to get the [WebViewController] of the [WebView].
/// [_webViewController] is the [WebViewController] that will be used to get the [WebView].

class _WebViewsState extends State<WebViews> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  late WebViewController _webViewController;

  /// [_WebViewsState] is the state of the [WebViews] widget.
  /// [_controller] is the [Completer] that will be used to get the [WebViewController] of the [WebView].
  /// [_webViewController] is the [WebViewController] that will be used to get the [WebView].

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: IntraColor.epiblue,
      extendBody: true,
      drawer: const SidebarMenu(),
      bottomNavigationBar: BottomBar(_controller.future),
      appBar: AppBar(
        elevation: 0,
        title: Image.asset(
          "assets/images/logo.png",
          height: 30,
        ),
        leading: LeadingControls(_controller.future),
        actions: [
          ActionControls(_controller.future),
          SampleMenu(_controller.future),
        ],
        backgroundColor: IntraColor.epiblue,
        centerTitle: true,
      ),
      body: Builder(builder: (BuildContext context) {
        return Stack(
          children: [
            WebView(
              initialUrl: widget.url.toString(),
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (WebViewController webViewController) {
                _controller.complete(webViewController);
                _webViewController = webViewController;
              },
              onProgress: (int progress) {
                if (kDebugMode) {
                  print("WebView is loading (progress : $progress%)");
                }
              },
              javascriptChannels: <JavascriptChannel>{
                toasterJavascriptChannel(context),
              },
              navigationDelegate: (NavigationRequest request) {
                if (kDebugMode) {
                  print('allowing navigation to $request');
                }
                return NavigationDecision.navigate;
              },
              onPageStarted: (String url) {
                if (kDebugMode) {
                  print('Page started loading: $url');
                }
              },
              onPageFinished: (String url) {
                if (kDebugMode) {
                  print('Page finished loading: $url');
                }
                _webViewController.evaluateJavascript(hideHeaderWrapper);
                _webViewController.evaluateJavascript(hideSidebarWrapper);
              },
              gestureNavigationEnabled: true,
            ),
          ],
        );
      }),
    );
  }
}
