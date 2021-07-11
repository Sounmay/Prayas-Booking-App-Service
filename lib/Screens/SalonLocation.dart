import 'package:flutter/material.dart';

class SalonLocation extends StatefulWidget {
  @override
  _SalonLocationState createState() => _SalonLocationState();
}

class _SalonLocationState extends State<SalonLocation> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Center(
          child: Text('HIIIII SNIG!!! SALON', style: TextStyle(fontSize: 40, color: Colors.black),),
        )
    );
  }
}
