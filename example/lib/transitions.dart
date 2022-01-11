import 'dart:math';

import 'package:flutter/material.dart';

class SkewTransition extends AnimatedWidget {
  const SkewTransition({
    Key key,
    Animation<double> turns,
    this.alignment = Alignment.center,
    this.child,
  })  : assert(turns != null),
        super(key: key, listenable: turns);

  Animation<double> get turns => listenable as Animation<double>;

  final Alignment alignment;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final double turnsValue = turns.value;
    final Matrix4 transform =
        Matrix4.skew(turnsValue * pi * 2.0, turnsValue * pi * 2.0);
    return Transform(
      transform: transform,
      alignment: alignment,
      child: child,
    );
  }
}
