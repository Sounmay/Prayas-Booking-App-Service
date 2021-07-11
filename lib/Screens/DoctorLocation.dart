import 'package:flutter/material.dart';

class DoctorLocation extends StatefulWidget {
  @override
  _DoctorLocationState createState() => _DoctorLocationState();
}

class _DoctorLocationState extends State<DoctorLocation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Text('HIIIII SNIG!!! DOCTOR', style: TextStyle(fontSize: 40, color: Colors.black),),
      )
    );
  }
}
