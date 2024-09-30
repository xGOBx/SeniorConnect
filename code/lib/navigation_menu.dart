import 'package:flutter/material.dart';
import 'emergency_help_page.dart';
import 'meal_order_page.dart';
import 'near_me_page.dart';
import 'phone_monitoring_page.dart';
import 'calendar_page.dart';
import 'picture_page.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (value) {
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
        }
      },
      itemBuilder: (context) => [
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
      ],
    );
  }
}
