import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ServiceKind extends StatefulWidget {
  @override
  _ServiceKindState createState() => _ServiceKindState();
}

class _ServiceKindState extends State<ServiceKind> {
  @override
  int choice = 0;
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final buttonwidth = width * 0.05;
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
        child: Center(
            child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 10.0,
              ),
              FlatButton(
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
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
                          "Sign Out",
                          style: TextStyle(color: Colors.white),
                        ),
                      ))),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.20,
              ),
              Center(
                child: Container(
                  child: Text(
                    'What kind of service \n do you provide?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF263238),
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                margin: new EdgeInsets.symmetric(horizontal: 15.0),
                width: width * 0.95,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FlatButton(
                      onPressed: () {
                        setState(() {
                          choice = 1;
                        });
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color:
                          choice == 1 ? Color(0xffE5E5FF) : Colors.transparent,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          children: <Widget>[
                            CircleAvatar(
                                radius: 32,
                                backgroundImage:
                                    AssetImage('assets/doctor 3.png')),
                            SizedBox(
                              height: 10.0,
                            ),
                            FlatButton(
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Doctors',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              color: Color(0xFF5D5FEF),
                              height: 25.0,
                              minWidth: buttonwidth,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                  side: BorderSide(
                                      color: Color(0xFF5D5FEF),
                                      width: 1,
                                      style: BorderStyle.solid)),
                              onPressed: () {
                                setState(() {
                                  choice = 1;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        // Navigator.pushNamed(context, '/uploadImage');
                        setState(() {
                          choice = 2;
                        });
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color:
                          choice == 2 ? Color(0xffE5E5FF) : Colors.transparent,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          children: <Widget>[
                            CircleAvatar(
                                radius: 32,
                                backgroundImage:
                                    AssetImage('assets/Group 30.png')),
                            SizedBox(
                              height: 10.0,
                            ),
                            FlatButton(
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Parlour',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              color: Color(0xFF5D5FEF),
                              height: 25.0,
                              minWidth: buttonwidth,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                  side: BorderSide(
                                      color: Color(0xFF5D5FEF),
                                      width: 1,
                                      style: BorderStyle.solid)),
                              onPressed: () {
                                setState(() {
                                  choice = 2;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        setState(() {
                          choice = 3;
                        });
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color:
                          choice == 3 ? Color(0xffE5E5FF) : Colors.transparent,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          children: <Widget>[
                            CircleAvatar(
                                radius: 32,
                                backgroundImage:
                                    AssetImage('assets/Group 32.png')),
                            SizedBox(
                              height: 10.0,
                            ),
                            FlatButton(
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Salon',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              color: Color(0xFF5D5FEF),
                              height: 25.0,
                              minWidth: buttonwidth,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.0),
                                  side: BorderSide(
                                      color: Color(0xFF5D5FEF),
                                      width: 1,
                                      style: BorderStyle.solid)),
                              onPressed: () {
                                setState(() {
                                  choice = 3;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              FlatButton(
                  onPressed: () {
                    if (choice == 1)
                      Navigator.pushNamed(context, '/doctorlocation');
                    else if (choice == 2)
                      Navigator.pushNamed(context, '/parlourlocation');
                    else if (choice == 3)
                      Navigator.pushNamed(context, '/salonlocation');
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
            ]
          ),
        )),
      ),
    ));
  }
}
