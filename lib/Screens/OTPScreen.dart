import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:freelance_booking_app_service/Widgets/NavigationWidget.dart';

import 'Schedule.dart';

class OTPScreen extends StatefulWidget {
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  @override
  final String requiredNumber = '123456';
  bool _isPressed=false;
  bool res=false;
  Widget build(BuildContext context) {
      return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: Color(0xff5D5FEF),
          items: [
            BottomNavigationBarItem(
              icon: IconButton(onPressed: (){}, icon: Icon(Icons.calendar_today, color: Colors.white)),
              label: 'calendar',
            ),
            BottomNavigationBarItem(
              icon: IconButton(onPressed: (){Navigator.pushNamed(context, '/schedule');}, icon: Icon(Icons.ac_unit, color: Colors.white)),
              label: 'calendar',
            )
          ],
        ),
        body: SafeArea(
          child: new SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(20.0),
                  padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0),
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: BoxDecoration(
                      color: Color(0xff0F2735),
                      borderRadius: BorderRadius.circular(20.0)
                  ),
                  child: Column(
                    children: [
                      Center(
                          child: Text("Enter Service Code to verify service",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          )
                      ),
                      SizedBox(height: 35.0,),
                      Center(
                        child: PinCodeTextField(
                          appContext: context,
                          textStyle: TextStyle(color: Colors.white),
                          length: 6,
                          onChanged: (value) {
                            print(value);
                          },
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(5),
                            fieldHeight: 50,
                            fieldWidth: 40,
                            inactiveColor: Colors.white,
                            activeColor: Color(0xff5D5FEF),
                            selectedColor: Colors.white,
                          ),
                          onCompleted: (value){
                            if(value == requiredNumber){
                              res=true;
                            } else {
                              res=false;
                            }
                          },
                        ),
                      ),
                      FlatButton(
                        onPressed: (){
                          setState(() {
                            _isPressed = !_isPressed;
                          });
                          if(res==true){
                            print('valid pin');
                          } else {
                            print('invalid pin');
                          }
                        },
                        child: Container(
                            height: MediaQuery.of(context).size.height * 0.05,
                            width: MediaQuery.of(context).size.width * 0.3,
                            decoration: BoxDecoration(
                                color: (_isPressed==true)?Color(0xff3AD48A):Colors.white,
                                borderRadius: BorderRadius.circular(5.0)
                            ),
                            child: Center(
                              child: Text(
                                  (_isPressed==true)?"Proceed  V":"Proceed",
                                  style: TextStyle(color: (_isPressed==true)?Colors.white:Color(0xff0F2735), fontSize: 15)
                              ),
                            )
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 30.0,),
                Opacity(
                    opacity: res==true?1.0:0.5,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(10.0, 0, 10.0, 10.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(width: 0.3, color: Colors.black)
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 10.0,),
                          Text("Customer Details"),
                          SizedBox(height: 20.0,),
                          Container(
                            width: MediaQuery.of(context).size.width * 1,
                            margin: EdgeInsets.fromLTRB(20.0, 0, 10.0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                  backgroundImage: AssetImage("assets/doctor.png"),
                                  backgroundColor: Colors.blue,
                                ),
                                Column(
                                  children: [
                                    Text("Jay Prakash", textAlign: TextAlign.right,),
                                    Text("+918249375008")
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text("29/08/2021"),
                                    Text("08:00AM - 10:00AM")
                                  ],
                                ),

                              ],
                            ),
                          ),
                          SizedBox(height: 20.0,),
                          Container(
                            margin: EdgeInsets.fromLTRB(20.0, 0, 10.0, 0),
                            child: Column(
                              children: [
                                Text("Services Availed"),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.radio_button_checked),
                                        Text("Haircut")
                                      ],
                                    ),
                                    Text(
                                        "Rs. 100"
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.radio_button_checked),
                                        Text("Haircut")
                                      ],
                                    ),
                                    Text(
                                        "Rs. 100"
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.radio_button_checked),
                                        Text("Haircut")
                                      ],
                                    ),
                                    Text(
                                        "Rs. 100"
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(Icons.radio_button_checked),
                                        Text("Haircut")
                                      ],
                                    ),
                                    Text(
                                        "Rs. 100"
                                    )
                                  ],
                                ),
                                SizedBox(height: 10.0,),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                ),
              ],
            ),
          )
        ),
      );
  }
}
