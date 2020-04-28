import 'dart:math';

import 'package:flutter/material.dart';
import 'package:try_animation_with_flutter/MyModules/methods.dart';

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
}
