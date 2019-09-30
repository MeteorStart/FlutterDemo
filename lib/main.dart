import 'package:flutter/material.dart';

import 'package:flutter_app/home.dart';
import 'package:flutter_app/pages/widget_study/ButtonStudy.dart';
import 'package:flutter_app/pages/widget_study/ImageStudy.dart';
import 'package:flutter_app/pages/widget_study/TextStudy.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Tutorial",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      routes: {
        "/": (BuildContext context) => HomePage(),
        "/text": (BuildContext context) => TextStudy(),
        "/button": (BuildContext context) => ButtonStudy(),
        "/image": (BuildContext context) => ImageStudy(),
      },
      initialRoute: "/",
    );
  }
}
