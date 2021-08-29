import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freelance_booking_app_service/Screens/DoctorScreens/DoctorThird.dart';

class DoctorSecond extends StatefulWidget {
  @override
  _DoctorSecondState createState() => _DoctorSecondState();
}

class _DoctorSecondState extends State<DoctorSecond> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    List<String> _locations = ['AM', 'PM']; // Option 2
    String _fromSelectedFormat, _toSelectedFormat;
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
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
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
                  Container(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Enter details for ',
                            style:
                                TextStyle(fontSize: 22, color: Colors.black)),
                        Container(
                          color: Color(0xff5D5FEF),
                          padding: EdgeInsets.all(3),
                          child: Text('DOCTOR 1',
                              style:
                                  TextStyle(fontSize: 22, color: Colors.white)),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  decoration: BoxDecoration(color: Colors.grey[400]),
                  height: MediaQuery.of(context).size.height * 0.22,
                  width: MediaQuery.of(context).size.width * 0.4,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 40,
                width: 110,
                child: TextButton(
                  onPressed: () {},
                  child: Row(children: [
                    Text('Add Photo', style: TextStyle(color: Colors.white)),
                    Icon(Icons.photo_outlined, color: Colors.white)
                  ]),
                  style:
                      TextButton.styleFrom(backgroundColor: Color(0xff5D5FEF)),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Enter necessary details',
                        style:
                            TextStyle(fontSize: 14, color: Color(0xff5D5FEF))),
                    TextFormField(
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(bottom: -20),
                          hintText: 'Name of the doctor/health professional',
                          hintStyle: TextStyle(fontSize: 12)),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(bottom: -20),
                          hintText: 'Specialised In',
                          hintStyle: TextStyle(fontSize: 12)),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                                contentPadding: EdgeInsets.only(bottom: -20),
                                hintText: 'Years of Experience',
                                hintStyle: TextStyle(fontSize: 12)),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05),
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                                contentPadding: EdgeInsets.only(bottom: -20),
                                hintText: 'Phone Number',
                                hintStyle: TextStyle(fontSize: 12)),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width * 1,
                padding: EdgeInsets.only(left: 20.0),
                child: Text('About doctor',
                    style: TextStyle(fontSize: 14, color: Color(0xff5D5FEF))),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.94,
                child: TextFormField(
                  onChanged: (text) {
                    setState(() {});
                  },
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                    fillColor: Colors.white,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff5D5FEF))),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff5D5FEF))),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 1,
                padding: EdgeInsets.only(left: 20.0),
                child: Text('Add Timing',
                    style: TextStyle(fontSize: 14, color: Color(0xff5D5FEF))),
              ),
              SizedBox(height: 10.0,),
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
                                _weekdays.add('Mon');
                                _weekdays.add('Tue');
                                _weekdays.add('Wed');
                                _weekdays.add('Thu');
                                _weekdays.add('Fri');
                                _weekdays.add('Sat');
                                _weekdays.add('Sun');
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
                                  _weekdays[0] = 'Mon';
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
                                )),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                clicked2 = !clicked2;
                                if (clicked2 == true)
                                  _weekdays[1] = 'Tue';
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
                                  _weekdays[2] = 'Wed';
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
                                  _weekdays[3] = 'Thu';
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
                                  _weekdays[4] = 'Fri';
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
                                  _weekdays[5] = 'Sat';
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
                                  _weekdays[6] = 'Sun';
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
              SizedBox(height: 20.0,),
              FlatButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new DoctorThird()));
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
                      )
                  )
              ),
              SizedBox(height: 20)
            ],
          ),
        ),
      ),
    );
  }
}
