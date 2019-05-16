import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_app/iconfont.dart';

// ignore: must_be_immutable
class TextStudy extends StatelessWidget {
  MyGestureRecognizer myGestureRecognizer = new MyGestureRecognizer();

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
                Text(
                  '字号20',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                Text(
                  '红色字体',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
                Text(
                  "字体加粗",
                  textAlign: TextAlign.center, //文字居中显示
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  '斜体',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
                Text(
                  '顶部线',
                  style: TextStyle(
                    decoration: TextDecoration.overline,
                  ),
                ),
                Text(
                  '下划线',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
                Text(
                  '删除线',
                  style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                    decorationColor: Colors.red,
                  ),
                ),
                Text(
                  '删除线 + 下划线',
                  style: TextStyle(
                      decorationStyle: TextDecorationStyle.wavy,
                      decoration: TextDecoration.combine(new List()
                        ..add(TextDecoration.underline)..add(
                            TextDecoration.lineThrough))),
                ),
                Text(
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
                Text.rich(TextSpan(text: "尝试使用", children: <TextSpan>[
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
                Text(
                  "外部字体",
                  style: new TextStyle(
                    fontFamily: '蝉羽丘陵仙侠',
                    color: Colors.green,
                    fontSize: 24,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text("文字图标："),
                    Icon(MyIconFont.tiaoshi)
                  ],
                )
              ],
            ),
          )),
    );
  }

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
}

class MyGestureRecognizer extends TapGestureRecognizer {}
