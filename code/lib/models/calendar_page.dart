import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'navigation_menu.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  final Map<DateTime, List<String>> _events = {};

  void _addEvent(String event) {
    if (_events[_selectedDay] == null) {
      _events[_selectedDay] = [];
    }
    setState(() {
      _events[_selectedDay]!.add(event);
    });
  }

  void _showEventDialog(bool isDaily) {
    TextEditingController eventController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(isDaily ? 'Create Daily Event' : 'Create One-Time Event'),
          content: TextField(
            controller: eventController,
            decoration: const InputDecoration(hintText: 'Enter event name'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (eventController.text.isNotEmpty) {
                  if (isDaily) {
                    for (int i = 0; i < 30; i++) {
                      _addEvent(eventController.text);
                      _selectedDay = _selectedDay.add(const Duration(days: 1));
                    }
                  } else {
                    _addEvent(eventController.text); 
                  }
                  Navigator.of(context).pop();
                }
              },
              child: const Text('Add Event'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar'),
        actions: const [
          NavigationMenu(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TableCalendar(
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
              calendarFormat: _calendarFormat,
              onFormatChanged: (format) {
                setState(() {
                  _calendarFormat = format;
                });
              },
              eventLoader: (day) {
                return _events[day] ?? [];
              },
            ),
            const SizedBox(height: 20),
            if (_events[_selectedDay] != null)
              ..._events[_selectedDay]!.map((event) => ListTile(
                    title: Text(event),
                  )),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _showEventDialog(true); 
              },
              child: const Text('Create Daily Event'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _showEventDialog(false); 
              },
              child: const Text('Create One-Time Event'),
            ),
          ],
        ),
      ),
    );
  }
}

