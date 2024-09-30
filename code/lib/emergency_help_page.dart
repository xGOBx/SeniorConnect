import 'package:flutter/material.dart';
import 'navigation_menu.dart';  

class EmergencyHelpPage extends StatelessWidget {
  const EmergencyHelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emergency Help'),
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
              child: const Text('Call Admin/Staff for Medical Help'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
              },
              child: const Text('Contact Family to Report Abuse'),
            ),
          ],
        ),
      ),
    );
  }
}
