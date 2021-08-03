import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freelance_booking_app_service/Utils/Events.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:freelance_booking_app_service/Widgets/NavigationWidget.dart';

import 'Schedule.dart';

class OTPScreen extends StatefulWidget {
  final Event customerOrder;
  OTPScreen({this.customerOrder});
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  bool _isPressed = false;
  bool res = false;
  @override
  Widget build(BuildContext context) {
    final String requiredNumber = widget.customerOrder?.otp ?? "";
    return Scaffold(
      appBar: widget.customerOrder != null
          ? AppBar(
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(color: Colors.black),
            )
          : PreferredSize(child: Container(), preferredSize: Size.zero),
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
                  borderRadius: BorderRadius.circular(20.0)),
              child: Column(
                children: [
                  Center(
                      child: Text(
                    "Enter Service Code to verify service",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  )),
                  SizedBox(
                    height: 35.0,
                  ),
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
                      onCompleted: (value) {
                        if (value == requiredNumber) {
                          res = true;
                        } else {
                          res = false;
                        }
                      },
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      setState(() {
                        if (res == true)
                          Navigator.pushNamed(context, '/startservice');
                      });
                      if (res == true) {
                        print('valid pin');
                      } else {
                        print('invalid pin');
                      }
                    },
                    child: Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.3,
                        decoration: BoxDecoration(
                            color: (res == true)
                                ? Color(0xff3AD48A)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(5.0)),
                        child: Center(
                          child: Text((res == true) ? "Proceed  V" : "Proceed",
                              style: TextStyle(
                                  color: (res == true)
                                      ? Colors.white
                                      : Color(0xff0F2735),
                                  fontSize: 15)),
                        )),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            if (widget.customerOrder != null) _fadedList(widget.customerOrder)
          ],
        ),
      )),
    );
  }

  Widget _fadedList(Event customerOrder) {
    final date = customerOrder.day.toDate();
    int numOfServices = customerOrder.serviceNames.length;

    String serviceOrServices = numOfServices > 1 ? "services" : "service";
    return Opacity(
        opacity: res == true ? 1.0 : 0.3,
        child: Container(
          margin: EdgeInsets.fromLTRB(10.0, 0, 10.0, 10.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(width: 0.3, color: Colors.black)),
          child: Column(
            children: [
              SizedBox(
                height: 10.0,
              ),
              Text("Customer Details"),
              SizedBox(
                height: 20.0,
              ),
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
                        Text(
                          "${customerOrder.customerName}",
                          textAlign: TextAlign.right,
                        ),
                        Text("+918249375008")
                      ],
                    ),
                    Column(
                      children: [
                        Text("${date.day}/${date.month}/${date.year}"),
                        Text("${customerOrder.timeSlot}")
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20.0, 0, 10.0, 0),
                child: Column(
                  children: [
                    Text("Services Availed"),

                    ...List.generate(
                      customerOrder.serviceNames.length,
                      (index) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.radio_button_checked),
                              Text("${customerOrder.serviceNames[index]}")
                            ],
                          ),
                          Text("Rs. ${customerOrder.price[index]}")
                        ],
                      ),
                    ),

                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Row(
                    //       children: [
                    //         Icon(Icons.radio_button_checked),
                    //         Text("Haircut")
                    //       ],
                    //     ),
                    //     Text("Rs. 100")
                    //   ],
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Row(
                    //       children: [
                    //         Icon(Icons.radio_button_checked),
                    //         Text("Haircut")
                    //       ],
                    //     ),
                    //     Text("Rs. 100")
                    //   ],
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Row(
                    //       children: [
                    //         Icon(Icons.radio_button_checked),
                    //         Text("Haircut")
                    //       ],
                    //     ),
                    //     Text("Rs. 100")
                    //   ],
                    // ),
                    SizedBox(
                      height: 10.0,
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                        child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Net Amount : ",
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              "Rs ${customerOrder.subtotal}",
                              style: TextStyle(
                                  fontSize: 20, color: Color(0xff5D5FEF)),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              height: 40.0,
                            ),
                            Text(
                                "For ${customerOrder.serviceNames.length} $serviceOrServices (incl tax)"),
                          ],
                        )
                      ],
                    )),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
