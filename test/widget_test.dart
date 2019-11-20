// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:hacker_news/main.dart';

void main() {
  testWidgets('icon test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that our counter starts at 0.
    expect(find.byIcon(Icons.launch), findsNothing);
    await tester.tap(find.byType(ExpansionTile).first);
    await tester.pump();
    expect(find.byIcon(Icons.launch), findsOneWidget);
  });
}
