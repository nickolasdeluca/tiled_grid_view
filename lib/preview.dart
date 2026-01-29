import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:tiled_grid_view/tiled_grid_view.dart';

@Preview(name: 'Tile Preview')
Widget tilePreview() {
  return Center(
    child: TileMenu(
      tiles: [
        Tile(
          label: 'Item 1',
          flex: 1,
          onPressed: () {},
          color: Colors.blue,
          icon: Icons.star,
        ),
        Tile(
          label: 'Item 2',
          flex: 1,
          onPressed: () {},
          color: Colors.green,
          icon: Icons.favorite,
        ),
        Tile(
          label: 'Item 3',
          flex: 1,
          onPressed: () {},
          color: Colors.orange,
          icon: Icons.home,
        ),
        Tile(
          label: 'Item 4',
          flex: 1,
          onPressed: () {},
          color: Colors.red,
          icon: Icons.settings,
        ),
        Tile(
          label: 'Item 5',
          flex: 2,
          onPressed: () {},
          color: Colors.purple,
          icon: Icons.notifications,
        ),
        Tile(
          label: 'Item 6',
          flex: 3,
          onPressed: () {},
          color: Colors.teal,
          icon: Icons.account_circle,
        ),
        Tile(
          label: 'Item 7',
          flex: 2,
          onPressed: () {},
          color: Colors.amber,
          icon: Icons.music_note,
        ),
        Tile(
          label: 'Item 8',
          flex: 1,
          onPressed: () {},
          color: Colors.cyan,
          icon: Icons.map,
        ),
      ],
    ),
  );
}
