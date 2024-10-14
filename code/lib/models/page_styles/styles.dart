import 'package:flutter/material.dart';

class AppStyles {
  // General button styles
  static const Color mealButtonColor = Colors.orangeAccent;
  static const Color emergencyButtonColor = Colors.redAccent;
  static const Color contactFamilyButtonColor = Colors.orangeAccent;
  static const Color findPlacesButtonColor = Colors.greenAccent;
  static const Color pictureButtonColor = Colors.blueAccent;
  static const Color calendarButtonColor = Colors.purpleAccent;
  static const Color seekingHelpButtonColor = Colors.pinkAccent;
  static const Color defaultButtonColor = Colors.white;
  static const Color batteryButtonColor = Color.fromARGB(255, 105, 189, 97); 

  // General button settings
  static const double buttonPadding = 16.0;
  static const double buttonSpacing = 20.0;
  static const double iconSize = 40.0;

  // Text style for buttons
  static const TextStyle buttonTextStyle = TextStyle(
    fontSize: 18,
    color: Colors.white, 
  );

  // Text style for selected meals or status
  static const TextStyle mealSelectedTextStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  // Padding for pages
  static const double pagePadding = 16.0;

  // Button shape
  static const RoundedRectangleBorder buttonShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
  );

  // Text style for battery status
  static const TextStyle batteryTextStyle = TextStyle(
    fontSize: 24,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  // Text style for low battery warning
  static const TextStyle batteryWarningTextStyle = TextStyle(
    fontSize: 18,
    color: Colors.red,
    fontWeight: FontWeight.bold,
  );

  // ---------------------------- Phone Monitoring Page Specific ----------------------------
  
  // Background color for Phone Monitoring Page
  static const Color phoneMonitoringBackgroundColor = Colors.white;

  // Button style for Test Warning Sound button
  static ButtonStyle phoneTestButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: Colors.transparent, 
    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
    ),
    elevation: 0,
  );

  static const TextStyle phoneTestButtonTextStyle = TextStyle(
    fontSize: 18,
    color: Colors.blueAccent, 
    decoration: TextDecoration.underline,
  );
}
