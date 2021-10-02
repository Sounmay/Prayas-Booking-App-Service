import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freelance_booking_app_service/Models/ClinicDetailsModel.dart';
import 'package:freelance_booking_app_service/Providers/ClinicDetailsProvider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class DoctorThird extends StatefulWidget {
  DoctorThird({Key key}) : super(key: key);

  @override
  _DoctorThirdState createState() => _DoctorThirdState();
}

class _DoctorThirdState extends State<DoctorThird> {
  UploadTask task;
  File file;
  var employeeImage = "";
  final _formKey = GlobalKey<FormState>();

  String name = "", post = "", number = "";
  bool _filled = false;

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
                        Text('Set up your admin profile ',
                            style:
                                TextStyle(fontSize: 22, color: Colors.black)),
                        Container(
                          color: Color(0xff5D5FEF),
                          padding: EdgeInsets.all(3),
                          child: Text('CLINIC',
                              style:
                                  TextStyle(fontSize: 22, color: Colors.white)),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
              Text('Admin settings can be changed in the profile section',
                  style: TextStyle(fontSize: 12, color: Color(0xff606572))),
              Text('after clinic registration',
                  style: TextStyle(fontSize: 12, color: Color(0xff606572))),
              SizedBox(height: 20),
              // ClipRRect(
              //   borderRadius: BorderRadius.circular(8),
              //   child: Container(
              //     child: Icon(Icons.person, color: Colors.white, size: 90),
              //     decoration: BoxDecoration(color: Colors.grey[400]),
              //     height: MediaQuery.of(context).size.height * 0.14,
              //     width: MediaQuery.of(context).size.width * 0.22,
              //   ),
              // ),
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.14,
                  width: MediaQuery.of(context).size.width * 0.20,
                  decoration: BoxDecoration(
                      color: Colors.grey[400],
                      image: DecorationImage(
                          image: AssetImage(
                            'assets/user.png',
                          ),
                          fit: BoxFit.contain)),
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
                height: 20,
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Expanded(
                      flex: 8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('Name',
                              style: TextStyle(color: Color(0xff545454))),
                        ],
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(':',
                                style: TextStyle(color: Color(0xff545454))),
                          ],
                        )),
                    Expanded(
                      flex: 8,
                      child: Container(
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hasFloatingPlaceholder: false,
                            contentPadding: EdgeInsets.only(bottom: -50),
                            /*hintText: 'Registered Shop no.',
                              hintStyle: TextStyle(fontSize: 12)*/
                          ),
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
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Expanded(
                      flex: 8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('Phone number',
                              style: TextStyle(color: Color(0xff545454))),
                        ],
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(':',
                                style: TextStyle(color: Color(0xff545454))),
                          ],
                        )),
                    Expanded(
                      flex: 8,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hasFloatingPlaceholder: false,
                            contentPadding: EdgeInsets.only(bottom: -50),
                            /*hintText: 'Registered Shop no.',
                              hintStyle: TextStyle(fontSize: 12)*/
                          ),
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
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Expanded(
                      flex: 8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('Post/Designation',
                              style: TextStyle(color: Color(0xff545454))),
                        ],
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(':',
                                style: TextStyle(color: Color(0xff545454))),
                          ],
                        )),
                    Expanded(
                      flex: 8,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hasFloatingPlaceholder: false,
                            contentPadding: EdgeInsets.only(bottom: -50),
                            /*hintText: 'Registered Shop no.',
                              hintStyle: TextStyle(fontSize: 12)*/
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            setState(() {
                              post = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.14,
              ),
              FlatButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _filled = true;
                      AdminDetails adminDetails = AdminDetails(
                          name: name,
                          number: number,
                          designation: post,
                          imagefile: employeeImage);
                      clinicLocation.updateAdminDetails(adminDetails);
                      Navigator.pushNamed(context, '/doctorfinal');
                    }
                  },
                  child: Container(
                      height: MediaQuery.of(context).size.height * 0.07,
                      width: MediaQuery.of(context).size.width * 0.5,
                      decoration: BoxDecoration(
                        color: _filled == true
                            ? Color(0xFF263238)
                            : Color(0xffDFDFDF),
                        borderRadius: BorderRadius.circular(2.0),
                      ),
                      child: Center(
                        child: Text(
                          "Save & Proceed",
                          style: TextStyle(color: Colors.white),
                        ),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
