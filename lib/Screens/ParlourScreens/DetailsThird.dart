import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freelance_booking_app_service/Models/ParlourDetailsModel.dart';
import 'package:freelance_booking_app_service/Providers/ParlourDetailsProvider.dart';
import 'package:provider/provider.dart';
import 'package:weekday_selector/weekday_selector.dart';

class DetailsThird extends StatefulWidget {
  @override
  _DetailsThirdState createState() => _DetailsThirdState();
}

class _DetailsThirdState extends State<DetailsThird> {
  List<String> _locations = ['AM', 'PM']; // Option 2
  String _fromSelectedFormat, _toSelectedFormat;
  final values = List.filled(7, false);
  bool _switchValue = false;
  String fromHr = '', fromMin = '', toHr = '', toMin = '';

  @override
  Widget build(BuildContext context) {
    final parlourProvider = Provider.of<ParlourDetailsProvider>(context);

    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: SingleChildScrollView(
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
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Enter your Parlour\'s ',
                    style: TextStyle(fontSize: 12, color: Color(0xff606572))),
                Text('opening hours ',
                    style: TextStyle(fontSize: 12, color: Color(0xff5D5FEF))),
                Text('and ',
                    style: TextStyle(fontSize: 12, color: Color(0xff606572))),
                Text('working days. ',
                    style: TextStyle(fontSize: 12, color: Color(0xff5D5FEF))),
              ],
            ),
            SizedBox(
              height: 40.0,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('From',
                          style: TextStyle(
                              fontSize: 12, color: Color(0xff606572))),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            height: 50,
                            width: 45,
                            child: TextFormField(
                              style: TextStyle(fontSize: 30),
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  border: new OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
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
                              onChanged: (val) {
                                setState(() {
                                  fromHr = val;
                                });
                              },
                            ),
                          ),
                          Text(
                            " : ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          SizedBox(
                            height: 50,
                            width: 45,
                            child: TextFormField(
                              style: TextStyle(fontSize: 30),
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  border: new OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
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
                              onChanged: (val) {
                                fromMin = val;
                              },
                            ),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          DropdownButton(
                            hint: Text('AM'), // Not necessary for Option 1
                            value: _fromSelectedFormat,
                            onChanged: (newValue) {
                              setState(() {
                                _fromSelectedFormat = newValue;
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
                  SizedBox(
                    width: 10.0,
                  ),
                  Column(
                    children: [
                      Text('To',
                          style: TextStyle(
                              fontSize: 12, color: Color(0xff606572))),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            height: 50,
                            width: 45,
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              style: TextStyle(fontSize: 30),
                              decoration: InputDecoration(
                                  border: new OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
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
                              onChanged: (val) {
                                setState(() {
                                  toHr = val;
                                });
                              },
                            ),
                          ),
                          Text(
                            " : ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          SizedBox(
                            height: 50,
                            width: 45,
                            child: TextFormField(
                              style: TextStyle(fontSize: 30),
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                  border: new OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
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
                              onChanged: (val) {
                                setState(() {
                                  toMin = val;
                                });
                              },
                            ),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          DropdownButton(
                            hint: Text('AM'), // Not necessary for Option 1
                            value: _toSelectedFormat,
                            onChanged: (newValue) {
                              setState(() {
                                _toSelectedFormat = newValue;
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
            SizedBox(
              height: 20.0,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Working Days ',
                          style: TextStyle(
                              fontSize: 20, color: Color(0xff5D5FEF))),
                      CupertinoSwitch(
                        value: _switchValue,
                        onChanged: (val) {
                          setState(() {
                            _switchValue = val;
                            for (int i = 0; i < values.length; i++) {
                              values[i] = val;
                            }
                          });
                        },
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  WeekdaySelector(
                    elevation: 1,
                    disabledFillColor: Colors.grey[50],
                    selectedFillColor: Colors.white,
                    fillColor: Colors.grey[200],
                    color: Colors.black54,
                    selectedTextStyle: TextStyle(color: Colors.black),
                    disabledTextStyle: TextStyle(color: Colors.black54),
                    textStyle: TextStyle(color: Colors.black54),
                    disabledShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(
                            color: Colors.blue,
                            width: 2,
                            style: BorderStyle.solid)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    selectedShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(
                            color: Colors.blue,
                            width: 2,
                            style: BorderStyle.solid)),
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
            ),
            FlatButton(
                onPressed: () async {
                  if (fromHr != '' &&
                      fromMin != '' &&
                      toHr != '' &&
                      toMin != '') {
                    List<ParlourSlotDetails> slotList = [];

                    ParlourSlotDetails slots = ParlourSlotDetails(
                      fromHr: fromHr,
                      fromMin: fromMin,
                      toHr: toHr,
                      toMin: toMin,
                      weekRange: '',
                    );

                    slotList.add(slots);
                    print(slotList);

                    parlourProvider.updateSlotListDetails(slotList);

                    Navigator.pushNamed(
                      context,
                      '/finalParlourPage',
                    );
                  }
                },
                child: Container(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width * 0.5,
                    decoration: BoxDecoration(
                      color: Color(0xFF263238),
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                    child: Center(
                      child: Text(
                        "Save & Proceed",
                        style: TextStyle(color: Colors.white),
                      ),
                    )))
          ],
        )));
  }
}
