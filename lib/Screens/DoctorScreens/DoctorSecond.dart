import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:freelance_booking_app_service/Models/ClinicDetailsModel.dart';
import 'package:freelance_booking_app_service/Models/ParlourDetailsModel.dart';
import 'package:freelance_booking_app_service/Providers/ClinicDetailsProvider.dart';
import 'package:freelance_booking_app_service/Screens/DoctorScreens/DoctorThird.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class DoctorSecond extends StatefulWidget {
  final int id, curr;
  DoctorSecond({this.id, this.curr});
  @override
  _DoctorSecondState createState() => _DoctorSecondState();
}

class _DoctorSecondState extends State<DoctorSecond> {
  final _formKey = GlobalKey<FormState>();

  UploadTask task;
  File file;
  var employeeImage = "";
  String name = "",
      specialization = "",
      yearsOfExperience = "",
      number = "",
      about = "",
      workingDays = "";

  var controller1 = TextEditingController();
  var controller2 = TextEditingController();
  var controller3 = TextEditingController();
  var controller4 = TextEditingController();

  Widget _title(String text) {
    return Row(children: [
      Text(text,
          style: TextStyle(
              color: Color(0xff5D5FEF),
              fontSize: 14,
              fontWeight: FontWeight.bold)),
    ]);
  }

  List<String> _locations = ['AM', 'PM']; // Option 2
  String _fromSelectedFormat, _toSelectedFormat;
  bool _switchValue = false;
  String fromHr = '00', fromMin = '00', toHr = '00', toMin = '00';
  int _servicesNum = 0;
  bool clicked1 = false,
      clicked2 = false,
      clicked3 = false,
      clicked4 = false,
      clicked5 = false,
      clicked6 = false,
      clicked7 = false;
  List<String> _weekdays = ['', '', '', '', '', '', ''];

  var sname = List.filled(20, '', growable: true);
  var hr = List.filled(20, '', growable: true);
  var h = List.filled(20, 0, growable: true);
  var min = List.filled(20, '', growable: true);
  var m = List.filled(20, 0, growable: true);
  var price = List.filled(20, '', growable: true);

  @override
  Widget build(BuildContext context) {
    final sl = MediaQuery.of(context).size.height;
    final sw = MediaQuery.of(context).size.width;
    final clinicLocation = Provider.of<ClinicDetailsProvider>(context);
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
                          child: Text('DOCTOR ${widget.curr}',
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
              // ClipRRect(
              //   borderRadius: BorderRadius.circular(8),
              //   child: Container(
              //     decoration: BoxDecoration(color: Colors.grey[400]),
              //     height: MediaQuery.of(context).size.height * 0.22,
              //     width: MediaQuery.of(context).size.width * 0.4,
              //   ),
              // ),
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.18,
                  width: MediaQuery.of(context).size.width * 0.3,
                  decoration: BoxDecoration(
                      color: Colors.grey[400],
                      image: DecorationImage(
                          image: AssetImage('assets/user.png'))),
                  child: file != null
                      ? Image.file(
                          File(file.path),
                          fit: BoxFit.cover,
                          width: double.infinity,
                        )
                      : null,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 40,
                width: 110,
                child: TextButton(
                  onPressed: () {
                    showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30)),
                        ),
                        context: context,
                        builder: (builder) {
                          return new Container(
                            padding: EdgeInsets.only(top: 10, bottom: 40),
                            height: 170.0,
                            color: Colors.transparent,
                            child: Column(children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: Divider(
                                  thickness: 2.0,
                                  color: Color(0xff5D5FEF),
                                ),
                              ),
                              Text("ADD PHOTO"),
                              Spacer(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          try {
                                            XFile image = await ImagePicker()
                                                .pickImage(
                                                    source:
                                                        ImageSource.gallery);

                                            setState(() {
                                              file = File(image.path);
                                              employeeImage =
                                                  file.path.toString();
                                            });
                                            Navigator.pop(context);
                                          } catch (e) {
                                            print(e.toString());
                                          }
                                        },
                                        child: Icon(
                                          Icons.photo_outlined,
                                          size: 40,
                                          color: Color(0xff5D5FEF),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Text("Photo Gallery")
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          try {
                                            XFile image = await ImagePicker()
                                                .pickImage(
                                                    source: ImageSource.camera);
                                            setState(() {
                                              file = File(image.path);
                                              employeeImage =
                                                  file.path.toString();
                                            });
                                            Navigator.pop(context);
                                          } catch (e) {
                                            print(e.toString());
                                          }
                                        },
                                        child: Icon(
                                          CupertinoIcons.camera,
                                          color: Color(0xff5D5FEF),
                                          size: 40,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Text("Camera")
                                    ],
                                  )
                                ],
                              )
                            ]),
                          );
                        });
                  },
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
                    // Text('Enter necessary details',
                    //     style:
                    //         TextStyle(fontSize: 14, color: Color(0xff5D5FEF))),
                    _title("Enter necessary details"),
                    TextFormField(
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(bottom: -20),
                          hintText: 'Name of the doctor/health professional *',
                          hintStyle: TextStyle(fontSize: 12)),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        print(clinicLocation.doctorDetails.length);
                        setState(() {
                          name = value;
                        });
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(bottom: -20),
                          hintText: 'Specialised In *',
                          hintStyle: TextStyle(fontSize: 12)),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          specialization = value;
                        });
                      },
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                                contentPadding: EdgeInsets.only(bottom: -20),
                                hintText: 'Years of Experience *',
                                hintStyle: TextStyle(fontSize: 12)),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              setState(() {
                                yearsOfExperience = value;
                              });
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
                                hintText: 'Phone Number *',
                                hintStyle: TextStyle(fontSize: 12)),
                            validator: (value) {
                              Pattern pattern = r'^[6-9]{1}[0-9]{9}$';
                              RegExp regex = new RegExp(pattern);
                              if (!regex.hasMatch(value))
                                return 'Please enter valid phone number';
                              return null;
                            },
                            onChanged: (value) {
                              setState(() {
                                number = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: _title("About doctor")),
              SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.94,
                child: TextFormField(
                  onChanged: (text) {
                    setState(() {
                      about = text;
                    });
                  },
                  keyboardType: TextInputType.multiline,
                  maxLines: 3,
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
              SizedBox(
                height: 10.0,
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
//                        CupertinoSwitch(
//                          value: _switchValue,
//                          onChanged: (val) {
//                            setState(() {
//                              _switchValue = val;
//                              clicked1 = val;
//                              clicked2 = val;
//                              clicked3 = val;
//                              clicked4 = val;
//                              clicked5 = val;
//                              clicked6 = val;
//                              clicked7 = val;
//                              if (val == true) {
//                                _weekdays.clear();
//                                _weekdays.add('M');
//                                _weekdays.add('T');
//                                _weekdays.add('W');
//                                _weekdays.add('T');
//                                _weekdays.add('F');
//                                _weekdays.add('S');
//                                _weekdays.add('S');
//                              } else {
//                                _weekdays.clear();
//                              }
//                              print(_weekdays);
//                            });
//                          },
//                        )
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
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        color: Colors.grey)
                                    : BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
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
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        color: Colors.grey)
                                    : BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
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
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        color: Colors.grey)
                                    : BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
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
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        color: Colors.grey)
                                    : BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
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
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        color: Colors.grey)
                                    : BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
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
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        color: Colors.grey)
                                    : BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
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
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        color: Colors.grey)
                                    : BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
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
                height: 20.0,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 1,
                padding: EdgeInsets.only(left: 10.0),
                child: Text('Add Timing',
                    style: TextStyle(fontSize: 20, color: Color(0xff5D5FEF))),
              ),
              SizedBox(
                height: 20.0,
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
                                  maxLength: 2,
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.06),
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      isDense: true,
                                      labelText: '00',
                                      counterText: "",
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.never,
                                      contentPadding: EdgeInsets.only(
                                          left: 5.0, bottom: 10.0)),
                                  onChanged: (val) {
                                    setState(() {
                                      fromHr = val;
                                    });
                                  },
                                  validator: (val) =>
                                      int.parse(val) > 12 ? 'invalid' : null,
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
                                  maxLength: 2,
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.06),
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      isDense: true,
                                      labelText: '00',
                                      counterText: "",
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.never,
                                      contentPadding: EdgeInsets.only(
                                          left: 5.0, bottom: 10.0)),
                                  onChanged: (val) {
                                    setState(() {
                                      fromMin = val;
                                    });
                                  },
                                  validator: (val) =>
                                      int.parse(val) > 59 ? 'invalid' : null,
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
                                  maxLength: 2,
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.06),
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      isDense: true,
                                      labelText: '00',
                                      counterText: "",
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.never,
                                      contentPadding: EdgeInsets.only(
                                          left: 5.0, bottom: 10.0)),
                                  onChanged: (val) {
                                    setState(() {
                                      toHr = val;
                                    });
                                  },
                                  validator: (val) =>
                                      int.parse(val) > 12 ? 'invalid' : null,
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
                                  maxLength: 2,
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).size.width *
                                              0.06),
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      isDense: true,
                                      labelText: '00',
                                      counterText: "",
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.never,
                                      contentPadding: EdgeInsets.only(
                                          left: 5.0, bottom: 10.0)),
                                  onChanged: (val) {
                                    setState(() {
                                      toMin = val;
                                    });
                                  },
                                  validator: (val) =>
                                      int.parse(val) > 59 ? 'invalid' : null,
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
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text('Service details',
                            style: TextStyle(
                                color: Color(0xff5D5FEF),
                                fontSize: 14,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    ...List.generate(
                        _servicesNum, (index) => serviceDeets(index)),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: TextFormField(
                                controller: controller1,
                                validator: (val) =>
                                    val.isEmpty ? 'enter' : null,
                                style: TextStyle(fontSize: 15),
                                decoration: InputDecoration(
                                    errorStyle: TextStyle(fontSize: 10),
                                    isDense: true,
                                    labelText: 'Name of Service',
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.auto,
                                    contentPadding: EdgeInsets.only(bottom: 4)),
                                onChanged: (value) {
                                  setState(() {
                                    sname[_servicesNum] = value;
                                  });
                                },
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: sl * 0.07,
                                    width: sw * 0.08,
                                    child: TextFormField(
                                      controller: controller2,
                                      validator: (val) =>
                                          val.isEmpty || val.length > 2
                                              ? ''
                                              : null,
                                      keyboardType: TextInputType.number,
                                      style: TextStyle(fontSize: 15),
                                      decoration: InputDecoration(
                                        errorStyle: TextStyle(
                                            height: 0,
                                            color: Colors.transparent),
                                        contentPadding: EdgeInsets.all(6),
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
                                      ),
                                      onChanged: (value) {
                                        setState(() {
                                          hr[_servicesNum] = value;
                                          h[_servicesNum] = int.parse(value);
                                        });
                                      },
                                    ),
                                  ),
                                  Text(
                                    ' hr',
                                    style: TextStyle(color: Color(0xff5D5FEF)),
                                  ),
                                  Text(
                                    ' : ',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: sl * 0.07,
                                    width: sw * 0.08,
                                    child: TextFormField(
                                      controller: controller3,
                                      validator: (val) =>
                                          val.isEmpty || val.length > 2
                                              ? ''
                                              : null,
                                      keyboardType: TextInputType.number,
                                      style: TextStyle(fontSize: 15),
                                      decoration: InputDecoration(
                                          errorStyle: TextStyle(height: 0),
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
                                          contentPadding: EdgeInsets.all(6)),
                                      onChanged: (value) {
                                        setState(() {
                                          min[_servicesNum] = value;
                                          m[_servicesNum] = int.parse(value);
                                        });
                                      },
                                    ),
                                  ),
                                  Text(
                                    ' min',
                                    style: TextStyle(color: Color(0xff5D5FEF)),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.08,
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: TextFormField(
                            controller: controller4,
                            validator: (val) => val.isEmpty ? '' : null,
                            keyboardType: TextInputType.number,
                            style: TextStyle(fontSize: 15),
                            decoration: InputDecoration(
                                errorStyle: TextStyle(height: 0),
                                prefixText: '\u20B9  ',
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
                                labelText: 'Price in \u20B9',
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto,
                                contentPadding: EdgeInsets.all(6)),
                            onChanged: (value) {
                              setState(() {
                                price[_servicesNum] = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(children: [
                      TextButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            setState(() {
                              controller1.clear();
                              controller2.clear();
                              controller3.clear();
                              controller4.clear();
                              _servicesNum = _servicesNum + 1;
                            });
                          }

//                          if (_formKey.currentState.validate()) {
//                            setState(() {
//                              controller1.clear();
//                              controller2.clear();
//                              controller3.clear();
//                              controller4.clear();
//                              _servicesNum = _servicesNum + 1;
//                            });
//                          }
                          // print(sname);
                          // print(price);
                          // print(hr);
                          // print(min);
                        },
                        child: Container(
                          padding: EdgeInsets.all(4),
                          color: Color(0xff5D5FEF),
                          child: Row(
                            children: [
                              Text(' Add Service   ',
                                  style: TextStyle(color: Colors.white)),
                              Icon(Icons.add, color: Colors.white, size: 16)
                            ],
                          ),
                        ),
                      ),
                    ]),
                    SizedBox(height: 70),
                  ],
                ),
              ),
              FlatButton(
                  onPressed: () {
                    _weekdays.removeWhere((item) => item == '');
                    controller1.text = " ";
                    controller2.text = " ";
                    controller3.text = " ";
                    controller4.text = " ";
                    if (_servicesNum == 0) {
                      Fluttertoast.showToast(
                          msg: 'Please add atleast one service');
                    } else if (employeeImage == "") {
                      Fluttertoast.showToast(msg: 'Please add doctor image');
                    } else if (_fromSelectedFormat == "PM" &&
                        _toSelectedFormat == "AM")
                      Fluttertoast.showToast(msg: 'Invalid Timing');
                    else if ((_fromSelectedFormat == "AM" &&
                            _toSelectedFormat == "AM") &&
                        ((int.parse(toMin) + (int.parse(toHr) * 60)) <
                            ((int.parse(fromHr) * 60) + int.parse(fromMin)))) {
                      Fluttertoast.showToast(msg: 'Invalid Timing');
                    } else if ((_fromSelectedFormat == "PM" &&
                            _toSelectedFormat == "PM") &&
                        ((int.parse(toMin) + (int.parse(toHr) * 60)) <
                            ((int.parse(fromHr) * 60) + int.parse(fromMin)))) {
                      Fluttertoast.showToast(msg: 'Invalid Timing');
                    } else if (_formKey.currentState.validate() &&
                        employeeImage != "") {
                      List<ParlourServiceDetails> doctorServices = [];
                      for (int i = 0; i < _servicesNum; i++) {
                        doctorServices.add(ParlourServiceDetails(
                          name: sname[i],
                          price: price[i],
                          hour: hr[i],
                          minute: min[i],
                        ));
                      }

                      List<ParlourSlotDetails> slotList = [];

                      ParlourSlotDetails slots = ParlourSlotDetails(
                        fromHr: (_fromSelectedFormat == 'AM' ||
                                int.parse(fromHr) == 12)
                            ? fromHr
                            : (int.parse(fromHr) + 12).toString(),
                        fromMin: fromMin,
                        toHr:
                            (_toSelectedFormat == 'AM' || int.parse(toHr) == 12)
                                ? toHr
                                : (int.parse(toHr) + 12).toString(),
                        toMin: toMin,
                        weekRange: _weekdays.first.toString() +
                            ' - ' +
                            _weekdays.last.toString(),
                      );
                      DoctorDetails _doctorDetails = DoctorDetails(
                          name: name,
                          specialization: specialization,
                          number: number,
                          aboutDoctor: about,
                          yearsOfExperience: yearsOfExperience,
                          imagefile: employeeImage,
                          workingDays: "$_weekdays",
                          serviceList: doctorServices,
                          slot: [slots]);

                      print(_doctorDetails.serviceList);

                      clinicLocation.updateDoctorListDetails(_doctorDetails);
                      // Navigator.pushNamed(context, '/details2',
                      //     arguments: {
                      //       "title": title,
                      //     });
                      final newId = widget.id - 1;
                      final newCurr = widget.curr + 1;
                      if (newId >= 1) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DoctorSecond(id: newId, curr: newCurr)));
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DoctorThird()));
                      }
                    }
                  },
                  child: Container(
                      height: MediaQuery.of(context).size.height * 0.07,
                      width: MediaQuery.of(context).size.width * 0.5,
                      decoration: BoxDecoration(
                        color: _servicesNum == 0
                            ? Color(0xffDFDFDF)
                            : Color(0xFF263238),
                        borderRadius: BorderRadius.circular(2.0),
                      ),
                      child: Center(
                        child: Text(
                          "Save & Proceed",
                          style: TextStyle(color: Colors.white),
                        ),
                      ))),
              SizedBox(height: 20)
            ],
          ),
        ),
      ),
    );
  }

  Widget serviceDeets(int index) {
    return Column(children: [
      SizedBox(height: 10),
      Row(
        children: [
          Container(
            height: 60,
            width: 4,
            color: Color(0xFF3AD48A),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text('Service : '),
                        Text(' ${sname[index]}',
                            style: TextStyle(color: Color(0xff5D5FEF)))
                      ],
                    ),
                    Row(
                      children: [Text('Estimate Time : ')],
                    )
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text('Price : '),
                        Text(' ${price[index]}',
                            style: TextStyle(color: Color(0xff5D5FEF)))
                      ],
                    ),
                    Row(
                      children: [
                        h[index] > 0 && m[index] > 0
                            ? Text('${hr[index]} hour ${min[index]} mins',
                                style: TextStyle(color: Color(0xff5D5FEF)))
                            : m[index] > 0
                                ? Text('${min[index]} mins',
                                    style: TextStyle(color: Color(0xff5D5FEF)))
                                : Text('${hr[index]} hour',
                                    style: TextStyle(color: Color(0xff5D5FEF)))
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.cancel_presentation_outlined),
            color: Color(0xff5D5FEF),
            onPressed: () {
              setState(() {
                sname.removeAt(index);
                hr.removeAt(index);
                min.removeAt(index);
                price.removeAt(index);
                _servicesNum = _servicesNum - 1;
              });
            },
          )
        ],
      ),
      SizedBox(height: 10),
    ]);
  }
}
