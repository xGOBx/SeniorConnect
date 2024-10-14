import 'package:flutter/material.dart';
import 'navigation_menu.dart';
import 'package:project1_mobdev_gaven_pearl_917592768/models/page_styles/styles.dart';

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
        padding: const EdgeInsets.all(AppStyles.pagePadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildEmergencyButton(
              context,
              label: 'Call Admin/Staff for Medical Help',
              icon: Icons.medical_services,
              onPressed: () {
              },
              color: AppStyles.emergencyButtonColor,
            ),
            const SizedBox(height: AppStyles.buttonSpacing),
            _buildEmergencyButton(
              context,
              label: 'Contact Family to Report Abuse',
              icon: Icons.family_restroom,
              onPressed: () {
              },
              color: AppStyles.contactFamilyButtonColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmergencyButton(
    BuildContext context, {
    required String label,
    required IconData icon,
    required VoidCallback onPressed,
    required Color color,
  }) {
    return ElevatedButton.icon(
      icon: Icon(icon, size: AppStyles.iconSize, color: Colors.white),
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
