import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:try_animation_with_flutter/MyModules/my_scaler.dart';

class MyGestureDetector extends StatefulWidget {
  static String routeName = '/guestureDetector';

  @override
  _MyGestureDetectorState createState() => _MyGestureDetectorState();
}

class _MyGestureDetectorState extends State<MyGestureDetector> {
  double _size;
  double _comparableSize;

  @override
  void initState() {
    _size = 100;
    _comparableSize = 50;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _maxHeight = MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top - 50;
    var _maxWidth = MediaQuery.of(context).size.width;
    var image = Image.asset(
      'assets/car.png',
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Gesture Detector'),
      ),
      body: Center(
        child: MyScaller(
          size: _size,
          comparableSize: _comparableSize,
          child: image,
          maxHeight: _maxHeight,
          maxWidth: _maxWidth,
        ),
      ),
    );
  }
}
