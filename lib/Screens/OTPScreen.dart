import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:freelance_booking_app_service/Widgets/NavigationWidget.dart';

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
        body: SafeArea(
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
            ],
          ),
        ),
      );
  }
}
