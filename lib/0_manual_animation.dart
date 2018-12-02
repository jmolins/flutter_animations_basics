import 'package:flutter/material.dart';

class AnimatedHome0 extends StatefulWidget {
  @override
  _AnimatedHomeState createState() => _AnimatedHomeState();
}

class _AnimatedHomeState extends State<AnimatedHome0> {
  double _side = 100.0;

  void _incrementSide() {
    setState(() {
      _side += 10;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Manual animation")),
      body: Center(
        child: Container(
          color: Colors.red,
          height: _side,
          width: _side,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementSide,
        child: Icon(Icons.add),
      ),
    );
  }
}
