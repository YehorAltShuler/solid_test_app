import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solid_test_app/main.dart';
import 'package:solid_test_app/theme_cubit.dart';

void main() {
  testWidgets('Background color changes on tap', (WidgetTester tester) async {
    // Pump the widget
    await tester.pumpWidget(BlocProvider<ThemeCubit>(
      create: (context) => ThemeCubit(),
      child: const Application(),
    ));

    // Find the GestureDetector with the background color change logic
    final gestureDetector = find.byType(GestureDetector);

    // Verify initial background color
    final initialColor =
        Theme.of(tester.element(gestureDetector)).scaffoldBackgroundColor;

    // Verify initialColor is of type Color
    expect(initialColor, isA<Color>());

    // Tap on the GestureDetector
    await tester.tap(gestureDetector);

    // Wait for UI update
    await tester.pumpAndSettle();

    // Verify that the background color has changed
    final newColor =
        Theme.of(tester.element(gestureDetector)).scaffoldBackgroundColor;
    expect(newColor, isNot(initialColor)); // Ensure color is different
  });
}
