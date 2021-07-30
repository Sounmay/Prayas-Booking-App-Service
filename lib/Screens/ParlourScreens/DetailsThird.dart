import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weekday_selector/weekday_selector.dart';


class DetailsThird extends StatefulWidget {
  @override
  _DetailsThirdState createState() => _DetailsThirdState();
}

class _DetailsThirdState extends State<DetailsThird> {

  List<String> _locations = ['AM', 'PM']; // Option 2
  String _selectedLocation;
  final values = List.filled(7, true);
  bool _switchValue=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                      height: 60,
                      width: 10,
                      decoration: BoxDecoration(
                          color: Color(0xff5D5FEF),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10)))),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text('Add your working hours ',
                            style: TextStyle(fontSize: 22, color: Colors.black)),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 20.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      'Enter your Parlour\'s ',
                      style:
                      TextStyle(fontSize: 12, color: Color(0xff606572))
                  ),
                  Text(
                      'opening hours ',
                      style:
                      TextStyle(fontSize: 12, color: Color(0xff5D5FEF))
                  ),
                  Text(
                      'and ',
                      style:
                      TextStyle(fontSize: 12, color: Color(0xff606572))
                  ),
                  Text(
                      'working days. ',
                      style:
                      TextStyle(fontSize: 12, color: Color(0xff5D5FEF))
                  ),
                ],
              ),
              SizedBox(height: 40.0,),
              Container(
                margin: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                            'From',
                            style:
                            TextStyle(fontSize: 12, color: Color(0xff606572))
                        ),
                        SizedBox(height: 10.0,),
                        Row(
                          children: [
                            SizedBox(
                              height: 50,
                              width: 45,
                              child: TextFormField(
                                style: TextStyle(fontSize: 30),
                                decoration: InputDecoration(
                                    border: new OutlineInputBorder(
                                      borderRadius:
                                      const BorderRadius.all(
                                        const Radius.circular(5.0),
                                      ),
                                      borderSide: new BorderSide(
                                        color: Colors.black,
                                        width: 1.0,
                                      ),
                                    ),
                                    isDense: true,
                                    labelText: '00',
                                    floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                    contentPadding: EdgeInsets.all(4)),
                              ),
                            ),
                            Text(" : ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                            SizedBox(
                              height: 50,
                              width: 45,
                              child: TextFormField(
                                style: TextStyle(fontSize: 30),
                                decoration: InputDecoration(
                                    border: new OutlineInputBorder(
                                      borderRadius:
                                      const BorderRadius.all(
                                        const Radius.circular(5.0),
                                      ),
                                      borderSide: new BorderSide(
                                        color: Colors.black,
                                        width: 1.0,
                                      ),
                                    ),
                                    isDense: true,
                                    labelText: '00',
                                    floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                    contentPadding: EdgeInsets.all(4)),
                              ),
                            ),
                            SizedBox(width: 20.0,),
                            DropdownButton(
                              hint: Text('AM'), // Not necessary for Option 1
                              value: _selectedLocation,
                              onChanged: (newValue) {
                                setState(() {
                                  _selectedLocation = newValue;
                                });
                              },
                              items: _locations.map((location) {
                                return DropdownMenuItem(
                                  child: new Text(location),
                                  value: location,
                                );
                              }).toList(),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(width: 10.0,),
                    Column(
                      children: [
                        Text(
                            'To',
                            style:
                            TextStyle(fontSize: 12, color: Color(0xff606572))
                        ),
                        SizedBox(height: 10.0,),
                        Row(
                          children: [
                            SizedBox(
                              height: 50,
                              width: 45,
                              child: TextFormField(
                                style: TextStyle(fontSize: 30),
                                decoration: InputDecoration(
                                    border: new OutlineInputBorder(
                                      borderRadius:
                                      const BorderRadius.all(
                                        const Radius.circular(5.0),
                                      ),
                                      borderSide: new BorderSide(
                                        color: Colors.black,
                                        width: 1.0,
                                      ),
                                    ),
                                    isDense: true,
                                    labelText: '00',
                                    floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                    contentPadding: EdgeInsets.all(4)),
                              ),
                            ),
                            Text(" : ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                            SizedBox(
                              height: 50,
                              width: 45,
                              child: TextFormField(
                                style: TextStyle(fontSize: 30),
                                decoration: InputDecoration(
                                    border: new OutlineInputBorder(
                                      borderRadius:
                                      const BorderRadius.all(
                                        const Radius.circular(5.0),
                                      ),
                                      borderSide: new BorderSide(
                                        color: Colors.black,
                                        width: 1.0,
                                      ),
                                    ),
                                    isDense: true,
                                    labelText: '00',
                                    floatingLabelBehavior:
                                    FloatingLabelBehavior.never,
                                    contentPadding: EdgeInsets.all(4)),
                              ),
                            ),
                            SizedBox(width: 20.0,),
                            DropdownButton(
                              hint: Text('AM'), // Not necessary for Option 1
                              value: _selectedLocation,
                              onChanged: (newValue) {
                                setState(() {
                                  _selectedLocation = newValue;
                                });
                              },
                              items: _locations.map((location) {
                                return DropdownMenuItem(
                                  child: new Text(location),
                                  value: location,
                                );
                              }).toList(),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 20.0,),
              Container(
                margin: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            'Working Days ',
                            style:
                            TextStyle(fontSize: 20, color: Color(0xff5D5FEF))
                        ),
                        CupertinoSwitch(
                          value: _switchValue,
                          onChanged: (value) {
                            setState(() {
                              _switchValue = value;
                            });
                          },
                        )
                      ],
                    ),
                    SizedBox(height: 10.0,),
                    WeekdaySelector(
                      onChanged: (int day) {
                        setState(() {
                          final index = day % 7;
                          values[index] = !values[index];
                        });
                      },
                      values: values,
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      )
    );
  }
}