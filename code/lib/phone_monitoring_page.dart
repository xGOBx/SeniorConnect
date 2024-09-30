import 'package:flutter/material.dart';
import 'package:battery_plus/battery_plus.dart'; 

class PhoneMonitoringPage extends StatefulWidget {
  @override
  _PhoneMonitoringPageState createState() => _PhoneMonitoringPageState();
}

class _PhoneMonitoringPageState extends State<PhoneMonitoringPage> {
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Phone Monitoring'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Battery Level: $_batteryLevel%',
              style: const TextStyle(fontSize: 24),
            ),
            if (_batteryLevel < 20)
              const Text(
                'Warning: Battery is low!',
                style: TextStyle(color: Colors.red, fontSize: 18),
              ),
          ],
        ),
      ),
    );
  }
}
