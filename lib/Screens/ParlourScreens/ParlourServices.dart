import 'dart:ui';
import 'package:freelance_booking_app_service/Models/ParlourDetails.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class ParlourServices extends StatefulWidget {
  ParlourServices({Key key}) : super(key: key);

  @override
  _ParlourServicesState createState() => _ParlourServicesState();
}

class _ParlourServicesState extends State<ParlourServices> {
  List<File> file = List.filled(20, null);
  final _formKey = GlobalKey<FormState>();
  var name = List.filled(20, '', growable: true);
  var hr = List.filled(20, '', growable: true);
  var h = List.filled(20, 0, growable: true);
  var min = List.filled(20, '', growable: true);
  var m = List.filled(20, 0, growable: true);
  var price = List.filled(20, '', growable: true);
  int _servicesNum = 0;

  @override
  Widget build(BuildContext context) {
    final _arguments =
        ModalRoute.of(context).settings.arguments as Map<dynamic, dynamic>;
    Location _location = _arguments["location"];
    Details _details = _arguments["details"];
    List<EmployeeDetailList> _employeeList = _arguments["employeeList"];
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
          child: Form(
              key: _formKey,
              child: Column(children: [
                SizedBox(
                  height: 20,
                ),
                Row(children: [
                  Container(
                      height: 60,
                      width: 10,
                      decoration: BoxDecoration(
                          color: Color(0xff5D5FEF),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10)))),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text('List down your services',
                            style:
                                TextStyle(fontSize: 22, color: Colors.black)),
                      ),
                    ],
                  )
                ]),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Enter your services - ',
                        style: TextStyle(fontSize: 12)),
                    Text('Name, Price ',
                        style:
                            TextStyle(color: Color(0xff5D5FEF), fontSize: 12)),
                    Text('and ', style: TextStyle(fontSize: 12)),
                    Text('Estimated time for each service',
                        style:
                            TextStyle(color: Color(0xff5D5FEF), fontSize: 12))
                  ],
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('Service details',
                              style: TextStyle(
                                  color: Color(0xff5D5FEF),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                      ...List.generate(
                          _servicesNum, (index) => serviceDeets(index)),
                      Column(children: [
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  child: TextFormField(
                                    style: TextStyle(fontSize: 14),
                                    decoration: InputDecoration(
                                        isDense: true,
                                        labelText: 'Name of Service',
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.auto,
                                        contentPadding:
                                            EdgeInsets.only(bottom: 4)),
                                    validator: (val) => val.isEmpty ? '' : null,
                                    onChanged: (value) {
                                      setState(() {
                                        name[_servicesNum] = value;
                                      });
                                    },
                                  ),
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    SizedBox(
                                      height: 30,
                                      width: 30,
                                      child: TextFormField(
                                        style: TextStyle(fontSize: 14),
                                        decoration: InputDecoration(
                                            border: new OutlineInputBorder(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                const Radius.circular(5.0),
                                              ),
                                              borderSide: new BorderSide(
                                                color: Colors.black,
                                                width: 1.0,
                                              ),
                                            ),
                                            isDense: true,
                                            labelText: '00',
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.never,
                                            contentPadding: EdgeInsets.all(4)),
                                        onChanged: (value) {
                                          setState(() {
                                            hr[_servicesNum] = value;
                                            h[_servicesNum] = int.parse(value);
                                          });
                                        },
                                      ),
                                    ),
                                    Text(
                                      ' hr',
                                      style:
                                          TextStyle(color: Color(0xff5D5FEF)),
                                    ),
                                    Text(
                                      ' : ',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 30,
                                      width: 30,
                                      child: TextFormField(
                                        style: TextStyle(fontSize: 14),
                                        decoration: InputDecoration(
                                            border: new OutlineInputBorder(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                const Radius.circular(5.0),
                                              ),
                                              borderSide: new BorderSide(
                                                color: Colors.black,
                                                width: 1.0,
                                              ),
                                            ),
                                            isDense: true,
                                            labelText: '00',
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.never,
                                            contentPadding: EdgeInsets.all(4)),
                                        onChanged: (value) {
                                          setState(() {
                                            min[_servicesNum] = value;
                                            m[_servicesNum] = int.parse(value);
                                          });
                                        },
                                      ),
                                    ),
                                    Text(
                                      ' min',
                                      style:
                                          TextStyle(color: Color(0xff5D5FEF)),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.07,
                              width: MediaQuery.of(context).size.width * 0.2,
                              child: TextFormField(
                                style: TextStyle(fontSize: 14),
                                decoration: InputDecoration(
                                    prefixText: '\u20B9  ',
                                    border: new OutlineInputBorder(
                                      borderRadius: const BorderRadius.all(
                                        const Radius.circular(5.0),
                                      ),
                                      borderSide: new BorderSide(
                                        color: Colors.black,
                                        width: 1.0,
                                      ),
                                    ),
                                    isDense: true,
                                    labelText: 'Price in \u20B9',
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.auto,
                                    contentPadding: EdgeInsets.all(4)),
                                validator: (val) => val.isEmpty ? '' : null,
                                onChanged: (value) {
                                  setState(() {
                                    price[_servicesNum] = value;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                      ]),
                      Row(children: [
                        FlatButton(
                          padding: EdgeInsets.all(0),
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              setState(() {
                                _servicesNum = _servicesNum + 1;
                              });
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.all(4),
                            color: Color(0xff5D5FEF),
                            child: Row(
                              children: [
                                Text(' Add Service   ',
                                    style: TextStyle(color: Colors.white)),
                                Icon(Icons.add, color: Colors.white, size: 16)
                              ],
                            ),
                          ),
                        ),
                      ]),
                      SizedBox(height: 70),
                    ],
                  ),
                ),
                _servicesNum > 1
                    ? SizedBox(
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: TextButton(
                          onPressed: () {

                    //           List<ParlourServiceDetails> parlourServices = [];
                    // for (int i = 0; i < _employeeDetailsNum; i++) {
                    //   employeeList.add(EmployeeDetailList(
                    //       name: name[i],
                    //       number: phoneNumber[i],
                    //       imagefile: employeeImage[i]));
                    // }
                            Navigator.pushNamed(context, '/finalParlourPage',
                                arguments: {
                                  "details": _details,
                                  "location": _location,
                                  "employeeList": _employeeList
                                });
                          },
                          child: Text('Save & Proceed',
                              style: TextStyle(color: Colors.white)),
                          style: TextButton.styleFrom(
                              backgroundColor: Color(0xFF263238)),
                        ),
                      )
                    : SizedBox(
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: TextButton(
                          onPressed: () {},
                          child: Text('Save & Proceed',
                              style: TextStyle(color: Colors.white)),
                          style: TextButton.styleFrom(
                              backgroundColor: Color(0xffDFDFDF)),
                        ),
                      ),
              ]))),
    );
  }

  Widget serviceDeets(int index) {
    return Column(children: [
      SizedBox(height: 10),
      Row(
        children: [
          Container(
            height: 60,
            width: 4,
            color: Color(0xFF3AD48A),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text('Service : '),
                        Text(' ${name[index]}',
                            style: TextStyle(color: Color(0xff5D5FEF)))
                      ],
                    ),
                    Row(
                      children: [Text('Estimate Time : ')],
                    )
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text('Price : '),
                        Text(' ${price[index]}',
                            style: TextStyle(color: Color(0xff5D5FEF)))
                      ],
                    ),
                    Row(
                      children: [
                        h[index] > 0 && m[index] > 0
                            ? Text('${hr[index]} hour ${min[index]} mins',
                                style: TextStyle(color: Color(0xff5D5FEF)))
                            : m[index] > 0
                                ? Text('${min[index]} mins',
                                    style: TextStyle(color: Color(0xff5D5FEF)))
                                : Text('${hr[index]} hour',
                                    style: TextStyle(color: Color(0xff5D5FEF)))
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.cancel_presentation_outlined),
            color: Color(0xff5D5FEF),
            onPressed: () {},
          )
        ],
      ),
      SizedBox(height: 10),
    ]);
  }
}
