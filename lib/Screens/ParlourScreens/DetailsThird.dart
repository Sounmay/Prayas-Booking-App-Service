import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freelance_booking_app_service/Models/ParlourDetailsModel.dart';
import 'package:freelance_booking_app_service/Providers/ParlourDetailsProvider.dart';
import 'package:provider/provider.dart';

class DetailsThird extends StatefulWidget {
  @override
  _DetailsThirdState createState() => _DetailsThirdState();
}

class _DetailsThirdState extends State<DetailsThird> {
  List<String> _locations = ['AM', 'PM']; // Option 2
  String _fromSelectedFormat = 'AM', _toSelectedFormat = 'AM';
  bool _switchValue = false;
  String fromHr = '', fromMin = '', toHr = '', toMin = '';
  bool clicked1 = false,
      clicked2 = false,
      clicked3 = false,
      clicked4 = false,
      clicked5 = false,
      clicked6 = false,
      clicked7 = false;
  List<String> _weekdays = ['', '', '', '', '', '', ''];

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context).settings.arguments as Map<dynamic, dynamic>;
    final title = args["title"];
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
                Text('Enter your $title\'s ',
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
              width: MediaQuery.of(context).size.width * 1,
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
                          Container(
                              height: MediaQuery.of(context).size.width * 0.1,
                              width: MediaQuery.of(context).size.width * 0.1,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  border: Border.all(color: Colors.black)),
                              child: TextFormField(
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.06),
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    isDense: true,
                                    labelText: '00',
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                    contentPadding: EdgeInsets.only(
                                        left: 5.0, bottom: 10.0)),
                                onChanged: (val) {
                                  setState(() {
                                    fromHr = val;
                                  });
                                },
                              )),
                          Text(
                            " : ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Container(
                              height: MediaQuery.of(context).size.width * 0.1,
                              width: MediaQuery.of(context).size.width * 0.1,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  border: Border.all(color: Colors.black)),
                              child: TextFormField(
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.06),
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    isDense: true,
                                    labelText: '00',
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                    contentPadding: EdgeInsets.only(
                                        left: 5.0, bottom: 10.0)),
                                onChanged: (val) {
                                  setState(() {
                                    fromMin = val;
                                  });
                                },
                              )),
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
                          Container(
                              height: MediaQuery.of(context).size.width * 0.1,
                              width: MediaQuery.of(context).size.width * 0.1,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  border: Border.all(color: Colors.black)),
                              child: TextFormField(
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.06),
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    isDense: true,
                                    labelText: '00',
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                    contentPadding: EdgeInsets.only(
                                        left: 5.0, bottom: 10.0)),
                                onChanged: (val) {
                                  setState(() {
                                    toHr = val;
                                  });
                                },
                              )),
                          Text(
                            " : ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Container(
                              height: MediaQuery.of(context).size.width * 0.1,
                              width: MediaQuery.of(context).size.width * 0.1,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  border: Border.all(color: Colors.black)),
                              child: TextFormField(
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width *
                                            0.06),
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    isDense: true,
                                    labelText: '00',
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                    contentPadding: EdgeInsets.only(
                                        left: 5.0, bottom: 10.0)),
                                onChanged: (val) {
                                  setState(() {
                                    toMin = val;
                                  });
                                },
                              )),
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
                            clicked1 = val;
                            clicked2 = val;
                            clicked3 = val;
                            clicked4 = val;
                            clicked5 = val;
                            clicked6 = val;
                            clicked7 = val;
                            if (val == true) {
                              _weekdays.clear();
                              _weekdays.add('M');
                              _weekdays.add('T');
                              _weekdays.add('W');
                              _weekdays.add('T');
                              _weekdays.add('F');
                              _weekdays.add('S');
                              _weekdays.add('S');
                            } else {
                              _weekdays.clear();
                            }
                            print(_weekdays);
                          });
                        },
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              clicked1 = !clicked1;
                              if (clicked1 == true)
                                _weekdays[0] = 'M';
                              else
                                _weekdays[0] = '';
                            });
                          },
                          child: Container(
                              height: 40,
                              width: 50,
                              decoration: (clicked1 == false)
                                  ? BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      color: Colors.grey)
                                  : BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      color: Colors.blue),
                              child: Center(
                                child: Text(
                                  "Mon",
                                  style: TextStyle(color: Colors.white),
                                ),
                              )
                          ),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              clicked2 = !clicked2;
                              if (clicked2 == true)
                                _weekdays[1] = 'T';
                              else
                                _weekdays[1] = '';
                            });
                          },
                          child: Container(
                              height: 40,
                              width: 50,
                              decoration: (clicked2 == false)
                                  ? BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      color: Colors.grey)
                                  : BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      color: Colors.blue),
                              child: Center(
                                child: Text(
                                  "Tue",
                                  style: TextStyle(color: Colors.white),
                                ),
                              )),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              clicked3 = !clicked3;
                              if (clicked3 == true)
                                _weekdays[2] = 'W';
                              else
                                _weekdays[2] = '';
                            });
                          },
                          child: Container(
                              height: 40,
                              width: 50,
                              decoration: (clicked3 == false)
                                  ? BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      color: Colors.grey)
                                  : BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      color: Colors.blue),
                              child: Center(
                                child: Text(
                                  "Wed",
                                  style: TextStyle(color: Colors.white),
                                ),
                              )),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              clicked4 = !clicked4;
                              if (clicked4 == true)
                                _weekdays[3] = 'T';
                              else
                                _weekdays[3] = '';
                            });
                          },
                          child: Container(
                              height: 40,
                              width: 50,
                              decoration: (clicked4 == false)
                                  ? BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      color: Colors.grey)
                                  : BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      color: Colors.blue),
                              child: Center(
                                child: Text(
                                  "Thu",
                                  style: TextStyle(color: Colors.white),
                                ),
                              )),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              clicked5 = !clicked5;
                              if (clicked5 == true)
                                _weekdays[4] = 'F';
                              else
                                _weekdays[4] = '';
                            });
                          },
                          child: Container(
                              height: 40,
                              width: 50,
                              decoration: (clicked5 == false)
                                  ? BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      color: Colors.grey)
                                  : BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      color: Colors.blue),
                              child: Center(
                                child: Text(
                                  "Fri",
                                  style: TextStyle(color: Colors.white),
                                ),
                              )),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              clicked6 = !clicked6;
                              if (clicked6 == true)
                                _weekdays[5] = 'S';
                              else
                                _weekdays[5] = '';
                            });
                          },
                          child: Container(
                              height: 40,
                              width: 50,
                              decoration: (clicked6 == false)
                                  ? BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      color: Colors.grey)
                                  : BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      color: Colors.blue),
                              child: Center(
                                child: Text(
                                  "Sat",
                                  style: TextStyle(color: Colors.white),
                                ),
                              )),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              clicked7 = !clicked7;
                              if (clicked7 == true)
                                _weekdays[6] = 'S';
                              else
                                _weekdays[6] = '';
                            });
                          },
                          child: Container(
                              height: 40,
                              width: 50,
                              decoration: (clicked7 == false)
                                  ? BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      color: Colors.grey)
                                  : BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      color: Colors.blue),
                              child: Center(
                                child: Text(
                                  "Sun",
                                  style: TextStyle(color: Colors.white),
                                ),
                              )),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            FlatButton(
                onPressed: () async {
                  _weekdays.removeWhere((item) => item == '');
                  if (fromHr != '' &&
                      fromMin != '' &&
                      toHr != '' &&
                      toMin != '') {
                    List<ParlourSlotDetails> slotList = [];

                    ParlourSlotDetails slots = ParlourSlotDetails(
                      fromHr: (_fromSelectedFormat=='AM')?fromHr:(int.parse(fromHr)+12).toString(),
                      fromMin: fromMin,
                      toHr: (_toSelectedFormat=='AM')?toHr:(int.parse(toHr)+12).toString(),
                      toMin: toMin,
                      weekRange: _weekdays.toString(),
                    );

                    slotList.add(slots);
                    print(slotList);

                    parlourProvider.updateSlotListDetails(slotList);

                    Navigator.pushNamed(context, '/finalParlourPage',
                        arguments: {"title": title});
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
