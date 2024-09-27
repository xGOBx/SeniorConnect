import 'package:flutter/material.dart';

class EmergencyHelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emergency Help'),
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
