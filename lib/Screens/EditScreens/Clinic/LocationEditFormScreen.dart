import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freelance_booking_app_service/Models/ClinicDetailsModel.dart';
import 'package:provider/provider.dart';

class ClinicLocationEditForm extends StatefulWidget {
  const ClinicLocationEditForm({Key key}) : super(key: key);

  @override
  _ClinicLocationEditFormState createState() => _ClinicLocationEditFormState();
}

class _ClinicLocationEditFormState extends State<ClinicLocationEditForm> {
  Widget _title(String text) {
    return Row(children: [
      Text(text,
          style: TextStyle(
              color: Color(0xff5D5FEF),
              fontSize: 14,
              fontWeight: FontWeight.bold)),
    ]);
  }

  final _formKey = GlobalKey<FormState>();

  String name = "", shopNo = "", address = "", about = "";

  ClinicLocationAndDoctor clinicLocation;
  bool loading = true;

  _fetchData() async {
    try {
      String uid = FirebaseAuth.instance.currentUser.uid;
      final res = await FirebaseFirestore.instance
          .collection("MedicalServices")
          .doc(uid)
          .get();

      setState(() {
        clinicLocation =
            ClinicLocationAndDoctor.fromJson(res.data()["location"]);
        name = clinicLocation.clinicName;
        shopNo = clinicLocation.shopNo;
        address = clinicLocation.address;
        about = clinicLocation.aboutClinic;
        loading = false;
      });
    } catch (e) {}
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? Scaffold(
            appBar: AppBar(),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [CircularProgressIndicator()],
              ),
            ),
          )
        : Scaffold(
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
                                                fontSize: 22,
                                                color: Colors.black)),
                                        Container(
                                          color: Color(0xff5D5FEF),
                                          padding: EdgeInsets.all(3),
                                          child: Text('CLINIC',
                                              style: TextStyle(
                                                  fontSize: 22,
                                                  color: Colors.white)),
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
                              style: TextStyle(
                                  fontSize: 12, color: Color(0xff606572))),
                          SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _title("Enter clinic details"),
                                TextFormField(
                                  initialValue: clinicLocation.clinicName,
                                  decoration: const InputDecoration(
                                      contentPadding:
                                          EdgeInsets.only(bottom: -20),
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
                                      name = value;
                                    });
                                  },
                                ),
                                TextFormField(
                                  initialValue: clinicLocation.shopNo,
                                  decoration: const InputDecoration(
                                      contentPadding:
                                          EdgeInsets.only(bottom: -20),
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
                                  initialValue: clinicLocation.address,
                                  decoration: const InputDecoration(
                                      contentPadding:
                                          EdgeInsets.only(bottom: -20),
                                      hintText: 'Address',
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
                                // TextFormField(
                                //   decoration: const InputDecoration(
                                //       contentPadding: EdgeInsets.only(bottom: -20),
                                //       hintText: 'Area/Street Name/Plot no/Sector.',
                                //       hintStyle: TextStyle(fontSize: 12)),
                                //   validator: (value) {
                                //     if (value.isEmpty) {
                                //       return 'Please enter some text';
                                //     }
                                //     return null;
                                //   },
                                //   onChanged: (value) {
                                //     // setState(() {
                                //     //   area = value;
                                //     // });
                                //   },
                                // ),
                                // TextFormField(
                                //   decoration: const InputDecoration(
                                //       contentPadding: EdgeInsets.only(bottom: -20),
                                //       hintText: 'Landmark',
                                //       hintStyle: TextStyle(fontSize: 12)),
                                //   validator: (value) {
                                //     if (value.isEmpty) {
                                //       return 'Please enter some text';
                                //     }
                                //     return null;
                                //   },
                                //   onChanged: (value) {
                                //     // setState(() {
                                //     //   landmark = value;
                                //     // });
                                //   },
                                // ),
                              ],
                            ),
                          ),
                          // SizedBox(height: 20),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: [
                          //     FlatButton(
                          //         onPressed: () {
                          //           // setGPS = true;
                          //           // locatePosition();
                          //         },
                          //         child: Row(
                          //           children: [
                          //             Text('Set location using the GPS tracker ',
                          //                 style: TextStyle(
                          //                     color: Colors.white, fontSize: 12)),
                          //             Icon(
                          //               Icons.gps_fixed_rounded,
                          //               color: Colors.white,
                          //             )
                          //           ],
                          //         ),
                          //         color: Color(0xff5D5FEF)),
                          //   ],
                          // ),
                          SizedBox(height: 20),
                          Padding(
                              padding: EdgeInsets.only(left: 20.0),
                              child: _title("About your clinic")),
                          SizedBox(height: 20),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.94,
                            child: TextFormField(
                              initialValue: clinicLocation.aboutClinic,
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
                                    borderSide:
                                        BorderSide(color: Color(0xff5D5FEF))),
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Color(0xff5D5FEF))),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          FlatButton(
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  ClinicLocationAndDoctor _finalLocation =
                                      ClinicLocationAndDoctor(
                                          serviceUid: clinicLocation.serviceUid,
                                          clinicName: name,
                                          shopNo: shopNo,
                                          clinicImage:
                                              clinicLocation.clinicImage,
                                          status: clinicLocation.status,
                                          address: address,
                                          latitude: clinicLocation.latitude,
                                          longitude: clinicLocation.longitude,
                                          aboutClinic: about ?? '');

                                  FirebaseFirestore.instance
                                      .collection("MedicalServices")
                                      .doc(
                                          FirebaseAuth.instance.currentUser.uid)
                                      .update({
                                    "location": _finalLocation.toJson()
                                  });
                                }
                              },
                              child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.07,
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF263238),
                                    borderRadius: BorderRadius.circular(2.0),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Update Data",
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
