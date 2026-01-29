import 'package:flutter/material.dart';

/// A customizable tile widget that displays a label with optional icon and color.
///
/// The [Tile] widget is designed to be used within a [TileMenu] to create
/// grid-based layouts with flexible sizing.
///
/// ## Example
///
/// ```dart
/// Tile(
///   label: 'Home',
///   icon: Icons.home,
///   color: Colors.blue,
///   flex: 2,
///   onPressed: () => print('Home pressed'),
/// )
/// ```
class Tile extends StatelessWidget {
  /// Creates a tile widget.
  ///
  /// The [label] parameter is required and will be displayed as the tile's text.
  const Tile({
    super.key,
    required this.label,
    this.color,
    this.icon,
    this.flex = 1,
    this.onPressed,
    this.width = 120,
    this.height = 120,
  });

  /// The text label displayed on the tile.
  final String label;

  /// The background color of the tile.
  ///
  /// Defaults to [Colors.white] if not specified.
  /// The foreground color (text and icon) is automatically calculated
  /// based on the background color's luminance.
  final Color? color;

  /// An optional icon displayed alongside the label.
  final IconData? icon;

  /// The flex factor that determines how much space this tile takes
  /// relative to other tiles in the same row.
  ///
  /// Defaults to 1. Must not exceed [TileMenu.maxFlexPerRow].
  final int flex;

  /// Called when the tile is pressed.
  final VoidCallback? onPressed;

  final double? width;

  final double? height;

  @override
  Widget build(BuildContext context) {
    final backgroundColor = color ?? Colors.white;
    final foregroundColor = backgroundColor.computeLuminance() > 0.5
        ? Colors.black
        : Colors.white;

    return SizedBox(
      height: height,
      width: width,
      child: Material(
        color: backgroundColor,
        child: InkWell(
          onTap: onPressed,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null) ...[
                  Icon(icon, color: foregroundColor),
                  const SizedBox(height: 5),
                ],
                Text(
                  label,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: foregroundColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
