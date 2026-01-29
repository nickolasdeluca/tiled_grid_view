import 'package:flutter/material.dart';
import 'package:tiled_grid_view/tiled_grid_view.dart';

void main() {
  runApp(const ExampleApp());
}

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tiled Grid View Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const ExamplePage(),
    );
  }
}

class ExamplePage extends StatelessWidget {
  const ExamplePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tiled Grid View Example'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: TileMenu(
          maxFlexPerRow: 3,
          tiles: [
            Tile(
              label: 'Home',
              icon: Icons.home,
              color: Colors.blue,
              flex: 1,
              onPressed: () => _showSnackBar(context, 'Home pressed'),
            ),
            Tile(
              label: 'Settings',
              icon: Icons.settings,
              color: Colors.green,
              flex: 2,
              onPressed: () => _showSnackBar(context, 'Settings pressed'),
            ),
            Tile(
              label: 'Profile',
              icon: Icons.person,
              color: Colors.orange,
              flex: 1,
              onPressed: () => _showSnackBar(context, 'Profile pressed'),
            ),
            Tile(
              label: 'Messages',
              icon: Icons.message,
              color: Colors.purple,
              flex: 1,
              onPressed: () => _showSnackBar(context, 'Messages pressed'),
            ),
            Tile(
              label: 'Notifications',
              icon: Icons.notifications,
              color: Colors.red,
              flex: 1,
              onPressed: () => _showSnackBar(context, 'Notifications pressed'),
            ),
            Tile(
              label: 'Help',
              icon: Icons.help,
              color: Colors.teal,
              flex: 3,
              onPressed: () => _showSnackBar(context, 'Help pressed'),
            ),
          ],
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }
}
