import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:try_animation_with_flutter/MyModules/cirlce_color_picker.dart';
import 'package:try_animation_with_flutter/animations_screens/animated_list.dart';
import 'package:try_animation_with_flutter/animations_screens/animated_transitions.dart';
import 'package:try_animation_with_flutter/animations_screens/gesture_detector.dart';
import 'package:try_animation_with_flutter/models/custom_object.dart';

import 'my_home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (ctx) => MyHomePage(title: 'Try animation'),
        MyAnimatedList.routeName: (ctx) => MyAnimatedList(),
        MyAnimatedTransitions.routeName: (ctx) => MyAnimatedTransitions(),
        MyGestureDetector.routeName: (ctx) => MyGestureDetector(),
      },
    );
  }
}
