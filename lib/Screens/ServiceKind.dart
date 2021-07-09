import 'package:flutter/material.dart';


class ServiceKind extends StatefulWidget {
  @override
  _ServiceKindState createState() => _ServiceKindState();
}

class _ServiceKindState extends State<ServiceKind> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: Container(
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.32,),
                  Center(
                    child: Container(
                      child: Text(
                        'Services provided \n by us',
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
                    margin: new EdgeInsets.symmetric(horizontal: 20.0),
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        FlatButton(
                          onPressed: () {

                          },
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
                                minWidth: 45.0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4.0),
                                    side: BorderSide(
                                        color: Color(0xFF5D5FEF),
                                        width: 1,
                                        style: BorderStyle.solid)),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                        FlatButton(
                          onPressed: () {

                          },
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
                                minWidth: 45.0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4.0),
                                    side: BorderSide(
                                        color: Color(0xFF5D5FEF),
                                        width: 1,
                                        style: BorderStyle.solid)),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                        FlatButton(
                          onPressed: () {

                          },
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
                                minWidth: 45.0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4.0),
                                    side: BorderSide(
                                        color: Color(0xFF5D5FEF),
                                        width: 1,
                                        style: BorderStyle.solid)),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ),
      )
    );
  }
}
