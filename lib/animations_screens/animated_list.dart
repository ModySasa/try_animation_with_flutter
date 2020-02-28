import 'package:flutter/material.dart';

import '../models/custom_object.dart';

class MyAnimatedList extends StatefulWidget {
  static String routeName = '/animatedList';

  @override
  _MyAnimatedListState createState() => _MyAnimatedListState();
}

class _MyAnimatedListState extends State<MyAnimatedList> {
  List<CustomObject> customObjects = [];
  final _myKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    for (var i = 0; i < 6; i++) {
      customObjects.add(
        CustomObject.random(
          id: '${customObjects.length + 1}',
          cost: 10 * (customObjects.length + 1),
        ),
      );
    }
    super.initState();
  }

  void _incrementCounter() {
    setState(() {
      customObjects.add(
        CustomObject.random(
          id: '${customObjects.length + 1}',
          cost: 10 * (customObjects.length + 1),
        ),
      );
      _myKey.currentState.insertItem(customObjects.length - 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    Animatable myAnimatable(int index) {
      if (index % 2 == 0)
        return CurveTween(
          curve: FlippedCurve(
            ElasticOutCurve(
              200,
            ),
          ),
        );
      else
        return CurveTween(
          curve: ElasticOutCurve(
            200,
          ),
        );
    }

    Tween<Offset> myTween(int index) {
      return Tween(
        begin: Offset(
          index % 2 == 0 ? 0 : 0,
          0.5,
        ),
        end: Offset(
          0,
          0,
        ),
      );
    }

    Future<void> _onRefresh() async {
      for (var i = customObjects.length; i > 0; i--) {
        _myKey.currentState.removeItem(i - 1, (BuildContext context, Animation<double> animation) {
          return FadeTransition(
            opacity: animation,
            child: Container(),
          );
        });
        customObjects.removeAt(i - 1);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Animated List'),
      ),
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: Column(
          children: <Widget>[
            FlatButton(
              onPressed: () {
                setState(() {
                  for (var i = customObjects.length; i > 0; i--) {
                    CustomObject customObject = customObjects[i - 1];
                    _myKey.currentState.removeItem(customObjects.indexOf(customObject), (BuildContext context, Animation<double> animation) {
                      return FadeTransition(
                        opacity: animation,
                        child: buildContainer(
                          customObject,
                        ),
                      );
                    });
                    customObjects.removeLast();
                  }
                });
              },
              child: Container(width: double.infinity, child: Text('Clear List')),
            ),
            Expanded(
              child: AnimatedList(
                  key: _myKey,
                  physics: BouncingScrollPhysics(),
                  initialItemCount: customObjects.length,
                  itemBuilder: (BuildContext context, int index, Animation<double> animation) {
                    CustomObject currentObject = customObjects[index];
                    return SlideTransition(
                      position: animation.drive(myTween(index)),
                      child: RotationTransition(
                        alignment: Alignment(
                          index % 2 == 0 ? 0.2 : -1,
                          0.2,
                        ),
                        turns: animation.drive(myAnimatable(index)),
                        child: buildContainer(currentObject),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  Widget buildContainer(CustomObject currentObject) {
    return Dismissible(
      key: ValueKey(customObjects.indexOf(currentObject)),
      background: Container(
        color: Theme.of(context).errorColor,
        child: Row(
          children: <Widget>[
            Icon(
              Icons.delete,
              color: Colors.white,
              size: 40,
            ),
            Spacer(),
            Icon(
              Icons.delete,
              color: Colors.white,
              size: 40,
            ),
          ],
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.symmetric(horizontal: 20),
      ),
      onDismissed: (direction) {
        _myKey.currentState.removeItem(customObjects.indexOf(currentObject), (BuildContext context, Animation<double> animation) {
          return FadeTransition(
            opacity: animation,
            child: Container(),
          );
        });
        customObjects.removeAt(customObjects.indexOf(currentObject));
      },
      child: Container(
        color: currentObject.color,
        child: ListTile(
          onTap: () {},
          title: Text(
            currentObject.name,
            style: TextStyle(color: Colors.black),
          ),
          leading: Icon(
            currentObject.iconData,
          ),
          trailing: Text(
            'Cost= ${currentObject.cost}',
          ),
        ),
      ),
    );
  }
}
