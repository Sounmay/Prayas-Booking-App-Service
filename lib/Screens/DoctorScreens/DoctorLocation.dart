import 'dart:ui';

import 'package:flutter/material.dart';

class DoctorLocation extends StatefulWidget {
  @override
  _DoctorLocationState createState() => _DoctorLocationState();
}

class _DoctorLocationState extends State<DoctorLocation> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 40),
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
                              Text('Enter details and ',
                                  style: TextStyle(
                                      fontSize: 22, color: Colors.black)),
                              Row(
                                children: [
                                  Text('location about the ',
                                      style: TextStyle(
                                          fontSize: 22, color: Colors.black)),
                                  Container(
                                    color: Color(0xff5D5FEF),
                                    padding: EdgeInsets.all(3),
                                    child: Text('CLINIC',
                                        style: TextStyle(
                                            fontSize: 22, color: Colors.white)),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40),
                    Text(
                        'Enter details to help customers better locate and get your services.',
                        style:
                            TextStyle(fontSize: 12, color: Color(0xff606572))
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Enter clinic details',
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xff5D5FEF))),
                          TextFormField(
                            decoration: const InputDecoration(
                                contentPadding: EdgeInsets.only(bottom: -20),
                                hintText: 'Clinic name',
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
                                hintText: 'Registered Shop no.',
                                hintStyle: TextStyle(fontSize: 12)),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 40),
                          Text('Clinic location details',
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xff5D5FEF))),
                          TextFormField(
                            decoration: const InputDecoration(
                                contentPadding: EdgeInsets.only(bottom: -20),
                                hintText: 'Address/Floor',
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
                                hintText: 'Area/Street Name/Plot no/Sector.',
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
                                hintText: 'Landmark',
                                hintStyle: TextStyle(fontSize: 12)),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FlatButton(
                            onPressed: () {},
                            child: Row(
                              children: [
                                Text('Set location using the GPS tracker ',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12)),
                                Icon(
                                  Icons.gps_fixed_rounded,
                                  color: Colors.white,
                                )
                              ],
                            ),
                            color: Color(0xff5D5FEF)),
                      ],
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: MediaQuery.of(context).size.width * 1,
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text('About your clinic',
                          style: TextStyle(
                              fontSize: 14, color: Color(0xff5D5FEF))),
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
                          contentPadding: const EdgeInsets.only(
                              left: 10, top: 10, bottom: 10),
                          fillColor: Colors.white,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff5D5FEF))),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff5D5FEF))),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    FlatButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/doctorsecond');
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
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
