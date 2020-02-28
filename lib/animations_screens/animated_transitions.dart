import 'package:flutter/material.dart';

class MyAnimatedTransitions extends StatefulWidget {
  static String routeName = '/animatedTransitions';

  @override
  _MyAnimatedTransitionsState createState() => _MyAnimatedTransitionsState();
}

class _MyAnimatedTransitionsState extends State<MyAnimatedTransitions> with TickerProviderStateMixin {
  TickerProvider tickerProvider;
  int _counter = 0;
  Color _color = Colors.black;
  CrossFadeState _crossFadeState = CrossFadeState.showFirst;
  AnimationController controller;
  var duration = Duration(seconds: 2);

  @override
  void initState() {
    controller = AnimationController(
      animationBehavior: AnimationBehavior.preserve,
      vsync: this,
      duration: duration,
      reverseDuration: duration,
    );
    super.initState();
  }

  void _incrementCounter() {
    setState(() {
      switchController();
      if (_counter >= 10)
        _counter = 0;
      else
        _counter++;
    });
  }

  void switchController() {
    switch (_counter) {
      case 0:
        _crossFadeState = CrossFadeState.showFirst;
        controller.forward();
        _color = Colors.blue;
        break;
      case 1:
        _crossFadeState = CrossFadeState.showFirst;
        controller.forward();
        _color = Colors.red;
        break;
      case 2:
        _crossFadeState = CrossFadeState.showSecond;
        controller.forward();
        _color = Colors.blue;
        break;
      case 3:
        _crossFadeState = CrossFadeState.showSecond;
        controller.reverse();
        _color = Colors.red;
        break;
      case 4:
        _crossFadeState = CrossFadeState.showFirst;
        controller.reverse();
        _color = Colors.blue;
        break;
      case 5:
        _crossFadeState = CrossFadeState.showFirst;
        controller.reverse();
        _color = Colors.red;
        break;
      case 6:
        _crossFadeState = CrossFadeState.showSecond;
        controller.forward();
        _color = Colors.blue;
        break;
      case 7:
        _crossFadeState = CrossFadeState.showSecond;
        controller.forward();
        _color = Colors.red;
        break;
      case 8:
        _crossFadeState = CrossFadeState.showFirst;
        controller.forward();
        _color = Colors.blue;
        break;
      case 9:
        _crossFadeState = CrossFadeState.showFirst;
        controller.reverse();
        _color = Colors.red;
        break;
      case 10:
        _crossFadeState = CrossFadeState.showSecond;
        controller.reverse();
        _color = Colors.blue;
        break;
      default:
        controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    var center = Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AnimatedCrossFade(
            firstChild: AnimatedContainer(
              color: _color,
              duration: duration,
              child: AnimatedSize(
                duration: duration,
                vsync: this,
                child: AnimatedIcon(
                  progress: controller,
                  icon: AnimatedIcons.pause_play,
                  size: _counter * 20.0,
                ),
              ),
            ),
            secondChild: Container(
              height: _counter * 10.0,
              width: double.infinity,
              child: Center(
                child: Text(
                  'hi',
                  style: TextStyle(
                    fontSize: _counter * 10.0,
                    color: _color,
                  ),
                ),
              ),
            ),
            duration: duration,
            crossFadeState: _crossFadeState,
          ),
          Text(
            'You have pushed the button this many times:',
          ),
          Text(
            '$_counter',
            style: Theme.of(context).textTheme.display1,
          ),
        ],
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Transitions'),
      ),
      body: center,
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
