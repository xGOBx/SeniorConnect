import 'package:flutter/material.dart';
import 'navigation_menu.dart';  

class MealOrderPage extends StatelessWidget {
  const MealOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Meal'),
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
              child: const Text('Order Breakfast'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
              },
              child: const Text('Order Lunch'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
              },
              child: const Text('Order Dinner'),
            ),
          ],
        ),
      ),
    );
  }
}
