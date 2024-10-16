import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:battery_plus/battery_plus.dart';
import 'meal_order_page.dart';
import 'emergency_help_page.dart';
import 'near_me_page.dart';
import 'phone_monitoring_page.dart';
import 'calendar_page.dart';
import 'picture_page.dart';
import '../utils/auth_gate.dart';
import 'landing_page.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NavigationMenuState createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  final Battery _battery = Battery();
  int _batteryLevel = 100;
  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    _getBatteryLevel();
  }

  Future<void> _getBatteryLevel() async {
    final int batteryLevel = await _battery.batteryLevel;
    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;

    return PopupMenuButton<String>(
      onSelected: (value) async {
        switch (value) {
          case 'Home':
            Navigator.push(context, MaterialPageRoute(builder: (context) => const LandingPage()));
            break;
          case 'Meal Order':
            Navigator.push(context, MaterialPageRoute(builder: (context) => const MealOrderPage()));
            break;
          case 'Emergency Help':
            Navigator.push(context, MaterialPageRoute(builder: (context) => const EmergencyHelpPage()));
            break;
          case 'Near Me':
            Navigator.push(context, MaterialPageRoute(builder: (context) => const NearMePage()));
            break;
          case 'Phone Monitoring':
            Navigator.push(context, MaterialPageRoute(builder: (context) => const PhoneMonitoringPage()));
            break;
          case 'Calendar Events':
            Navigator.push(context, MaterialPageRoute(builder: (context) => const CalendarPage()));
            break;
          case 'Take Picture':
            Navigator.push(context, MaterialPageRoute(builder: (context) => const PicturePage()));
            break;
          case 'Logout':
            await FirebaseAuth.instance.signOut();

            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const AuthGate()),
            );
            break;
          case 'ToggleSize':
            setState(() {
              isExpanded = !isExpanded; 
            });
            break;
        }
      },
      itemBuilder: (context) => [
        PopupMenuItem(
          enabled: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (user?.displayName != null) Text('Logged in as: ${user!.displayName}'),
              if (user?.email != null) Text(user!.email!, style: const TextStyle(fontSize: 12, color: Colors.grey)),
              const SizedBox(height: 8),
              Text('Battery Level: $_batteryLevel%', style: const TextStyle(fontSize: 12)),
              const Divider(),
            ],
          ),
        ),
        PopupMenuItem(
          value: 'ToggleSize',
          child: Text(isExpanded ? 'Make Menu Smaller' : 'Make Menu Bigger'), 
        ),
        PopupMenuItem(
          value: 'Home',
          child: _buildMenuItem('Home', Icons.home),
        ),
        PopupMenuItem(
          value: 'Meal Order',
          child: _buildMenuItem('Meal Order', Icons.restaurant),
        ),
        PopupMenuItem(
          value: 'Emergency Help',
          child: _buildMenuItem('Emergency Help', Icons.local_hospital),
        ),
        PopupMenuItem(
          value: 'Near Me',
          child: _buildMenuItem('Near Me', Icons.place),
        ),
        PopupMenuItem(
          value: 'Phone Monitoring',
          child: _buildMenuItem('Phone Monitoring', Icons.battery_full),
        ),
        PopupMenuItem(
          value: 'Calendar Events',
          child: _buildMenuItem('Calendar Events', Icons.calendar_today),
        ),
        PopupMenuItem(
          value: 'Take Picture',
          child: _buildMenuItem('Take Picture', Icons.camera_alt),
        ),
        const PopupMenuItem(
          value: 'Logout',
          child: Text('Logout', style: TextStyle(color: Colors.red)),
        ),
      ],
      child: Icon(Icons.menu, size: isExpanded ? 40 : 24), 
    );
  }

  Widget _buildMenuItem(String label, IconData icon) {
    return Row(
      children: [
        Icon(icon, size: isExpanded ? 30 : 20), 
        const SizedBox(width: 10),
        Text(
          label,
          style: TextStyle(fontSize: isExpanded ? 18 : 14), 
        ),
      ],
    );
  }
}
