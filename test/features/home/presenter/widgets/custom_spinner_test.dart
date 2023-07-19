import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:millennium_gallery/features/home/home.dart';

void main() {
  testWidgets('Custom Spinner widget Test', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        title: 'Widget Test',
        home: Scaffold(
          body: CustomSpinner(),
        ),
      ),
    );

    final messageWidget = find.byType(Image);

    expect(messageWidget, findsOneWidget);
  });
}
