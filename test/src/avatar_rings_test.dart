// ignore_for_file: prefer_const_constructors

import 'package:avatar_rings/avatar_rings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  setUp(() {
    WidgetsFlutterBinding.ensureInitialized();
    WidgetsBinding.instance
      ..resetEpoch()
      ..platformDispatcher.onBeginFrame = null
      ..platformDispatcher.onDrawFrame = null;
  });

  group('AvatarRings', () {
    test('can be instantiated', () {
      expect(
        AvatarRings(
          child: SizedBox(),
        ),
        isNotNull,
      );
    });

    testWidgets('widgets are there', (tester) async {
      const testKey = Key('avatar_rings');
      await tester.pumpWidget(
        MaterialApp(home: const AvatarRings(key: testKey, child: SizedBox())),
      );
      await tester.pump(Duration(milliseconds: 900));

      final ar = find.byKey(Key('avatar_rings'));

      expect(ar, findsOneWidget);
    });
  });
}
