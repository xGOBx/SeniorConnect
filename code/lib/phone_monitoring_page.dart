import 'package:flutter/material.dart';
import 'package:battery_plus/battery_plus.dart';
import 'package:audioplayers/audioplayers.dart';
import 'navigation_menu.dart';

class PhoneMonitoringPage extends StatefulWidget {
  @override
  _PhoneMonitoringPageState createState() => _PhoneMonitoringPageState();
}

class _PhoneMonitoringPageState extends State<PhoneMonitoringPage> {
  final Battery _battery = Battery(); 
  final AudioPlayer _audioPlayer = AudioPlayer();  
  int _batteryLevel = 100;
  bool _playedWarning = false;

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

    if (_batteryLevel < 20 && !_playedWarning) {
      _playWarningSound();
      _playedWarning = true;
    }
  }

  Future<void> _playWarningSound() async {
    await _audioPlayer.setSourceAsset('sounds/battery_warning.mp3');  
    await _audioPlayer.resume();  
  }

  @override
  void dispose() {
    _audioPlayer.dispose(); 
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Phone Monitoring'),
        actions: const [
          NavigationMenu(),  
        ],
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
            ElevatedButton(
              onPressed: _playWarningSound,
              child: const Text('Test Warning Sound'),
            ),
          ],
        ),
      ),
    );
  }
}
