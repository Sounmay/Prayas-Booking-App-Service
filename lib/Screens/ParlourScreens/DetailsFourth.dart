import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freelance_booking_app_service/Models/ParlourDetailsModel.dart';
import 'package:freelance_booking_app_service/Providers/ParlourDetailsProvider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class DetailsFourth extends StatefulWidget {
  DetailsFourth({Key key}) : super(key: key);

  @override
  _DetailsFourthState createState() => _DetailsFourthState();
}

class _DetailsFourthState extends State<DetailsFourth> {
  String _duration = '';
  String _interval = '';
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context).settings.arguments as Map<dynamic, dynamic>;
    final title = args["title"];

    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
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
                    child: Text('Creating service time slots ',
                        style: TextStyle(fontSize: 22, color: Colors.black)),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Select your time slots as per your service requirements ',
                  style: TextStyle(fontSize: 12, color: Color(0xff606572)))
            ],
          ),
          SizedBox(height: 30),
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  children: [
                    Text('Select slots duration ',
                        style:
                            TextStyle(fontSize: 14, color: Color(0xff5D5FEF))),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    radioButton('30 min', _duration, true),
                    radioButton('60 min', _duration, true),
                    radioButton('45 min', _duration, true),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    Text('Select interval duration ',
                        style:
                            TextStyle(fontSize: 14, color: Color(0xff5D5FEF))),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    radioButton('10 min', _interval, false),
                    radioButton('15 min', _interval, false),
                    radioButton('20 min', _interval, false),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 168.0),
            child: FlatButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/finalParlourPage',
                      arguments: {"title": title});
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
                    ))),
          )
        ],
      )),
    );
  }

  Widget radioButton(String label, String groupValue, bool isFirst) {
    return Row(
      children: [
        SizedBox(
          height: 30,
          width: 30,
          child: Radio(
              value: label,
              groupValue: groupValue,
              onChanged: (value) {
                setState(() {
                  if (isFirst == true) {
                    _duration = value;
                  } else {
                    _interval = value;
                  }
                });
              }),
        ),
        Text(label)
      ],
    );
  }
}
