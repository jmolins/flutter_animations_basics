import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedHome8 extends StatefulWidget {
  @override
  _AnimatedHomeState createState() => _AnimatedHomeState();
}

class _AnimatedHomeState extends State<AnimatedHome8>
    with SingleTickerProviderStateMixin<AnimatedHome8> {
  AnimationController _controller;
  Animation _sideAnimation;
  Animation _angleAnimation;

  Animation _alignAnimation1;
  Animation _alignAnimation2;
  Animation _alignAnimation3;

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
        Tween<double>(begin: 0.0, end: 2 * pi).chain(CurveTween(curve: Interval(0.0, 0.4))).animate(_controller);

    // Animation 1
    final Animation _curve =
        CurvedAnimation(parent: _controller, curve: Interval(0.4, 0.7));
    _alignAnimation1 = AlignmentTween(begin: Alignment(0.0, 1.0), end: Alignment(0.0, -1.0)).animate(_curve);

    final Animatable<Alignment> _tween =
        AlignmentTween(begin: Alignment(0.0, 1.0), end: Alignment(0.0, -1.0))
            .chain(CurveTween(curve: Curves.bounceIn));

    // Animation 2
    _alignAnimation2= _tween.animate(_controller);

    // Animation 3
    _alignAnimation3 = _controller.drive(_tween);

    _colorAnimation =
        ColorTween(begin: Color(0xFF44BB33), end: Color(0xFFEE5522))
            .animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Staggered animations")),
      body: Align(
        alignment: _alignAnimation1.value,
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
