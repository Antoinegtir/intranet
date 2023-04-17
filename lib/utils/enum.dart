import 'package:intra/ui/webview.dart';

/// [MenuOptions], function that enum all action possible in [WebViews]

/// [showUserAgent] allow to show navigator information
/// [listCookies] allow to list all cookies
/// [clearCookies] allow to clear all cookies
/// [addToCache] allow to add a new cache
/// [listCache] allow to list all cache
/// [clearCache] allow to clear all cache

enum MenuOptions {
  showUserAgent,
  listCookies,
  clearCookies,
  addToCache,
  listCache,
  clearCache,
}
