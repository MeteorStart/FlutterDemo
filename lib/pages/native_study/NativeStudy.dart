import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// @author: X_Meteor
/// @description: 类描述
/// @version: V_1.0.0
/// @date: 2019/10/10 15:03
/// @company:
/// @email: lx802315@163.com
class NativeStudy extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NativeStudyState();
  }
}

class _NativeStudyState extends State<NativeStudy> {
  static const platform = const MethodChannel('battery');

  // Get battery level.
  String _batteryLevel = 'Unknown battery level.';

  Future<Null> _getBatteryLevel() async {

    String batteryLevel;

    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Material(
      child: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            new RaisedButton(
              child: new Text('Get Battery Level'),
              onPressed: _getBatteryLevel,
            ),
            new Text(_batteryLevel),
          ],
        ),
      ),
    );
  }
}
