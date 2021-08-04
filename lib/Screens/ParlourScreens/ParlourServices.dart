import 'dart:ui';
import 'package:freelance_booking_app_service/Models/ParlourDetailsModel.dart';
import 'package:flutter/material.dart';
import 'package:freelance_booking_app_service/Providers/ParlourDetailsProvider.dart';
import 'dart:io';

import 'package:provider/provider.dart';

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
    final sl = MediaQuery.of(context).size.height;
    final sw = MediaQuery.of(context).size.width;
    final parlourProvider = Provider.of<ParlourDetailsProvider>(context);
    print(name);

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
                  height: sl * 0.02,
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
                RichText(
                    text: TextSpan(
                        text: 'Enter your services - ',
                        style: TextStyle(fontSize: 12, color: Colors.black),
                        children: [
                          TextSpan(
                              text: 'Name, Price ',
                              style: TextStyle(
                                  color: Color(0xff5D5FEF), fontSize: 12)),
                          TextSpan(text: 'and ', style: TextStyle(fontSize: 12)),
                          TextSpan(
                              text: 'Estimated time for each service',
                              style:
                              TextStyle(color: Color(0xff5D5FEF), fontSize: 12))
                        ])),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
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
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: TextFormField(
                                  validator: (val) =>
                                  val.isEmpty ? 'enter' : null,
                                  style: TextStyle(fontSize: 15),
                                  decoration: InputDecoration(
                                      errorStyle: TextStyle(height: 0),
                                      isDense: true,
                                      labelText: 'Name of Service',
                                      floatingLabelBehavior:
                                      FloatingLabelBehavior.auto,
                                      contentPadding:
                                      EdgeInsets.only(bottom: 4)),
                                  onChanged: (value) {
                                    setState(() {
                                      name[_servicesNum] = value;
                                    });
                                  },
                                ),
                              ),
                              SizedBox(height: 10),
                              Container(
                                child: Row(
                                  children: [
                                    SizedBox(
                                      height: sl * 0.07,
                                      width: sw * 0.08,
                                      child: TextFormField(
                                        validator: (val) =>
                                        val.isEmpty || val.length > 2
                                            ? ''
                                            : null,
                                        keyboardType: TextInputType.number,
                                        style: TextStyle(fontSize: 15),
                                        decoration: InputDecoration(
                                          errorStyle: TextStyle(
                                              height: 0,
                                              color: Colors.transparent),
                                          contentPadding: EdgeInsets.all(6),
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
                                        ),
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
                                      height: sl * 0.07,
                                      width: sw * 0.08,
                                      child: TextFormField(
                                        validator: (val) =>
                                        val.isEmpty || val.length > 2
                                            ? ''
                                            : null,
                                        keyboardType: TextInputType.number,
                                        style: TextStyle(fontSize: 15),
                                        decoration: InputDecoration(
                                            errorStyle: TextStyle(height: 0),
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
                                            contentPadding: EdgeInsets.all(6)),
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
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.08,
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: TextFormField(
                              validator: (val) => val.isEmpty ? '' : null,
                              keyboardType: TextInputType.number,
                              style: TextStyle(fontSize: 15),
                              decoration: InputDecoration(
                                  errorStyle: TextStyle(height: 0),
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
                                  contentPadding: EdgeInsets.all(6)),
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
                      Row(children: [
                        TextButton(
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              print('hdf');
                              setState(() {
                                _servicesNum = _servicesNum + 1;
                                print('here');
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
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: TextButton(
                    onPressed: () {
                      if (_servicesNum > 0) {
                        List<ParlourServiceDetails> parlourServices = [];
                        for (int i = 0; i < _servicesNum; i++) {
                          parlourServices.add(ParlourServiceDetails(
                            name: name[i],
                            price: price[i],
                            hour: hr[i],
                            minute: min[i],
                          ));
                          print(parlourServices);
                        }

                        parlourProvider
                            .updateServiceListDetails(parlourServices);
                        Navigator.pushNamed(context, '/details3');
                      }
                      print("hello");
                    },
                    child: Text('Save & Proceed',
                        style: TextStyle(color: Colors.white)),
                    style: TextButton.styleFrom(
                        backgroundColor: _servicesNum > 0
                            ? Color(0xFF263238)
                            : Color(0xffDFDFDF)),
                  ),
                )
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
            onPressed: () {
              setState(() {
                name.removeAt(index);
                hr.removeAt(index);
                min.removeAt(index);
                price.removeAt(index);
                _servicesNum = _servicesNum - 1;
              });
            },
          )
        ],
      ),
      SizedBox(height: 10),
    ]);
  }
}