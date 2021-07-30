import 'package:flutter/material.dart';
import 'package:freelance_booking_app_service/Screens/OTPScreen.dart';
import 'package:freelance_booking_app_service/Screens/Schedule.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;

  final List<Widget> _children = [Schedule(), OTPScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: _children[_currentIndex],
      body: IndexedStack(
        index: _currentIndex,
        children: _children,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'calendar',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.ac_unit),
              label: 'calendar',
              backgroundColor: Colors.blue)
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
