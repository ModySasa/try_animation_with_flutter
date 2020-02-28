import 'package:flutter/material.dart';

import 'MyModules/cirlce_color_picker.dart';
import 'animations_screens/animated_list.dart';
import 'animations_screens/animated_transitions.dart';
import 'animations_screens/gesture_detector.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color _color;
  Color _selectedColor;
  var _buttonTextStyle;

  Color getOppositeColor(Color color) {
    var oppositeColor = Color.fromRGBO(
      255 - color.red,
      255 - color.green,
      255 - color.blue,
      color.opacity,
    );
    return oppositeColor;
  }

  @override
  void initState() {
    _selectedColor = Colors.cyan;
    _buttonTextStyle = TextStyle(
      color: getOppositeColor(
        _selectedColor,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: _selectedColor != null ? _selectedColor : Theme.of(context).primaryColor,
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            moveToPage(
              context,
              'Animated Transions',
              MyAnimatedTransitions.routeName,
            ),
            Divider(),
            moveToPage(
              context,
              'Animated List',
              MyAnimatedList.routeName,
            ),
            Divider(),
            moveToPage(
              context,
              'Gesture Detector',
              MyGestureDetector.routeName,
            ),
            Divider(),
            Container(
              width: MediaQuery.of(context).size.width * 2 / 4,
              child: FlatButton(
                color: _selectedColor,
                child: Text(
                  'choose Color',
                  style: _buttonTextStyle,
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (ctx) => Dialog(
                      child: Container(
                        height: 350,
                        child: Column(
                          children: <Widget>[
                            Text(
                              'Select color',
                              style: TextStyle(
                                color: _color,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            CircleColorPicker(
                              size: Size(
                                250,
                                250,
                              ),
                              strokeWidth: 2,
                              initialColor: Colors.black,
                              thumbSize: 10,
                              onChanged: (selectedColor) {
                                setState(() {
                                  _color = selectedColor;
                                });
                              },
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            FlatButton(
                              onPressed: () {
                                Navigator.of(context).pop(_color);
                              },
                              child: Text('Select color'),
                            )
                          ],
                        ),
                      ),
                    ),
                  ).then((selectedColor) {
                    setState(() {
                      _selectedColor = selectedColor;
                    });
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget moveToPage(BuildContext context, String title, String pageName) {
    return Container(
      width: MediaQuery.of(context).size.width * 2 / 4,
      child: FlatButton(
        color: _selectedColor,
        child: Text(
          title,
          style: _buttonTextStyle,
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(
            pageName,
          );
        },
      ),
    );
  }
}
