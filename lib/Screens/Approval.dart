import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freelance_booking_app_service/Screens/OTPScreen.dart';
import 'package:freelance_booking_app_service/Utils/Events.dart';

class Approval extends StatefulWidget {
  Approval({Key key}) : super(key: key);

  @override
  _ApprovalState createState() => _ApprovalState();
}

class _ApprovalState extends State<Approval> {
  String date;
  String tsl;
  bool approveToggle = false;
  bool isStart = true;
  // int toapp = 1, aprvd = 0;

  @override
  Widget build(BuildContext context) {
    final _args =
        ModalRoute.of(context).settings.arguments as Map<dynamic, dynamic>;
    final date = _args["date"];
    final tsl = _args["timesl"];
    final Event bookedEvent = _args["event"];
    if (isStart) {
      approveToggle = bookedEvent.isApproved;
      isStart = false;
    }
    final sl = MediaQuery.of(context).size.height;
    final sw = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              SizedBox(height: 25),
              Text(date,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(height: sl * 0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      iconSize: 20,
                      padding: EdgeInsets.all(0),
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () {},
                      color: Color(0xffB1B1B1)),
                  Column(
                    children: [
                      Text('Timing slots',
                          style: TextStyle(color: Color(0xff545454))),
                      SizedBox(height: sl * 0.01),
                      Text(tsl,
                          style:
                              TextStyle(color: Color(0xff5D5FEF), fontSize: 17))
                    ],
                  ),
                  IconButton(
                      iconSize: 20,
                      padding: EdgeInsets.all(0),
                      icon: Icon(Icons.arrow_forward_ios),
                      onPressed: () {},
                      color: Color(0xffB1B1B1))
                ],
              ),
              SizedBox(height: sl * 0.05),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: sl * 0.05,
                    width: sw * 0.37,
                    decoration: BoxDecoration(
                        color: Color(0xffDCDCFF),
                        border: Border.all(color: Color(0xff5D5FEF)),
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Services Requests',
                            style: TextStyle(
                                fontSize: 12.0, color: Color(0xff5D5FEF))),
                        SizedBox(width: sw * 0.01),
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Color(0xff5D5FEF)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              approveToggle ? '0' : '1',
                              style: TextStyle(
                                  fontSize: 12.0, color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: 15.0),
                  Container(
                    height: sl * 0.05,
                    width: sw * 0.37,
                    decoration: BoxDecoration(
                        color: Color(0xffE5FFF8),
                        border: Border.all(color: Color(0xff00A676)),
                        borderRadius: BorderRadius.circular(16.0)),
                    child: (Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Services Approved',
                            style: TextStyle(
                                fontSize: 12.0, color: Color(0xff00A676))),
                        SizedBox(width: sw * 0.01),
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Color(0xff00A676)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              approveToggle ? '1' : '0',
                              style: TextStyle(
                                  fontSize: 12.0, color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    )),
                  ),
                ],
              ),
              SizedBox(height: sl * 0.1),
              Column(
                children: [
                  Row(
                    children: [
                      Text('Request number',
                          style: TextStyle(color: Color(0xff545454))),
                      SizedBox(width: sw * 0.01),
                      Text('01',
                          style: TextStyle(
                              color: Color(0xff545454),
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Services ${bookedEvent.otp}',
                                style: TextStyle(
                                    color: Color(0xff5D5FEF),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17)),
                            ButtonTheme(
                              padding: EdgeInsets.symmetric(
                                  vertical: 0.0, horizontal: 0.0),
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              minWidth: 0,
                              height: 0,
                              child: FlatButton(
                                onPressed: () async {
                                  // await FirebaseFirestore.instance.collection('Users')
                                  if (approveToggle == false) {
                                    await FirebaseFirestore.instance
                                        .collection('Users')
                                        .doc(bookedEvent.id)
                                        .update({
                                      "bookings": FieldValue.arrayUnion([
                                        bookedEvent.toJson(
                                            bookedEvent.uid, true)
                                      ])
                                    });
                                    await FirebaseFirestore.instance
                                        .collection('Users')
                                        .doc(bookedEvent.id)
                                        .update({
                                      "bookings": FieldValue.arrayRemove([
                                        bookedEvent.toJson(
                                            bookedEvent.uid, false)
                                      ])
                                    });
                                    await FirebaseFirestore.instance
                                        .collection('ServiceProviders')
                                        .doc(bookedEvent.uid)
                                        .update({
                                      "event": FieldValue.arrayUnion([
                                        bookedEvent.toJson(
                                            bookedEvent.uid, true)
                                      ])
                                    });
                                    await FirebaseFirestore.instance
                                        .collection('ServiceProviders')
                                        .doc(bookedEvent.uid)
                                        .update({
                                      "event": FieldValue.arrayRemove([
                                        bookedEvent.toJson(
                                            bookedEvent.uid, false)
                                      ])
                                    });

                                    setState(() {
                                      approveToggle = true;
                                    });
                                  } else {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => OTPScreen(
                                                customerOrder: bookedEvent,
                                              )),
                                    );
                                  }
                                },
                                child: Container(
                                  height: sl * 0.05,
                                  width: !approveToggle ? sw * 0.19 : sw * 0.26,
                                  decoration: BoxDecoration(
                                      color: !approveToggle
                                          ? Color(0xffE5FFF8)
                                          : Color(0xff39BC96),
                                      border:
                                          Border.all(color: Color(0xff00A676)),
                                      borderRadius:
                                          BorderRadius.circular(16.0)),
                                  child: (Row(
                                    mainAxisAlignment: approveToggle
                                        ? MainAxisAlignment.center
                                        : MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                          bookedEvent.isApproved == true
                                              ? 'Approved'
                                              : 'Approve',
                                          style: TextStyle(
                                              fontSize: 12.0,
                                              color: !approveToggle
                                                  ? Color(0xff39BC96)
                                                  : Colors.white)),
                                      if (approveToggle == true)
                                        Icon(Icons.check,
                                            color: Colors.white, size: 18)
                                    ],
                                  )),
                                ),
                              ),
                            )
                          ],
                        ),
                        ButtonTheme(
                          padding: EdgeInsets.symmetric(
                              vertical: 0.0, horizontal: 0.0),
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          minWidth: 0,
                          height: 0,
                          child: FlatButton(
                            child: Text('view details',
                                style: TextStyle(color: Color(0xff0F2735))),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
