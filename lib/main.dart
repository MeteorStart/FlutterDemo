import 'package:flutter/material.dart';
import 'package:flutter_app/home.dart';
import 'package:flutter_app/pages/weidget_study/ButtonStudy.dart';
import 'package:flutter_app/pages/weidget_study/TextStudy.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Tutorial",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        "/": (BuildContext context) => HomePage(),
        "/text": (BuildContext context) => TextStudy(),
        "/button": (BuildContext context) => ButtonStudy(),
      },
      initialRoute: "/",
    );
  }
}
