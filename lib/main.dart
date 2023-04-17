import 'package:flutter/material.dart';
import 'package:intra/ui/home.dart';

/// [main] main function that run intranet app
void main() => runApp(const MyApp());

/// [MyApp] main class endpoint of intranet app

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  /// [HomePage] root of application

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: const Scaffold(
          extendBodyBehindAppBar: true,
          body: HomePage(),
        ));
  }
}
