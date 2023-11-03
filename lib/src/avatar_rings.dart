import 'package:avatar_rings/src/animated_rings.dart';
import 'package:flutter/material.dart';

/// Paint the rings by appending a series of different waves into one per ring,
/// and then drawing each ring following a circle shape.
class AvatarRings extends StatelessWidget {
  /// The constructor for the [AvatarRings] class
  ///
  /// Accepts a [child] widget, the amount of [rings], the [radius] of
  /// the entire rings painter, a [spaceBetweenRings] space between each ring,
  /// a [fromPeriod] for the start period value, a [toPeriod] for the end
  /// period value, a [ringsColor] for the color of the rings, a
  /// [ringsColorOpacity] for the opacity for the rings, and the [shadowColor]
  /// and [shadowColorOpacity] for color and opacity of the shadow.
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
  const AvatarRings({
    required this.child,
    this.rings = 4,
    this.radius = 80,
    this.spaceBetweenRings = 1,
    this.fromPeriod = 150,
    this.toPeriod = 200,
    this.ringsColor = Colors.lightBlue,
    this.ringsColorOpacity = .4,
    this.shadowColor = Colors.lightBlue,
    this.shadowColorOpacity = .4,
    this.padding,
    super.key,
  })  : assert(
          radius > rings * spaceBetweenRings,
          'The radius must the bigger than the rings multiplied by the space between rings',
        ),
        assert(
          rings <= 10,
          'The rings must less/equal to 16 to keep performance',
        ),
        assert(
          fromPeriod > 10 ||
              toPeriod > 10 ||
              fromPeriod <= 400 ||
              toPeriod <= 400,
          'The fromPeriod and toPeriod values must be between 10 and 400',
        ),
        assert(
          fromPeriod <= toPeriod,
          'The toPeriod must be bigger or equal to fromPeriod',
        );

  /// The child widget for the rings avatar
  final Widget child;

  /// The number of rings. Defaults to 1.
  final int rings;

  /// The radius of the entire rings painter. Defaults to 80.
  final double radius;

  /// The padding for the child widget. Defaults to a calculation based on the amount of rings.
  final double? padding;

  /// The start period value. Used to generate a random value starting from [fromPeriod]. Defaults to 150.
  final double fromPeriod;

  /// The end period value. Used to generate a random value ending in [toPeriod]. Defaults to 200.
  final double toPeriod;

  /// The color of the rings. Defaults to [Colors.lightBlue].
  final Color ringsColor;

  /// The opacity of the rings color. Defaults to 0.4.
  final double ringsColorOpacity;

  /// The color of the shadow. Defaults to [Colors.lightBlue].
  final Color shadowColor;

  /// The opacity of the shadow color. Defaults to 0.4.
  final double shadowColorOpacity;

  /// The space between each ring. Defaults to 1.
  final double spaceBetweenRings;

  @override
  Widget build(BuildContext context) {
    final childPadding = padding ?? (rings > 8 ? rings * 1.1 : 10);
    return SizedBox.square(
      key: const Key('avatar_rings_sizedbox'),
      dimension: radius * 2,
      child: Stack(
        key: const Key('avatar_rings_stack'),
        children: [
          Center(
            key: const Key('avatar_rings_shadow'),
            child: Container(
              margin: EdgeInsets.all(rings.toDouble()),
              width: radius * 2,
              height: radius * 2,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: shadowColor.withOpacity(shadowColorOpacity),
                    spreadRadius: padding ?? rings.toDouble(),
                    blurRadius: padding ?? rings.toDouble(),
                    offset: const Offset(
                      0,
                      1,
                    ), // changes position of shadow
                  ),
                ],
              ),
            ),
          ),
          Center(
            key: const Key('avatar_rings_rings'),
            child: AnimatedRings(
              rings: rings,
              radius: radius,
              ringsColor: ringsColor,
              ringsColorOpacity: ringsColorOpacity,
              fromPeriod: fromPeriod,
              toPeriod: toPeriod,
              spaceBetweenRings: spaceBetweenRings,
            ),
          ),
          Center(
            key: const Key('avatar_rings_child'),
            child: Padding(
              padding: EdgeInsets.all(childPadding),
              child: ClipOval(
                child: DecoratedBox(
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: child,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
