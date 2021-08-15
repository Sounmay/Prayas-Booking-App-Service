import 'package:flutter/material.dart';

class DoctorFinal extends StatefulWidget {
  @override
  _DoctorFinalState createState() => _DoctorFinalState();
}

class _DoctorFinalState extends State<DoctorFinal> {
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
        child: Center(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                      height: 110,
                      width: 10,
                      decoration: BoxDecoration(
                          color: Color(0xff5D5FEF),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10)
                          )
                      )
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                        'Thanks for filling in your details. Please check before you proceed to the next steps.',
                        softWrap: true,
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                        )
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0,),
              Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height*0.3,
                width: MediaQuery.of(context).size.width*1,
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 30.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Color(0xff0F2735)
                ),
                  child: Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.blueAccent,
                              radius: 30.0,
                            ),
                            SizedBox(width: 10.0,),
                            Column(
                              children: [
                                Text('DR. MUKUND DEV', style: TextStyle(color: Colors.white, fontSize: 18),),
                                Text('+91992334789', style: TextStyle(color: Colors.white, fontSize: 16),),
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          width: MediaQuery.of(context).size.width*0.3,
                          height: MediaQuery.of(context).size.height*0.05,
                          decoration: BoxDecoration(
                            color: Color(0xffC4C4C4).withOpacity(0.2),
                            border: Border.all(color: Color(0xff5D5FEF)),
                            borderRadius: BorderRadius.circular(5.0)
                          ),
                          child: Center(child: Text('MD in Medicines', style: TextStyle(color: Color(0xff00E7A4)),),) // rand comment
                        )
                      ],
                    ),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
