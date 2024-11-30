import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:lab_155/home_page.dart';

void main() {
  testWidgets('Text is displayed correctly on the Home Page', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: MyHomePage()));

    expect(find.text("IPZ-31: YourName's last Flutter App"), findsOneWidget);
  });

  testWidgets('FloatingActionButton with correct icon exists', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: MyHomePage()));

    final fab = find.byType(FloatingActionButton);
    expect(fab, findsOneWidget);

    final icon = find.byIcon(Icons.mouse);
    expect(icon, findsOneWidget);
  });

  testWidgets('Counter increments correctly', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: MyHomePage()));

    expect(find.text('Current Counter: 0'), findsOneWidget);

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pump();

    expect(find.text('Current Counter: 1'), findsOneWidget);
    expect(find.text('Function Result: 10.0'), findsOneWidget);
  });
}
