import 'package:flutter/material.dart';
import 'emergency_help_page.dart';
import 'meal_order_page.dart';
import 'near_me_page.dart';
import 'phone_monitoring_page.dart';
import 'calendar_page.dart';
import 'picture_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'auth_gate.dart'; 

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Senior Connect'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();

              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const AuthGate()),
                (route) => false, 
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildHomeOption(
              context,
              icon: Icons.restaurant,
              label: 'Order Meal',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MealOrderPage()),
                );
              },
            ),
            _buildHomeOption(
              context,
              icon: Icons.local_hospital,
              label: 'Emergency Help',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EmergencyHelpPage()),
                );
              },
            ),
            _buildHomeOption(
              context,
              icon: Icons.place,
              label: 'Find Interesting Places',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NearMePage()),
                );
              },
            ),
            _buildHomeOption(
              context,
              icon: Icons.camera_alt,
              label: 'Take Picture',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PicturePage()),
                );
              },
            ),
            _buildHomeOption(
              context,
              icon: Icons.calendar_today,
              label: 'Calendar Events',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CalendarPage()),
                );
              },
            ),
            _buildHomeOption(
              context,
              icon: Icons.battery_full,
              label: 'Monitor Phone Battery',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PhoneMonitoringPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHomeOption(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return Card(
      child: ListTile(
        leading: Icon(icon, color: Colors.teal),
        title: Text(label),
        onTap: onTap,
      ),
    );
  }
}
