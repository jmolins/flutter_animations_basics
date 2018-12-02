import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedHome6 extends StatefulWidget {
  @override
  _AnimatedHomeState createState() => _AnimatedHomeState();
}

class _AnimatedHomeState extends State<AnimatedHome6>
    with SingleTickerProviderStateMixin<AnimatedHome6> {
  AnimationController _controller;
  Animation _sideAnimation;
  Animation _angleAnimation;
  Animation _alignAnimation;
  Animation _colorAnimation;

  @override
  void initState() {
    _controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this)
          ..addListener(() => setState(() {}))
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) _controller.reverse();
            if (status == AnimationStatus.dismissed) _controller.forward();
          });
    _sideAnimation =
        Tween<double>(begin: 100.0, end: 200.0).animate(_controller);
    _angleAnimation =
        Tween<double>(begin: 0.0, end: 2 * pi).animate(_controller);
    _alignAnimation =
        AlignmentTween(begin: Alignment(0.0, 1.0), end: Alignment(0.0, -1.0))
            .animate(_controller);
    _colorAnimation =
        ColorTween(begin: Color(0xFF44BB33), end: Color(0xFFEE5522))
            .animate(_controller);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Typed tweens")),
      body: Align(
        alignment: _alignAnimation.value,
        child: Transform.rotate(
          angle: _angleAnimation.value,
          child: Container(
            color: _colorAnimation.value,
            height: _sideAnimation.value,
            width: _sideAnimation.value,
          ),
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
