import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class DetailsSecond extends StatefulWidget {
  const DetailsSecond({Key key}) : super(key: key);

  @override
  _DetailsSecondState createState() => _DetailsSecondState();
}

class _DetailsSecondState extends State<DetailsSecond> {
  String _gender = 'Gents Only';
  String _numOfEmployees = '1';
  String _extranumOfEmployees = '';

  UploadTask task;
  File file;

  TextEditingController _textController = new TextEditingController();

  int _employeeDetailsNum = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: 50,
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
                      child: Text('Add more about your ',
                          style: TextStyle(fontSize: 22, color: Colors.black)),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      color: Color(0xff5D5FEF),
                      padding: EdgeInsets.only(left: 5, right: 10),
                      child: Text('SALON',
                          style: TextStyle(fontSize: 22, color: Colors.white)),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 50,
            ),
            _title("Salon Type"),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                radioButton('Gents Only', _gender, true),
                radioButton('Ladies Only', _gender, true),
                radioButton('Kids', _gender, true),
                radioButton('Unisex', _gender, true),
              ],
            ),
            SizedBox(height: 25),
            _title("Number of employees"),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                radioButton('1', _numOfEmployees, false),
                radioButton('2', _numOfEmployees, false),
                radioButton('3', _numOfEmployees, false),
                radioButton('4', _numOfEmployees, false),
                radioButton('5', _numOfEmployees, false),
                radioButton('More', _numOfEmployees, false),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text(
                    'Enter the number of employees:',
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                SizedBox(
                  width: 60,
                  height: 30,
                  child: TextFormField(
                      controller: _textController,
                      enabled: _numOfEmployees == "More" ? true : false,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(0),
                          fillColor: Colors.white,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue)),
                          disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue[100]))),
                      onChanged: (val) {
                        setState(() => _extranumOfEmployees = val);
                      }),
                ),
              ],
            ),
            SizedBox(height: 40),
            _title("Details about your employees"),
            ...List.generate(_employeeDetailsNum, (index) => employeeDetails()),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Row(children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      _employeeDetailsNum = _employeeDetailsNum + 1;
                    });
                  },
                  child: Text('+Add new employee',
                      style: TextStyle(color: Color(0xff5D5FEF))),
                ),
              ]),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.width * 0.5,
              child: TextButton(
                onPressed: () {},
                child: Text('Save & Proceed',
                    style: TextStyle(color: Colors.white)),
                style: TextButton.styleFrom(backgroundColor: Color(0xFF263238)),
              ),
            )
          ]),
        ),
      ),
    );
  }

  Widget employeeDetails() {
    return Column(children: [
      SizedBox(height: 10),
      Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.grey[400],
                image: DecorationImage(image: AssetImage('assets/user.png'))),
            height: 80,
            width: 80,
            child: file != null
                ? Image.file(
                    File(file.path),
                    fit: BoxFit.cover,
                    width: double.infinity,
                  )
                : null,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              height: 30,
              child: TextFormField(
                style: TextStyle(fontSize: 14),
                decoration: InputDecoration(hintText: 'Name'),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              height: 30,
              child: TextFormField(
                style: TextStyle(fontSize: 14),
                decoration: InputDecoration(hintText: 'Phone Number'),
              ),
            ),
          ],
        ),
        TextButton(
          onPressed: () {},
          child: Row(children: [
            Text('Add Photo', style: TextStyle(color: Colors.white)),
            Icon(Icons.photo_outlined, color: Colors.white)
          ]),
          style: TextButton.styleFrom(backgroundColor: Color(0xff5D5FEF)),
        )
      ]),
    ]);
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
                    _gender = value;
                  } else {
                    _numOfEmployees = value;
                  }
                });
              }),
        ),
        Text(label)
      ],
    );
  }

  Widget _title(String text) {
    return Padding(
      padding: EdgeInsets.only(left: 15),
      child: Row(children: [
        Text(text,
            style: TextStyle(
                color: Color(0xff5D5FEF),
                fontSize: 20,
                fontWeight: FontWeight.bold)),
      ]),
    );
  }
}
