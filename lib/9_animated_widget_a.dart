import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedHome9 extends StatefulWidget {
  @override
  _AnimatedHomeState createState() => _AnimatedHomeState();
}

class _AnimatedHomeState extends State<AnimatedHome9>
    with SingleTickerProviderStateMixin<AnimatedHome9> {
  AnimationController _controller;
  Animation _alignAnimation;

  @override
  void initState() {
    _controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this)
          ..addListener(() => setState(() {}))
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
      appBar: AppBar(title: Text("Animate widget")),
      body: Align(
        alignment: _alignAnimation.value,
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
