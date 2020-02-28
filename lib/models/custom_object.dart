import 'dart:math';

import 'package:flutter/material.dart';

class CustomObject {
  String id;
  String name;
  int cost;
  Color color;
  IconData iconData;

  CustomObject({
    this.id,
    this.name,
    this.cost,
    this.color,
    this.iconData,
  });

  CustomObject.random({
    this.id,
    this.cost,
  }) {
    this.color = randomColor();
    this.name = 'number ${this.id}';
    this.iconData = randomIcon();
  }

  Color randomColor() {
    List<Color> colors = [...Colors.primaries,...Colors.accents];
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
}
