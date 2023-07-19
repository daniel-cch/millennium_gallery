import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:millennium_gallery/features/home/home.dart';

void main() {
  testWidgets('CustomChip widget Test', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        title: 'Widget Test',
        home: Scaffold(
          body: CustomChip(
            filter: CharacterFilters.male,
            selected: true,
          ),
        ),
      ),
    );

    final Container container = tester.firstWidget(find.byType(Container));
    final decoration = container.decoration as BoxDecoration;

    final Icon icon = tester.firstWidget(find.byType(Icon));
    final iconData = icon.icon;

    expect(find.byType(CustomChip), findsOneWidget);
    expect(find.byType(Container), findsOneWidget);
    expect(decoration.color, Colors.redAccent);
    expect(find.byType(Icon), findsOneWidget);
    expect(iconData, Icons.male);
  });

  testWidgets('CustomChip widget Test', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        title: 'Widget Test',
        home: Scaffold(
          body: CustomChip(
            filter: CharacterFilters.female,
            selected: false,
          ),
        ),
      ),
    );

    final Container container = tester.firstWidget(find.byType(Container));
    final decoration = container.decoration as BoxDecoration;

    final Icon icon = tester.firstWidget(find.byType(Icon));
    final iconData = icon.icon;

    expect(find.byType(CustomChip), findsOneWidget);
    expect(find.byType(Container), findsOneWidget);
    expect(decoration.color, Colors.transparent);
    expect(find.byType(Icon), findsOneWidget);
    expect(iconData, Icons.female);
  });
}
