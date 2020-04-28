import 'dart:async';

import 'package:flutter/material.dart';
import 'package:try_animation_with_flutter/MyModules/methods.dart';

class MiddleSeconds extends StatefulWidget {
  final Color backGroundColor, textColor;

  MiddleSeconds(this.backGroundColor, this.textColor);

  @override
  _MiddleSecondsState createState() => _MiddleSecondsState();
}

class _MiddleSecondsState extends State<MiddleSeconds> {
  bool hidden = false;

  @override
  Widget build(BuildContext context) {
    var secondCircle = Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          7.5,
        ),
        gradient: RadialGradient(
          colors: hidden ? [widget.backGroundColor, widget.textColor] : [widget.textColor, widget.backGroundColor],
        ),
      ),
      height: 15,
      width: 15,
    );
    Widget secondsShower = AnimatedContainer(
      duration: Duration(
        milliseconds: 50,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          secondCircle,
          SizedBox(
            height: 5,
          ),
          secondCircle,
        ],
      ),
    );
    Timer.periodic(Duration(seconds: 2), (timer) {
      setState(() {
        hidden = (timer.tick % 2 == 0);
      });
    });
    return secondsShower;
  }
}
