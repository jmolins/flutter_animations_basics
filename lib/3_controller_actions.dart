import 'package:flutter/material.dart';

class AnimatedHome3 extends StatefulWidget {
  @override
  _AnimatedHomeState createState() => _AnimatedHomeState();
}

class _AnimatedHomeState extends State<AnimatedHome3>
    with SingleTickerProviderStateMixin<AnimatedHome3> {
  AnimationController _controller;

  @override
  void initState() {
    _controller =
    AnimationController(duration: Duration(seconds: 1), vsync: this)
      ..addListener(() => setState(() {
      }))
    ..addStatusListener((status) {
      if (status == AnimationStatus.completed)
        _controller.reverse();
      if (status == AnimationStatus.dismissed)
        _controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Animation controller actions")),
      body: Center(
        child: Container(
          color: Colors.red,
          height: 100 + _controller.value * 100,
          width: 100 + _controller.value * 100,
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () {
              _controller.forward();
            },
            child: Icon(Icons.refresh),
          ),
          FloatingActionButton(
            onPressed: () {
              _controller.stop();
            },
            child: Icon(Icons.stop),
          ),
        ],
      ),
    );
  }
}
