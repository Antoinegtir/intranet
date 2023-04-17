import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intra/js/export.dart';
import 'package:intra/theme/color.dart';
import 'package:intra/utils/enum.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// [SampleMenu], [Widget] that return a [PopupMenuButton] with all the [MenuOptions]
/// [controller], [Future<WebViewController>] necessary in order to launch correct url with good cookie.
/// [key], [Key] necessary in order to have a correct [Widget] tree.
/// [onShowUserAgent], [Function] that return a [AlertDialog] with the [WebViewController] user agent.
/// [onListCookies], [Function] that return a [AlertDialog] with the [WebViewController] cookies.
/// [onClearCookies], [Function] that return a [AlertDialog] with the [WebViewController] cookies.
/// [onAddToCache], [Function] that return a [AlertDialog] with the [WebViewController] cache.
/// [onListCache], [Function] that return a [AlertDialog] with the [WebViewController] cache.
/// [onClearCache], [Function] that return a [AlertDialog] with the [WebViewController] cache.

class SampleMenu extends StatelessWidget {
  /// [build], [Widget] function that return a [PopupMenuButton] with all the [MenuOptions]
  /// [controller], [Future<WebViewController>] necessary in order to launch correct url with good cookie.
  /// [key], [Key] necessary in order to have a correct [Widget] tree.

  final Future<WebViewController> controller;
  const SampleMenu(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WebViewController>(
      future: controller,
      builder:
          (BuildContext context, AsyncSnapshot<WebViewController> controller) {
        return PopupMenuButton<MenuOptions>(
          icon: const Icon(
            Iconsax.menu,
            color: IntraColor.white,
          ),
          color: IntraColor.black,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          onSelected: (MenuOptions value) {
            switch (value) {
              case MenuOptions.showUserAgent:
                onShowUserAgent(controller.data!, context);
                break;
              case MenuOptions.listCookies:
                onListCookies(controller.data!, context);
                break;
              case MenuOptions.clearCookies:
                onClearCookies(context);
                break;
              case MenuOptions.addToCache:
                onAddToCache(controller.data!, context);
                break;
              case MenuOptions.listCache:
                onListCache(controller.data!, context);
                break;
              case MenuOptions.clearCache:
                onClearCache(controller.data!, context);
                break;
            }
          },
          itemBuilder: (BuildContext context) => <PopupMenuItem<MenuOptions>>[
            PopupMenuItem<MenuOptions>(
              value: MenuOptions.showUserAgent,
              enabled: controller.hasData,
              child: const Text(
                'Show user agent',
                style: TextStyle(color: IntraColor.white),
              ),
            ),
            const PopupMenuItem<MenuOptions>(
              value: MenuOptions.listCookies,
              child: Text(
                'List cookies',
                style: TextStyle(color: IntraColor.white),
              ),
            ),
            const PopupMenuItem<MenuOptions>(
              value: MenuOptions.clearCookies,
              child: Text(
                'Clear cookies',
                style: TextStyle(color: IntraColor.white),
              ),
            ),
            const PopupMenuItem<MenuOptions>(
              value: MenuOptions.addToCache,
              child: Text(
                'Add to cache',
                style: TextStyle(color: IntraColor.white),
              ),
            ),
            const PopupMenuItem<MenuOptions>(
              value: MenuOptions.listCache,
              child: Text(
                'List cache',
                style: TextStyle(color: IntraColor.white),
              ),
            ),
            const PopupMenuItem<MenuOptions>(
              value: MenuOptions.clearCache,
              child: Text(
                'Clear cache',
                style: TextStyle(color: IntraColor.white),
              ),
            ),
          ],
        );
      },
    );
  }
}
