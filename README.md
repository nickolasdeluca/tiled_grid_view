# Tiled Grid View

A flexible tiled grid view layout system for Flutter with automatic row distribution and layout warnings.

## Features

- **Flexible Tiles**: Create tiles with customizable labels, icons, colors, and flex values
- **Automatic Row Distribution**: Tiles are automatically arranged into rows based on their flex values
- **Layout Warnings**: Visual warnings for inefficient layouts and tiles that exceed the maximum flex
- **Responsive Design**: Tiles adapt their foreground color based on background luminance
- **Easy Integration**: Simple API for creating grid-based menu layouts

## Screen capture

![Screen capture of the package](https://github.com/user-attachments/assets/1797f7ba-7301-414f-86d7-9e6b4d7b36e9)

## Getting Started

Add `tiled_grid_view` to your `pubspec.yaml`:

```yaml
dependencies:
  tiled_grid_view: ^1.0.0
```

Then run:

```bash
flutter pub get
```

## Usage

### Basic Example

```dart
import 'package:flutter/material.dart';
import 'package:tiled_grid_view/tiled_grid_view.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TileMenu(
        maxFlexPerRow: 3,
        tiles: [
          Tile(
            label: 'Home',
            icon: Icons.home,
            color: Colors.blue,
            flex: 1,
            onPressed: () => print('Home pressed'),
          ),
          Tile(
            label: 'Settings',
            icon: Icons.settings,
            color: Colors.green,
            flex: 2,
            onPressed: () => print('Settings pressed'),
          ),
          Tile(
            label: 'Profile',
            icon: Icons.person,
            color: Colors.orange,
            flex: 1,
            onPressed: () => print('Profile pressed'),
          ),
        ],
      ),
    );
  }
}
```

### Tile Widget

The `Tile` widget is a customizable button tile:

| Property | Type | Default | Description |
| ---------- | ------ | --------- | ------------- |
| `label` | `String` | required | The text displayed on the tile |
| `color` | `Color?` | `Colors.white` | Background color of the tile |
| `icon` | `IconData?` | `null` | Optional icon displayed with the label |
| `flex` | `int` | `1` | Flex factor for row distribution |
| `onPressed` | `VoidCallback?` | `null` | Callback when tile is pressed |

### TileMenu Widget

The `TileMenu` widget arranges tiles in a responsive grid:

| Property | Type | Default | Description |
| ---------- | ------ | --------- | ------------- |
| `tiles` | `List<Tile>` | required | List of tiles to display |
| `maxFlexPerRow` | `int` | `3` | Maximum total flex per row |

## Layout Warnings

The package automatically displays warnings for:

1. **Flex Exceeded**: When a tile's flex value exceeds `maxFlexPerRow`
2. **Inefficient Layout**: When a row doesn't fully utilize available flex space

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
