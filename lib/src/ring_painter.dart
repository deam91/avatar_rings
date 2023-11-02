import 'dart:math';

import 'package:avatar_rings/src/utils.dart';
import 'package:avatar_rings/src/wave.dart';
import 'package:flutter/material.dart';

/// Class used to paint the rings by joining a series of waves for creating a
/// single custom wave, following a circle shape.
class RingPainter extends CustomPainter {
  /// The constructor for the [RingPainter] class
  ///
  /// Accepts an animation [controller], the amount of [rings], the [radius] of
  /// the entire rings painter, a [ringSpace] space between each ring,
  /// a [ringColor] color of the rings, the [ringsColorOpacity] opacity for the
  /// rings, and the [rotation] for each ring.
  ///
  RingPainter({
    required this.controller,
    required this.rings,
    this.radius = 80,
    this.ringSpace = 1.0,
    this.ringColor = Colors.lightBlue,
    this.ringsColorOpacity = .3,
    this.rotation,
  }) : super(repaint: controller);

  /// The animation controller
  final Animation<double> controller;

  /// The radius of the entire rings painter
  final double radius;

  /// The space between each ring
  final double ringSpace;

  /// The color of the rings
  final Color ringColor;

  /// The opacity for the rings color
  final double ringsColorOpacity;

  /// The number of ring waves to paint
  List<List<Wave>> rings = [];

  /// The rotation for each ring
  final double? rotation;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = ringColor.withOpacity(ringsColorOpacity)
      ..style = PaintingStyle.fill
      ..strokeWidth = 2;
    var previousOffset = Offset.zero;
    var savedRadius = radius;
    canvas.save();
    for (final list in rings) {
      for (var i = -smallDegree; i < pi * 2; i += smallDegree) {
        final x = savedRadius * cos(i);
        var y = savedRadius * sin(i);

        for (final wave in list) {
          y += wave.evaluateSin(x, controller.value * savedRadius);
        }
        final offset = Offset(
          x + size.width / 2,
          y + size.height / 2,
        );
        if (previousOffset == Offset.zero) {
          previousOffset = offset;
        }

        canvas.drawLine(
          previousOffset,
          offset,
          paint,
        );
        previousOffset = offset;
      }
      savedRadius = savedRadius - ringSpace;
      previousOffset = Offset.zero;
    }
    if (rotation != null) {
      canvas.rotate(degreeToRadian(rotation!));
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(RingPainter oldDelegate) => true;
}
