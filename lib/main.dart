import 'package:flutter/material.dart';
import 'package:flutter_animations_basics/0_manual_animation.dart';
import 'package:flutter_animations_basics/1_ticker_and_controller.dart';
import 'package:flutter_animations_basics/2_animation_ontroller.dart';
import 'package:flutter_animations_basics/3_controller_actions.dart';
import 'package:flutter_animations_basics/4_tween.dart';
import 'package:flutter_animations_basics/5_multi_tweens.dart';
import 'package:flutter_animations_basics/6_typed_tweens.dart';
import 'package:flutter_animations_basics/7_curved_animation.dart';
import 'package:flutter_animations_basics/8_staggered_animations.dart';
import 'package:flutter_animations_basics/9_animated_widget_a.dart';
import 'package:flutter_animations_basics/10_animated_widget_b.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimatedHome7(),
    );
  }
}
