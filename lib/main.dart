import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'HomePage.dart';

void main() {
  if (defaultTargetPlatform != TargetPlatform.android ||
      defaultTargetPlatform != TargetPlatform.iOS) {
    /// For desktop apps only
    debugDefaultTargetPlatformOverride = TargetPlatform.fuchsia;
  }


  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
