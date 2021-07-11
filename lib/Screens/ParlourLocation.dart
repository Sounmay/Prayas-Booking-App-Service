import 'package:flutter/material.dart';

class ParlourLocation extends StatefulWidget {
  @override
  _ParlourLocationState createState() => _ParlourLocationState();
}

class _ParlourLocationState extends State<ParlourLocation> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Center(
          child: Text('HIIIII SNIG!!! PARLOUR', style: TextStyle(fontSize: 40, color: Colors.black),),
        )
    );
  }
}
