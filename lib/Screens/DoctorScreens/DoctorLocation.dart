import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freelance_booking_app_service/Models/ClinicDetailsModel.dart';
import 'package:freelance_booking_app_service/Models/ParlourDetailsModel.dart';
import 'package:freelance_booking_app_service/Providers/ClinicDetailsProvider.dart';
import 'package:freelance_booking_app_service/Screens/DoctorScreens/DoctorSecond.dart';
import 'package:freelance_booking_app_service/Utils/sharedPreferencesForm.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:random_string/random_string.dart';

class DoctorLocation extends StatefulWidget {
  @override
  _DoctorLocationState createState() => _DoctorLocationState();
}

class _DoctorLocationState extends State<DoctorLocation> {
  final _formKey = GlobalKey<FormState>();

  String clinicName = "",
      shopNo = "",
      address = "",
      about = "",
      area = "",
      landmark = "";
  String lati, longi;
  String _numOfEmployees = "";
  String status = "Pending";

  Widget radioButton(String label, String groupValue) {
    return Row(
      children: [
        SizedBox(
          height: 30,
          width: 30,
          child: Radio(
              value: label,
              groupValue: groupValue,
              onChanged: (value) {
                setState(() {
                  _numOfEmployees = value;
                });
              }),
        ),
        Text(label)
      ],
    );
  }

  void locatePosition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      lati = position.latitude.toString();
      longi = position.longitude.toString();
    });
    print(position == null
        ? 'Unknown'
        : 'Latitude : ' + lati + ', ' + 'Longitude : ' + longi);
  }

  String serviceid = FirebaseAuth.instance.currentUser.uid;

  bool setGPS = false;

  Widget _title(String text) {
    return Row(children: [
      Text(text,
          style: TextStyle(
              color: Color(0xff5D5FEF),
              fontSize: 14,
              fontWeight: FontWeight.bold)),
    ]);
  }

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
                            TextStyle(fontSize: 12, color: Color(0xff606572))),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _title("Enter clinic details"),
                          // Text('Enter clinic details',
                          //     style: TextStyle(
                          //         fontSize: 14, color: Color(0xff5D5FEF))),
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
                            onChanged: (value) {
                              setState(() {
                                clinicName = value;
                              });
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
                            onChanged: (value) {
                              setState(() {
                                shopNo = value;
                              });
                            },
                          ),
                          SizedBox(height: 40),
                          _title("Clinic location details"),
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
                            onChanged: (value) {
                              setState(() {
                                address = value;
                              });
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
                            onChanged: (value) {
                              setState(() {
                                area = value;
                              });
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
                            onChanged: (value) {
                              setState(() {
                                landmark = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FlatButton(
                            onPressed: () {
                              setGPS = true;
                              locatePosition();
                            },
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
                    SizedBox(height: 10),
                    Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: _title("Number of Doctors")),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        radioButton('1', _numOfEmployees),
                        radioButton('2', _numOfEmployees),
                        radioButton('3', _numOfEmployees),
                        radioButton('4', _numOfEmployees),
                        radioButton('5', _numOfEmployees),
                        radioButton('6', _numOfEmployees),
                      ],
                    ),
                    SizedBox(height: 20),
                    Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: _title("About your clinic")),
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
                        onPressed: () async {
                          print(_numOfEmployees);
                          if (_formKey.currentState.validate() &&
                              _numOfEmployees != "" &&
                              lati != null &&
                              longi != null) {
                                  String sUid = randomAlphaNumeric(6);

                            ClinicLocationAndDoctor _location =
                                ClinicLocationAndDoctor(
                                    serviceUid: serviceid,
                                    clinicName: clinicName,
                                    shopNo: shopNo,
                                    address: '$address, $area, $landmark',
                                    latitude: lati,
                                    longitude: longi,
                                    aboutClinic: about ?? '',
                                    status: status,
                                    servId: sUid
                                );

                            clinicLocation
                                .updateClinicLocationAndDoctor(_location);

                            try {
                              await SharedPreferencesForm.setAddressFormDetails(
                                  [address, area, landmark]);
                            } catch (e) {
                              print(e.toString());
                            }
                            print(
                                clinicLocation.clinicLocationAndDoctorDetails);

                            //code to uncomment
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DoctorSecond(
                                          id: int.parse(_numOfEmployees),
                                          curr: 1,
                                        )));
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
                ),
              ),
            )),
      ),
    );
  }
}
