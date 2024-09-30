import 'package:flutter/material.dart';
import 'navigation_menu.dart';  // Import the NavigationMenu class

class ForgotPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
        actions: const [
          NavigationMenu(),  
        ],
      ),
      body: const Center(
        child: Text('Forgot Password Page'),
      ),
    );
  }
}
