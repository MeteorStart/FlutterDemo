import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text("基础控件学习"),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new RaisedButton(
              onPressed: _onTextPressed,
              child: new Text("跳转到TextStudy页面"),
            ),
            new RaisedButton(
              onPressed: _onButtonPressed,
              child: new Text("跳转到ButtonStudy页面"),
            ),
            new RaisedButton(
              onPressed: _onImagePressed,
              child: new Text("跳转到ImageStudy页面"),
            ),
            new RaisedButton(
              onPressed: _onNativePressed,
              child: new Text("跳转到NativeStudy页面"),
            ),
            new RaisedButton(
              onPressed: _onBluePressed,
              child: new Text("跳转到BlueStudy页面"),
            ),
          ],
        ),
      ),
    );
  }

  /// Text控件学习
  _onTextPressed() {
    setState(() {
      Navigator.of(context).pushNamed("/text");
    });
  }

  /// Button控件学习
  _onButtonPressed() {
    setState(() {
      Navigator.of(context).pushNamed("/button");
    });
  }

  /// Button控件学习
  _onImagePressed() {
    setState(() {
      Navigator.of(context).pushNamed("/image");
    });
  }

  /// Button控件学习
  _onNativePressed() {
    setState(() {
      Navigator.of(context).pushNamed("/native");
    });
  }

  /// Button控件学习
  _onBluePressed() {
    setState(() {
      Navigator.of(context).pushNamed("/blue");
    });
  }
}
