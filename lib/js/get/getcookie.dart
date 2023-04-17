import 'package:flutter/material.dart';

/// [getCookieList], [Widget] function that return [Widget] with [cookies] as parameter.
/// [cookies], [String] necessary in order to return [Widget] with cookies

Widget getCookieList(String cookies) {
  if (cookies == '""') {
    return Container();
  }
  final List<String> cookieList = cookies.split(';');
  final Iterable<Text> cookieWidgets =
      cookieList.map((String cookie) => Text(cookie));
  return Column(
    mainAxisAlignment: MainAxisAlignment.end,
    mainAxisSize: MainAxisSize.min,
    children: cookieWidgets.toList(),
  );
}
