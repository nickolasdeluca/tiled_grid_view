import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tiled_grid_view/tiled_grid_view.dart';

void main() {
  group('Tile', () {
    testWidgets('renders with required label', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: Tile(label: 'Test')),
        ),
      );

      expect(find.text('Test'), findsOneWidget);
    });

    testWidgets('renders with icon when provided', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Tile(label: 'Test', icon: Icons.home),
          ),
        ),
      );

      expect(find.byIcon(Icons.home), findsOneWidget);
    });

    testWidgets('uses provided color as background', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Tile(label: 'Test', color: Colors.blue),
          ),
        ),
      );

      expect(find.text('Test'), findsOneWidget);
    });

    testWidgets('triggers onPressed callback when tapped', (tester) async {
      var pressed = false;
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Tile(label: 'Test', onPressed: () => pressed = true),
          ),
        ),
      );

      await tester.tap(find.text('Test'));
      expect(pressed, isTrue);
    });

    test('default flex value is 1', () {
      const tile = Tile(label: 'Test');
      expect(tile.flex, equals(1));
    });
  });

  group('TileMenu', () {
    testWidgets('renders tiles in a column', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TileMenu(
              tiles: [
                Tile(label: 'Tile 1'),
                Tile(label: 'Tile 2'),
                Tile(label: 'Tile 3'),
              ],
            ),
          ),
        ),
      );

      expect(find.text('Tile 1'), findsOneWidget);
      expect(find.text('Tile 2'), findsOneWidget);
      expect(find.text('Tile 3'), findsOneWidget);
    });

    testWidgets('groups tiles by flex into rows', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: TileMenu(
              maxFlexPerRow: 3,
              tiles: [
                Tile(label: 'A', flex: 1),
                Tile(label: 'B', flex: 2),
                Tile(label: 'C', flex: 1),
              ],
            ),
          ),
        ),
      );

      expect(find.text('A'), findsOneWidget);
      expect(find.text('B'), findsOneWidget);
      expect(find.text('C'), findsOneWidget);
    });

    testWidgets('shows warning when tile flex exceeds max', (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: TileMenu(
                maxFlexPerRow: 2,
                tiles: [Tile(label: 'Too Big', flex: 5)],
              ),
            ),
          ),
        ),
      );

      expect(find.textContaining('FLEX EXCEEDED'), findsOneWidget);
    });

    test('default maxFlexPerRow is 3', () {
      const menu = TileMenu(tiles: []);
      expect(menu.maxFlexPerRow, equals(3));
    });
  });
}
