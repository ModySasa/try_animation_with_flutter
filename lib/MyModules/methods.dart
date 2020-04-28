import 'dart:math';

import 'package:flutter/material.dart';

Color randomColor() {
  List<Color> colors = [...Colors.primaries, ...Colors.accents];
  return colors[Random.secure().nextInt(colors.length)];
}

IconData randomIcon() {
  List<IconData> icons = [
    Icons.ac_unit,
    Icons.label,
    Icons.home,
    Icons.accessibility,
    Icons.add,
    Icons.adjust,
    Icons.attach_money,
    Icons.border_top,
    Icons.casino
  ];
  return icons[Random.secure().nextInt(icons.length)];
}

class Constants {
  static const Duration fullDay = Duration(hours: 24);
  static const Duration halfDay = Duration(hours: 12);
  static const Duration oneHour = Duration(hours: 1);
  static const Duration oneMinute = Duration(minutes: 1);
  static const Duration oneSecond = Duration(seconds: 1);
  static const Duration halfSecond = Duration(milliseconds: 500);
  static const Duration quarterSecond = Duration(milliseconds: 250);
}
