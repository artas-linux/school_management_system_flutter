// This is a Flutter widget test for the School Management System.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:school_managment_flutter/main.dart';

void main() {
  testWidgets('School Management App initial screen test', (
    WidgetTester tester,
  ) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const SchoolManagementApp());

    // Verify that the dashboard screen is displayed with the correct title.
    expect(find.text('School Management System'), findsOneWidget);

    // Verify that the main app bar is present
    expect(find.byType(AppBar), findsOneWidget);

    // Verify that the main scaffold is present
    expect(find.byType(Scaffold), findsOneWidget);

    // Verify that the GridView is present (for dashboard cards)
    expect(find.byType(GridView), findsOneWidget);

    // Verify that some cards are present in the dashboard
    expect(find.byType(Card), findsWidgets);

    // Verify that InkWell widgets are present (cards are tappable)
    expect(find.byType(InkWell), findsWidgets);

    // Test interaction: tap on a card (e.g., Students card)
    await tester.tap(find.text('Students'));
    await tester.pump(); // Rebuild the widget after the tap

    // Verify navigation happened or state changed appropriately
    // (This will depend on the actual navigation implementation)
  });
}
