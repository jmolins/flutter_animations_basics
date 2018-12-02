import 'package:flutter/material.dart';

class AnimatedHome2 extends StatefulWidget {
  @override
  _AnimatedHomeState createState() => _AnimatedHomeState();
}

class _AnimatedHomeState extends State<AnimatedHome2>
    with SingleTickerProviderStateMixin<AnimatedHome2> {
  AnimationController _controller;

  @override
  void initState() {
    _controller =
        AnimationController(duration: Duration(seconds: 2), vsync: this)
          ..addListener(() => setState(() {
              }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Animation controller value")),
      body: Center(
        child: Container(
          color: Colors.red,
          height: 100 + _controller.value * 100,
          width: 100 + _controller.value * 100,
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
