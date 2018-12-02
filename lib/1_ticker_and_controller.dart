import 'package:flutter/material.dart';

class AnimatedHome1 extends StatefulWidget {
  @override
  _AnimatedHomeState createState() => _AnimatedHomeState();
}

class _AnimatedHomeState extends State<AnimatedHome1>
    with SingleTickerProviderStateMixin<AnimatedHome1> {
  AnimationController _controller;
  double _side = 100.0;

  @override
  void initState() {
    _controller =
        AnimationController(duration: Duration(seconds: 2), vsync: this)
          ..addListener(() => setState(() {
                _side += 2;
              }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Replacing clicks with ticker")),
      body: Center(
        child: Container(
          color: Colors.red,
          height: _side,
          width: _side,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller.forward();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
