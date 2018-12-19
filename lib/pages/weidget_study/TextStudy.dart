import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_app/iconfont.dart';

class TextStudy extends StatelessWidget {
  MyGestureRecognizer myGestureRecognizer = new MyGestureRecognizer();

  _clickLink() {
    print("点击了链接");
    Fluttertoast.showToast(
        msg: "试试就试试",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text的基本用法"),
      ),
      body: Padding(
          padding: EdgeInsets.all(15.0),
          child: Center(
            child: Column(
              children: <Widget>[
                new Text(
                  '字号20',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                new Text(
                  '红色字体',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
                new Text(
                  "字体加粗",
                  textAlign: TextAlign.center, //文字居中显示
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                new Text(
                  '斜体',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
                new Text(
                  '顶部线',
                  style: TextStyle(
                    decoration: TextDecoration.overline,
                  ),
                ),
                new Text(
                  '下划线',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
                new Text(
                  '删除线',
                  style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                    decorationColor: Colors.red,
                  ),
                ),
                new Text(
                  '删除线 + 下划线',
                  style: TextStyle(
                      decorationStyle: TextDecorationStyle.wavy,
                      decoration: TextDecoration.combine(new List()
                        ..add(TextDecoration.underline)..add(
                            TextDecoration.lineThrough))),
                ),
                new Text(
                  "超过一行显示省略号,例如：Text用于显示简单样式文本，它包含一些控制文本显示样式的一些属性，一个简单的例子如下：",
                  style: TextStyle(
                      fontSize: 18,
                      foreground: Paint()
                        ..color = Colors.cyan,
                      shadows: new List()
                        ..add(Shadow(
                            color: Colors.grey,
                            offset: Offset(4.0, 4.0),
                            blurRadius: 2.0))),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
                new Text.rich(TextSpan(text: "尝试使用", children: <TextSpan>[
                  TextSpan(
                      text: '点我一下试试',
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.blue,
                        fontStyle: FontStyle.italic,
                      ),
                      recognizer: myGestureRecognizer
                        ..onTap = () {
                          _clickLink();
                        })
                ])),
                new Text(
                  "外部字体",
                  style: new TextStyle(
                    fontFamily: '蝉羽丘陵仙侠',
                    color: Colors.green,
                    fontSize: 24,
                  ),
                ),
                new Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new Text("文字图标："),
                    new Icon(MyIconFont.tiaoshi)
                  ],
                )
              ],
            ),
          )),
    );
  }
}

class MyGestureRecognizer extends TapGestureRecognizer {}
