import 'package:flutter/material.dart';

class MyScaller extends StatefulWidget {
  double size;
  double maxHeight;
  double maxWidth;
  double comparableSize;
  Widget child;

  MyScaller({
    this.size = 100,
    this.comparableSize = 50,
    this.child,
    this.maxHeight,
    this.maxWidth,
  });

  @override
  _MyScallerState createState() => _MyScallerState();
}

class _MyScallerState extends State<MyScaller> {
  double _size;
  double _comparableSize;

  @override
  void initState() {
    _size = widget.size;
    _comparableSize = widget.comparableSize;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onScaleEnd: (details) {
        setState(() {
          _comparableSize = _size;
        });
      },
      onScaleUpdate: (details) {
        setState(() {
          if (_comparableSize * details.scale < 100) {
            _size = 100;
          } else {
            _size = _comparableSize * details.scale;
          }
        });
      },
      child: Container(
        height: _size <= widget.maxHeight ? _size : widget.maxHeight,
        width: _size <= widget.maxWidth ? _size : widget.maxWidth,
        child: widget.child,
      ),
    );
  }
}
