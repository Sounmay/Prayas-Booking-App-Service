import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freelance_booking_app_service/Screens/EditScreens/Clinic/LocationEditFormScreen.dart';

class SelectForm extends StatefulWidget {
  @override
  _SelectFormState createState() => _SelectFormState();
}

class _SelectFormState extends State<SelectForm> {
  String name = "", phoneNumber = "", imageUrl = "";
  bool isLoaded = false, isClinic = false;

  _fetchData() async {
    String uid = FirebaseAuth.instance.currentUser.uid;
    FirebaseFirestore.instance
        .collection("ServiceProviders")
        .doc(uid)
        .get()
        .then((value) {
      setState(() {
        isClinic = value.data()["isClinic"];
        isLoaded = true;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return !isLoaded
        ? Scaffold(
            appBar: AppBar(),
            body: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [CircularProgressIndicator()],
              ),
            ))
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: Text(
                'Profile',
                style: TextStyle(color: Colors.black),
              ),
              leading: BackButton(color: Colors.black),
            ),
            body: new SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 40.0),
                  InkWell(
                    onTap: () {
                      // if()
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ClinicLocationEditForm()));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 1,
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  decoration:
                                      BoxDecoration(color: Color(0xff5D5FEF)),
                                  width: 5.0,
                                  height: 30.0,
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Container(
                                  child: Text('Location details'),
                                )
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  child: Text('1/2'),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Container(
                                  padding:
                                      EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      border: Border.all(color: Colors.black)),
                                  child: Text('FORM 1'),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 1,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    decoration: BoxDecoration(color: Colors.grey),
                    height: 1.0,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: MediaQuery.of(context).size.width * 1,
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  decoration:
                                      BoxDecoration(color: Color(0xff5D5FEF)),
                                  width: 5.0,
                                  height: 30.0,
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Container(
                                  child: Text('About'),
                                )
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  child: Text('2/2'),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Container(
                                  padding:
                                      EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      border: Border.all(color: Colors.black)),
                                  child: Text('FORM 1'),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 1,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    decoration: BoxDecoration(color: Colors.grey),
                    height: 1.0,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: MediaQuery.of(context).size.width * 1,
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  decoration:
                                      BoxDecoration(color: Color(0xff5D5FEF)),
                                  width: 5.0,
                                  height: 30.0,
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Container(
                                  child: Text('Timings'),
                                )
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  child: Text('1/2'),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Container(
                                  padding:
                                      EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      border: Border.all(color: Colors.black)),
                                  child: Text('FORM 2'),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 1,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    decoration: BoxDecoration(color: Colors.grey),
                    height: 1.0,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: MediaQuery.of(context).size.width * 1,
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  decoration:
                                      BoxDecoration(color: Color(0xff5D5FEF)),
                                  width: 5.0,
                                  height: 30.0,
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Container(
                                  child: Text('Services List'),
                                )
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  child: Text('2/2'),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Container(
                                  padding:
                                      EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      border: Border.all(color: Colors.black)),
                                  child: Text('FORM 2'),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 1,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    decoration: BoxDecoration(color: Colors.grey),
                    height: 1.0,
                  ),
                ],
              ),
            ));
  }
}
