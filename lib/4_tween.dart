import 'package:flutter/material.dart';

class AnimatedHome4 extends StatefulWidget {
  @override
  _AnimatedHomeState createState() => _AnimatedHomeState();
}

class _AnimatedHomeState extends State<AnimatedHome4>
    with SingleTickerProviderStateMixin<AnimatedHome4> {
  AnimationController _controller;
  Animation _sideAnimation;

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Introducing tweens")),
      body: Center(
        child: Container(
          color: Colors.red,
          height: _sideAnimation.value,
          width: _sideAnimation.value,
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
