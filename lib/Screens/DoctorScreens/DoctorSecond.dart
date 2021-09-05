import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freelance_booking_app_service/Models/ClinicDetailsModel.dart';
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
                  height: MediaQuery.of(context).size.height * 0.22,
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
                                            // print(file.path
                                            //     .toString());
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
                                            });
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
                          hintText: 'Name of the doctor/health professional',
                          hintStyle: TextStyle(fontSize: 12)),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          name = value;
                        });
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
                                hintText: 'Years of Experience',
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
                                hintText: 'Phone Number',
                                hintStyle: TextStyle(fontSize: 12)),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter some text';
                              }
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
                                fontSize: 20, color: Color(0xff5D5FEF)
                            )
                        ),
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
              FlatButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      DoctorDetails _doctorDetails = DoctorDetails(
                          name: name,
                          specialization: specialization,
                          number: number,
                          aboutDoctor: about,
                          yearsOfExperience: yearsOfExperience,
                          imagefile: employeeImage,
                          workingDays: _weekdays.first.toString() + ' - ' + _weekdays.last.toString(),
                      );

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
                        color: Color(0xFF263238),
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
}
