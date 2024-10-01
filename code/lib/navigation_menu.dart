import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:battery_plus/battery_plus.dart'; 
import 'meal_order_page.dart';
import 'emergency_help_page.dart';
import 'near_me_page.dart';
import 'phone_monitoring_page.dart';
import 'calendar_page.dart';
import 'picture_page.dart';
import 'auth_gate.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  _NavigationMenuState createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  final Battery _battery = Battery(); 
  int _batteryLevel = 100; 

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
          case 'Meal Order':
            Navigator.push(context, MaterialPageRoute(builder: (context) => MealOrderPage()));
            break;
          case 'Emergency Help':
            Navigator.push(context, MaterialPageRoute(builder: (context) => EmergencyHelpPage()));
            break;
          case 'Near Me':
            Navigator.push(context, MaterialPageRoute(builder: (context) => NearMePage()));
            break;
          case 'Phone Monitoring':
            Navigator.push(context, MaterialPageRoute(builder: (context) => PhoneMonitoringPage()));
            break;
          case 'Calendar Events':
            Navigator.push(context, MaterialPageRoute(builder: (context) => CalendarPage()));
            break;
          case 'Take Picture':
            Navigator.push(context, MaterialPageRoute(builder: (context) => PicturePage()));
            break;
          case 'Logout':
            await FirebaseAuth.instance.signOut();

            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const AuthGate()),
            );
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
        const PopupMenuItem(
          value: 'Meal Order',
          child: Text('Meal Order'),
        ),
        const PopupMenuItem(
          value: 'Emergency Help',
          child: Text('Emergency Help'),
        ),
        const PopupMenuItem(
          value: 'Near Me',
          child: Text('Near Me'),
        ),
        const PopupMenuItem(
          value: 'Phone Monitoring',
          child: Text('Phone Monitoring'),
        ),
        const PopupMenuItem(
          value: 'Calendar Events',
          child: Text('Calendar Events'),
        ),
        const PopupMenuItem(
          value: 'Take Picture',
          child: Text('Take Picture'),
        ),
        const PopupMenuItem(
          value: 'Logout',
          child: Text('Logout', style: TextStyle(color: Colors.red)),
        ),
      ],
    );
  }
}
