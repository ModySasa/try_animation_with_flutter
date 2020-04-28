import 'dart:async';

import 'package:flutter/material.dart';
import 'package:try_animation_with_flutter/MyModules/Clock/clock_seconds_widget.dart';
import 'package:try_animation_with_flutter/MyModules/methods.dart';

class ClockWidget extends StatefulWidget {
  final Color textColor, backGroundColor;

  ClockWidget({
    this.textColor,
    this.backGroundColor,
  });

  @override
  _ClockWidgetState createState() => _ClockWidgetState();
}

class _ClockWidgetState extends State<ClockWidget> {
  DateTime _dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    Widget clockWidget(BuildContext context, Color textColor, Color backGroundColor) {
      String currentHour = '${_dateTime.hour}';
      String currentMinute = '${_dateTime.minute}';
      String currentSecond = '${_dateTime.second}';
      String firstHour, secondHour;
      String firstMinute, secondMinute;
      String firstSecond, secondSecond;
      if (currentHour.length == 1) {
        firstHour = '0';
        secondHour = currentHour;
      } else {
        firstHour = currentHour.substring(0)[0];
        secondHour = currentHour.substring(0)[1];
      }
      if (currentMinute.length == 1) {
        firstMinute = '0';
        secondMinute = currentMinute;
      } else {
        firstMinute = currentMinute.substring(0)[0];
        secondMinute = currentMinute.substring(0)[1];
      }
      if (currentSecond.length == 1) {
        firstSecond = '0';
        secondSecond = currentSecond;
      } else {
        firstSecond = currentSecond.substring(0)[0];
        secondSecond = currentSecond.substring(0)[1];
      }

      Timer(Constants.oneSecond, () {
        setState(() {
          _dateTime = DateTime.now();
        });
      });
      var colorTextStyle = TextStyle(color: textColor, fontSize: 50);
      return Container(
        height: 50,
        width: double.infinity,
        color: backGroundColor,
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(
              firstHour,
              style: colorTextStyle,
            ),
            Text(
              secondHour,
              style: colorTextStyle,
            ),
            SizedBox(
              width: 15,
            ),
            MiddleSeconds(backGroundColor, textColor),
            SizedBox(
              width: 15,
            ),
            Text(
              firstMinute,
              style: colorTextStyle,
            ),
            Text(
              secondMinute,
              style: colorTextStyle,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              firstSecond,
              style: colorTextStyle.copyWith(fontSize: 10),
            ),
            Text(
              secondSecond,
              style: colorTextStyle.copyWith(fontSize: 10),
            ),
          ],
        )),
      );
    }

    return clockWidget(context, widget.textColor, widget.backGroundColor);
  }
}
