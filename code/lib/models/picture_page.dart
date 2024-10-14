import 'package:flutter/material.dart';
import 'navigation_menu.dart';  

class PicturePage extends StatelessWidget {
  const PicturePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Take Picture'),
        actions: const [
          NavigationMenu(),
        ],
      ),
      body: const Center(
        child: Text('Take a picture with this functionality.'),
      ),
    );
  }
}
