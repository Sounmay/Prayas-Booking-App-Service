import 'package:flutter/material.dart';
import 'package:freelance_booking_app_service/Screens/OTPScreen.dart';
import 'package:freelance_booking_app_service/Screens/Schedule.dart';

class BottomNavBar extends StatelessWidget {
  int _currentIndex = 0;
  final List<Widget> _children = [
    OTPScreen(),
    Schedule()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
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
              backgroundColor: Colors.blue
          )
        ],
        onTap: (index){
          setState(){
            _currentIndex=index;
          }
        },
      ),
    );
  }
}



