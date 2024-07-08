import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  @override
  Widget build(BuildContext context) => TableCalendar(
        firstDay: DateTime.utc(2010, 10, 16),
        lastDay: DateTime.utc(2030, 3, 14),
        headerVisible: true,
        headerStyle:
            const HeaderStyle(titleCentered: true, formatButtonVisible: true),
        daysOfWeekStyle: const DaysOfWeekStyle(
          weekdayStyle: TextStyle(color: Colors.amber),
          weekendStyle: TextStyle(color: Colors.red),
        ),
        calendarStyle: CalendarStyle(
          todayDecoration: const BoxDecoration(color: Colors.amber),
          selectedDecoration: BoxDecoration(color: Colors.amber.shade200),
        ),
        focusedDay: _focusedDay,
        selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
        onDaySelected: _onDaySelected,
        calendarFormat: _calendarFormat,
        onFormatChanged: _onFormatChanged,
      );

  _onDaySelected(selectedDay, focuseDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focuseDay;
      });
    }
  }

 void _onFormatChanged(CalendarFormat format) {
  setState(() {
    _calendarFormat = format;
    if (_calendarFormat == CalendarFormat.month) {
      _focusedDay = _selectedDay ?? DateTime.now();
    }
  });
}

}
