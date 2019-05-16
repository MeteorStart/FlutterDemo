import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ButtonStudy extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ButtonState();
  }
}

class _ButtonState extends State<ButtonStudy> {
  bool a = false;
  Color _color = Colors.grey;
  int number = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("ButtonStudy"),
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Stack(
          children: <Widget>[
            Center(
              child: Column(
                children: <Widget>[
                  //漂浮按钮，它默认带有阴影和灰色背景。按下后，阴影会变大
                  RaisedButton(
                    child: Text("RaisedButton"),
                    onPressed: () => _buttonClick("RaisedButton被点击了！"),
                  ),
                  //FlatButton即扁平按钮，默认背景透明并不带阴影。按下后，会有背景色
                  FlatButton(
                    child: Text("FlatButton"),
                    color: Colors.blue,
                    highlightColor: Colors.blue[700],
                    colorBrightness: Brightness.dark,
                    splashColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    padding:
                        EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
                    onPressed: () => _buttonClick("FlatButton被点击了！"),
                  ),
                  //默认有一个边框，不带阴影且背景透明。按下后，边框颜色会变亮、同时出现背景和阴影(较弱)
                  OutlineButton(
                    child: Text("OutlineButton"),
                    onPressed: () => _buttonClick("OutlineButton被点击了！"),
                  ),
                  //IconButton是一个可点击的Icon，不包括文字，默认没有背景，点击后会出现背景
                  IconButton(
                      icon: Icon(
                        Icons.thumb_up,
                        color: _color,
                      ),
                      onPressed: () => _buttonClick("IconButton被点击了！")),
                  //Material样式的按钮,跟漂浮按钮类似
                  MaterialButton(
                    child: Text(
                      "MaterialButton",
                      style: TextStyle(fontSize: 16.0, color: Colors.white),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    elevation: 5.0,
                    minWidth: 200.0,
                    height: 35,
                    color: Color(0xFF801E48),
                    onPressed: () => _buttonClick("MaterialButton被点击了！"),
                  ),
                  InkWell(
                    child: RaisedButton(
                      onPressed: null,
                      child: Text("InkWell"),
                    ),
                    onLongPress: () => _buttonClick("InkWell被点击了！"),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 1,
              bottom: 1,
              child: FloatingActionButton(
                child: Text(number.toString()),
                onPressed: () => _fabClick(),
              ),
            )
          ],
        ),
      ),
    );
  }

  _buttonClick(String s) {
    Color iconColor;

    if (_color == Colors.red) {
      iconColor = Colors.grey;
    } else {
      iconColor = Colors.red;
    }

    setState(() {
      _color = iconColor;
    });

    Fluttertoast.showToast(
        msg: s,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white);
  }

  _fabClick() {
    setState(() {
      number++;
    });
  }
}
