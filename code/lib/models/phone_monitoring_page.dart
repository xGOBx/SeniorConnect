import 'package:flutter/material.dart';
import 'package:battery_plus/battery_plus.dart';
import 'package:audioplayers/audioplayers.dart';
import 'navigation_menu.dart';
import 'package:project1_mobdev_gaven_pearl_917592768/models/page_styles/styles.dart';

class PhoneMonitoringPage extends StatefulWidget {
  const PhoneMonitoringPage({super.key});

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
      body: Container(
        color: AppStyles.phoneMonitoringBackgroundColor,  
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Battery Level: $_batteryLevel%',
                style: AppStyles.batteryTextStyle,  
              ),
              if (_batteryLevel < 20)
                const Text(
                  'Warning: Battery is low!',
                  style: AppStyles.batteryWarningTextStyle, 
                ),
              const SizedBox(height: AppStyles.buttonSpacing),
              ElevatedButton(
                onPressed: _playWarningSound,
                style: AppStyles.phoneTestButtonStyle,
                child: const Text(
                  'Test Warning Sound',
                  style: AppStyles.phoneTestButtonTextStyle,  
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
