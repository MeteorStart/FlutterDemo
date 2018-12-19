import 'package:flutter/material.dart';

class ButtonStudy extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ButtonState();
  }
}

class _ButtonState extends State<ButtonStudy> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("ButtonStudy"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              new RaisedButton(
                child: Text("RaisedButton"),
                onPressed: () => {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
