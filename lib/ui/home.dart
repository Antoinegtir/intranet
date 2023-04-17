import 'package:flutter/material.dart';
import 'package:intra/constant/website.dart';
import 'package:intra/ui/webview.dart';

/// [HomePage], root of the main function that launch [WebViews]

class HomePage extends StatelessWidget {
  const HomePage({super.key});

/// [build], [Widget] function that return a [MaterialApp] with [Scaffold] and [WebViews]
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),  
        debugShowCheckedModeBanner: false,
        home: const Scaffold(
            extendBodyBehindAppBar: true,
            body: WebViews(
              url: website,
            )));
  }
}
