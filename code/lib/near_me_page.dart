import 'package:flutter/material.dart';
import 'navigation_menu.dart';  
class NearMePage extends StatelessWidget {
  const NearMePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Near Me'),
        actions: const [
          NavigationMenu(),  
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              onPressed: () {
              },
              child: const Text('Find Restaurants Near Me'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
              },
              child: const Text('Show Nearby Facilities on Map'),
            ),
          ],
        ),
      ),
    );
  }
}
