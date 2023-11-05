import 'dart:math';

import 'package:avatar_rings/src/ring_painter.dart';
import 'package:avatar_rings/src/wave.dart';
import 'package:flutter/material.dart';

/// The widget used to animate and style the rings.
class AnimatedRings extends StatefulWidget {
  /// The constructor for the [AnimatedRings] class
  ///
  /// Accepts the amount of [rings], the [radius] of
  /// the entire rings painter, a [spaceBetweenRings] space between each ring,
  /// a [fromPeriod] for the start period value, a [toPeriod] for the end
  /// period value, a [ringsColor] for the color of the rings, and a
  /// [ringsColorOpacity] for the opacity for the rings.
  ///
  /// - The [radius] must be bigger than the [rings] multiplied with the
  /// [spaceBetweenRings].
  ///
  /// - The [rings] must less/equal to 16 to keep performance
  ///
  /// - The [fromPeriod] and [toPeriod] values must be between 10 and 400
  ///
  /// - The [toPeriod] must be bigger or equal to [fromPeriod]
  ///
  const AnimatedRings({
    required this.rings,
    required this.radius,
    required this.spaceBetweenRings,
    required this.fromPeriod,
    required this.toPeriod,
    required this.ringsColor,
    required this.ringsColorOpacity,
    super.key,
  });

  /// The number of rings
  final int rings;

  /// The radius of the entire rings painter
  final double radius;

  /// The start period value. Used to generate a random value starting from [fromPeriod]
  final double fromPeriod;

  /// The start period value. Used to generate a random value ending in [toPeriod]
  final double toPeriod;

  /// The color of the rings
  final Color ringsColor;

  /// The opacity for the rings color
  final double ringsColorOpacity;

  /// The space between each ring
  final double spaceBetweenRings;

  @override
  State<AnimatedRings> createState() => _AnimatedRingsState();
}

class _AnimatedRingsState extends State<AnimatedRings>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  List<List<Wave>> waves = [];
  double? rotation;

  /// Create the wave objects used to build a ring.
  /// The `amplitude`, `period`, and `phase` are random values following the rules:
  ///  - `amplitude` is a random value between 0 and 4
  ///  - `period` is a random value between 100 and 200 by default. Values of `fromPeriod` and `toPeriod`
  ///  - `phase` is by default 2*pi, the phase of a wave
  List<Wave> _buildWaves() {
    final waves = <Wave>[];
    for (var i = 0; i < 5; i++) {
      final amplitude = Random().nextDouble() * 1 + (0.05 * i);
      final period =
          Random().nextInt((widget.toPeriod - widget.fromPeriod).toInt()) +
              widget.fromPeriod;
      final phase = Random().nextDouble() * 2 * pi;
      waves.add(
        Wave(
          amplitude: amplitude,
          period: period,
          phase: phase,
        ),
      );
    }
    return waves;
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(minutes: 1),
    );
    // Generate waves for each ring
    for (var i = 0; i < widget.rings; i++) {
      waves.add(_buildWaves());
    }
    // If there is more than 1 ring, calculate the rotation for each one
    if (waves.length > 1) {
      rotation = 360 / waves.length;
    }
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget? child) => CustomPaint(
        painter: RingPainter(
          controller: _controller,
          rings: waves,
          radius: widget.radius,
          ringSpace: widget.spaceBetweenRings,
          ringColor: widget.ringsColor,
          ringsColorOpacity: widget.ringsColorOpacity,
          rotation: rotation,
        ),
      ),
    );
  }
}
