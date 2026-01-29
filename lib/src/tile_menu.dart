import 'package:flutter/material.dart';

import 'tile.dart';

/// A widget that arranges [Tile] widgets in a responsive grid layout.
///
/// The [TileMenu] automatically distributes tiles across rows based on their
/// flex values and the [maxFlexPerRow] constraint. It provides visual warnings
/// for layout inefficiencies.
///
/// ## Example
///
/// ```dart
/// TileMenu(
///   maxFlexPerRow: 3,
///   tiles: [
///     Tile(label: 'Item 1', flex: 1),
///     Tile(label: 'Item 2', flex: 2),
///     Tile(label: 'Item 3', flex: 1),
///   ],
/// )
/// ```
class TileMenu extends StatelessWidget {
  /// Creates a tile menu widget.
  ///
  /// The [tiles] parameter is required and contains the list of tiles to display.
  const TileMenu({super.key, required this.tiles, this.maxFlexPerRow = 3});

  /// The maximum total flex value allowed per row.
  ///
  /// Tiles are arranged in rows such that the sum of flex values
  /// in each row does not exceed this value.
  ///
  /// Defaults to 3.
  final int maxFlexPerRow;

  /// The list of tiles to display in the grid.
  final List<Tile> tiles;

  @override
  Widget build(BuildContext context) {
    return Column(children: _buildRows());
  }

  List<Widget> _buildRows() {
    final List<Widget> rows = [];
    List<Tile> currentRow = [];
    int currentRowFlex = 0;

    for (int i = 0; i < tiles.length; i++) {
      final tile = tiles[i];

      if (tile.flex > maxFlexPerRow) {
        rows.add(_buildFlexExceededWarning(i, tile, maxFlexPerRow));
        continue;
      }

      if (currentRowFlex + tile.flex > maxFlexPerRow) {
        if (currentRow.isNotEmpty) {
          final hasWarning = currentRowFlex != maxFlexPerRow;
          rows.add(_buildRow(currentRow, hasWarning: hasWarning));

          if (hasWarning) {
            rows.add(
              _buildWarningMessage(currentRowFlex, maxFlexPerRow, i, tile),
            );
          } else {
            rows.add(const Divider(height: 10));
          }

          currentRow = [];
          currentRowFlex = 0;
        }
      }

      currentRow.add(tile);
      currentRowFlex += tile.flex;

      if (currentRowFlex == maxFlexPerRow) {
        rows.add(_buildRow(currentRow));
        rows.add(const Divider(height: 10));
        currentRow = [];
        currentRowFlex = 0;
      }
    }

    if (currentRow.isNotEmpty) {
      rows.add(_buildRow(currentRow));
    }

    if (rows.isNotEmpty && rows.last is Divider) {
      rows.removeLast();
    }

    return rows;
  }

  Widget _buildFlexExceededWarning(int index, Tile tile, int maxFlex) {
    final message =
        'FLEX EXCEEDED'
        '\n'
        'Tile at index $index ("${tile.label}") has flex ${tile.flex} '
        'which exceeds the maximum of $maxFlex.'
        '\n'
        'This tile will be skipped.';

    return Container(
      margin: const .symmetric(vertical: 5),
      padding: const .all(10),
      decoration: BoxDecoration(color: Colors.red[700], borderRadius: .zero),
      child: Row(
        children: [
          const Icon(Icons.error, color: Colors.white, size: 20),
          const VerticalDivider(),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWarningMessage(
    int currentFlex,
    int maxFlex,
    int tileIndex,
    Tile tile,
  ) {
    final message =
        'INEFFICIENT LAYOUT'
        '\n'
        'Row ended with $currentFlex/$maxFlex flex '
        '(${maxFlex - currentFlex} wasted).'
        '\n'
        'Tile "${tile.label}" (flex: ${tile.flex}) could not fit.'
        '\n'
        'Rearrange tiles to utilize space efficiently.';

    return Container(
      margin: const .symmetric(vertical: 5),
      padding: const .all(10),
      decoration: BoxDecoration(color: Colors.yellow[700], borderRadius: .zero),
      child: Row(
        children: [
          const Icon(Icons.warning, color: Colors.black, size: 20),
          const VerticalDivider(),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRow(List<Tile> tiles, {bool hasWarning = false}) {
    final rowWidget = Row(
      children: tiles.map((tile) {
        return Expanded(
          flex: tile.flex,
          child: Padding(
            padding: EdgeInsets.only(
              right: tile == tiles.last ? 0 : 10, // crossAxisSpacing
            ),
            child: tile,
          ),
        );
      }).toList(),
    );

    if (hasWarning) {
      return Stack(
        children: [
          rowWidget,
          Positioned.fill(
            child: IgnorePointer(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.red[700]!, width: 3),
                ),
              ),
            ),
          ),
        ],
      );
    }

    return rowWidget;
  }
}
