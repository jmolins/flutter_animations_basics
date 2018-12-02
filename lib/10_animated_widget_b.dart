import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedHome10 extends StatefulWidget {
  @override
  _AnimatedHomeState createState() => _AnimatedHomeState();
}

class _AnimatedHomeState extends State<AnimatedHome10>
    with SingleTickerProviderStateMixin<AnimatedHome10> {
  AnimationController _controller;
  Animation _alignAnimation;

  @override
  void initState() {
    _controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) _controller.reverse();
            if (status == AnimationStatus.dismissed) _controller.forward();
          });
    _alignAnimation =
        AlignmentTween(begin: Alignment(0.0, 1.0), end: Alignment(0.0, -1.0))
            .animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Animated widgets")),
      body: AlignTransition(
        alignment: _alignAnimation,
        child: Container(
          color: Colors.red,
          height: 100.0,
          width: 100.0,
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
