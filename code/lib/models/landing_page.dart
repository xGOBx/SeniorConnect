import 'package:_917592768_a1_f24/models/Page%20Styles/custom_widgets.dart';
import 'package:_917592768_a1_f24/utils/auth_gate.dart';
import 'package:flutter/material.dart';
import 'meal_order_page.dart';
import 'emergency_help_page.dart';
import 'near_me_page.dart';
import 'phone_monitoring_page.dart';
import 'calendar_page.dart';
import 'picture_page.dart';
import 'seeking_help_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:_917592768_a1_f24/models/Page%20Styles/styles.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;

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
        child: Column(
          children: [
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                childAspectRatio: 1.4,
                children: [
                  HomeOptionButton(
                    icon: Icons.restaurant,
                    label: 'Order Meal',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MealOrderPage()),
                      );
                    },
                    color: AppStyles.mealButtonColor,
                  ),
                  HomeOptionButton(
                    icon: Icons.local_hospital,
                    label: 'Emergency Help',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const EmergencyHelpPage()),
                      );
                    },
                    color: AppStyles.emergencyButtonColor,
                  ),
                  HomeOptionButton(
                    icon: Icons.place,
                    label: 'Find Interesting Places',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const NearMePage()),
                      );
                    },
                    color: AppStyles.findPlacesButtonColor,
                  ),
                  HomeOptionButton(
                    icon: Icons.camera_alt,
                    label: 'Take Picture',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const PicturePage()),
                      );
                    },
                    color: AppStyles.pictureButtonColor,
                  ),
                  HomeOptionButton(
                    icon: Icons.calendar_today,
                    label: 'Calendar Events',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const CalendarPage()),
                      );
                    },
                    color: AppStyles.calendarButtonColor,
                  ),
                  HomeOptionButton(
                    icon: Icons.battery_full,
                    label: 'Monitor Phone Battery',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PhoneMonitoringPage()),
                      );
                    },
                    color: AppStyles.batteryButtonColor,
                  ),
                  HomeOptionButton(
                    icon: Icons.help_outline,
                    label: 'Seeking Other Help',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SeekingHelpPage()),
                      );
                    },
                    color: AppStyles.seekingHelpButtonColor,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'Logged in as ${user?.displayName ?? 'User'} | ${user?.email ?? 'N/A'}',
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
