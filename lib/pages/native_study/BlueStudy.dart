import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/**
 * @author: X_Meteor
 * @description: 类描述
 * @version: V_1.0.0
 * @date: 2019/10/10 16:43
 * @company:
 * @email: lx802315@163.com
 */
class BlueStudy extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _BlueStudyState();
  }
}

class _BlueStudyState extends State<BlueStudy> {

  String _message='检查蓝牙状态中....';

  //这里的参数名要和底层原生的申明的参数名一样
  static const MethodChannel methodChannel =
      MethodChannel('bluetooth');

  Future<void> _openBlueTooth() async {
    //打开蓝牙
    String message;
    message = await methodChannel.invokeMethod('openBuleTooth');
    setState(() {
      _message = message;
    });
  }

  Future<void> _getBlueTooth() async {
    //检测蓝牙
    String message;
    message = await methodChannel.invokeMethod('getBuleTooth');
    setState(() {
      _message = message;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: new Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('蓝牙状态:'),
                    Text(
                      _message,
                    )
                  ],
                ),
                Padding(
                    padding: EdgeInsets.all(10.0),
                    child:Column(
                      children: <Widget>[
                        RaisedButton(
                          color: Colors.blue,
                          textColor: Colors.white,
                          child: Text('打开蓝牙'),
                          onPressed: _openBlueTooth,
                        ),
                        RaisedButton(
                          color: Colors.blue,
                          textColor: Colors.white,
                          child: Text('检测蓝牙状态'),
                          onPressed: _getBlueTooth,
                        ),
                      ],
                    )
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
