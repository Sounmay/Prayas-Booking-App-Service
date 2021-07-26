import 'dart:ui';

import 'package:table_calendar/table_calendar.dart';
import 'package:flutter/material.dart';

class Schedule extends StatefulWidget {
  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  String name = "Ramesh";
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.utc(1989);
  CalendarFormat _calendarFormat = CalendarFormat.month;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
        children: [
          Container(
            height: 100,
            color: Color(0xFF0F2735),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 40),
                      Text(
                        'Hello !!',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(name, style: TextStyle(color: Colors.white))
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(height: 35),
                      CircleAvatar(
                          radius: 20,
                          foregroundImage: AssetImage('assets/doctor 3.png')),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Schedule',
            style: TextStyle(color: Color(0xFF0F2735)),
          ),
          SizedBox(height: 20),
          TableCalendar(
            headerStyle: HeaderStyle(
                titleCentered: true,
                titleTextStyle: TextStyle(color: Colors.blue[700])),
            weekendDays: [DateTime.sunday],
            availableCalendarFormats: {_calendarFormat: 'Month'},
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay; // update `_focusedDay` here as well
              });
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
            calendarFormat: _calendarFormat,
            onFormatChanged: (format) {
              setState(() {
                _calendarFormat = format;
              });
            },
            calendarStyle: CalendarStyle(
                weekendTextStyle: TextStyle(color: Colors.blue[700]),
                defaultTextStyle: TextStyle(color: Colors.blue[700]),
                todayDecoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue[100],
                ),
                todayTextStyle: TextStyle(color: Colors.black),
                selectedTextStyle: TextStyle(color: Colors.black),
                selectedDecoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.pink[50],
                ),
                withinRangeDecoration: BoxDecoration(color: Colors.white)),
          ),
        ],
      ),
    ));
  }
}
