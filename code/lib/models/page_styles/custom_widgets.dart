import 'package:flutter/material.dart';
import 'styles.dart'; 

class HomeOptionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color color;

  const HomeOptionButton({
    required this.icon,
    required this.label,
    required this.onTap,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Icon(icon, size: AppStyles.iconSize, color: Colors.white), 
      label: Text(
        label,
        style: AppStyles.buttonTextStyle,
      ),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(AppStyles.buttonPadding),
        backgroundColor: color,
        shape: AppStyles.buttonShape,  
      ),
      onPressed: onTap,
    );
  }
}
