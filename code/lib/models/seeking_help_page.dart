import 'package:project1_mobdev_gaven_pearl_917592768/models/page_styles/styles.dart';
import 'package:flutter/material.dart';
import 'navigation_menu.dart';

class SeekingHelpPage extends StatelessWidget {
  const SeekingHelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seeking Other Help'),
        actions: const [
          NavigationMenu(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppStyles.pagePadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildHelpButton(
              context,
              label: 'Ask to Feed',
              icon: Icons.fastfood,
              onPressed: () {
              },
              color: AppStyles.seekingHelpButtonColor,
            ),
            const SizedBox(height: AppStyles.buttonSpacing),
            _buildHelpButton(
              context,
              label: 'Ask for Help with Medicine',
              icon: Icons.medical_services,
              onPressed: () {
              },
              color: AppStyles.seekingHelpButtonColor,
            ),
            const SizedBox(height: AppStyles.buttonSpacing),
            _buildHelpButton(
              context,
              label: 'Ask for Help with Restrooms',
              icon: Icons.wc,
              onPressed: () {
              },
              color: AppStyles.seekingHelpButtonColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHelpButton(
    BuildContext context, {
    required String label,
    required IconData icon,
    required VoidCallback onPressed,
    required Color color,
  }) {
    return ElevatedButton.icon(
      icon: Icon(icon, size: AppStyles.iconSize),
      label: Text(
        label,
        style: AppStyles.buttonTextStyle,
      ),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: AppStyles.buttonPadding),
        backgroundColor: color,
        shape: AppStyles.buttonShape,
      ),
      onPressed: onPressed,
    );
  }
}
