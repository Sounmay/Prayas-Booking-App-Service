import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freelance_booking_app_service/Models/ParlourDetails.dart';
import 'package:image_picker/image_picker.dart';

class DetailsSecond extends StatefulWidget {
  const DetailsSecond({Key key}) : super(key: key);

  @override
  _DetailsSecondState createState() => _DetailsSecondState();
}

class _DetailsSecondState extends State<DetailsSecond> {
  String _gender = 'Gents Only';
  String _numOfEmployees = '1';
  String _finalNumofEmployees = '';

  UploadTask task;
  List<File> file = List.filled(20, null);
  final _formKey = GlobalKey<FormState>();

  // List<String> name = [].fillRange(20, ''), phoneNumber = [], employeeImage = [];

  var name = List.filled(20, '', growable: true);
  var phoneNumber = List.filled(20, '', growable: true);
  var employeeImage = List.filled(20, '', growable: true);

  TextEditingController _textController = new TextEditingController();

  int _employeeDetailsNum = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _textController.text = _numOfEmployees;
  }

  @override
  void dispose() {
    // TODO: implement initState
    super.dispose();
    _textController.dispose();
  }

  String about = '';

  @override
  Widget build(BuildContext context) {
    final title =
        ModalRoute.of(context).settings.arguments as Map<dynamic, dynamic>;
    final _pagetitle = title["title"];
    Location _location = title["location"];
    // file = File(_location.ownerImage);
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
                      padding: EdgeInsets.only(left: 5, right: 40),
                      child: Text(_pagetitle,
                          style: TextStyle(fontSize: 22, color: Colors.white)),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 50,
            ),
            _title("$_pagetitle Type"),
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
            _title("About your parlour"),
            SizedBox(height: 15),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.94,
              child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 6,
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                    fillColor: Colors.white,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff5D5FEF))),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff5D5FEF))),
                  ),
                  onChanged: (val) {
                    setState(() => about = val);
                  }),
            ),
            SizedBox(height: 15),
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
                radioButton('6', _numOfEmployees, false),
                radioButton('--', _numOfEmployees, false),
              ],
            ),
            SizedBox(height: 20),
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
                        setState(() => _finalNumofEmployees = val);

                        if ((_finalNumofEmployees != "--" &&
                                _finalNumofEmployees != "") &&
                            (int.parse(_finalNumofEmployees) > 6)) {
                          _numOfEmployees = "--";
                        }
                      }),
                ),
              ],
            ),
            SizedBox(height: 40),
            _title("Details about your employees"),
            ...List.generate(
                _employeeDetailsNum, (index) => employeeDetails(index)),
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
            SizedBox(height: 70),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.width * 0.5,
              child: TextButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    List<EmployeeDetailList> employeeList = [];
                    for (int i = 0; i < _employeeDetailsNum; i++) {
                      employeeList.add(EmployeeDetailList(
                          name: name[i],
                          number: phoneNumber[i],
                          imagefile: employeeImage[i]));
                    }
                    print(employeeList);
                    Details details = Details(
                        parlourType: _gender,
                        aboutParlour: about,
                        numOfEmployees: _finalNumofEmployees);
                    Navigator.pushNamed(context, '/ps', arguments: {
                      "details": details,
                      "location": _location,
                      "employeeList": employeeList
                    });
                  }
                },
                child: Text('Save & Proceed',
                    style: TextStyle(color: Colors.white)),
                style: TextButton.styleFrom(backgroundColor: Color(0xFF263238)),
              ),
            ),
            SizedBox(height: 10)
          ]),
        ),
      ),
    );
  }

  Widget employeeDetails(int index) {
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
            child: file[index] != null
                ? Image.file(
                    File(file[index].path),
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
              child: TextFormField(
                style: TextStyle(fontSize: 14),
                decoration: InputDecoration(
                    isDense: true,
                    hintText: 'Name',
                    contentPadding: EdgeInsets.only(bottom: 4)),
                validator: (val) => val.isEmpty ? 'Enter Employee Name' : null,
                onChanged: (value) {
                  setState(() {
                    name[index] = value;
                  });
                },
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              child: TextFormField(
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: 14),
                validator: (val) =>
                    val.length < 10 ? 'Enter Valid Phone Number' : null,
                decoration: InputDecoration(
                    isDense: true,
                    hintText: 'Phone Number',
                    contentPadding: EdgeInsets.only(bottom: 4)),
                onChanged: (value) {
                  setState(() {
                    phoneNumber[index] = value;
                  });
                },
              ),
            ),
          ],
        ),
        TextButton(
          onPressed: () {
            showModalBottomSheet(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                context: context,
                builder: (builder) {
                  return new Container(
                    padding: EdgeInsets.only(top: 10, bottom: 40),
                    height: 170.0,
                    color: Colors.transparent,
                    child: Column(children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Divider(
                          thickness: 2.0,
                          color: Color(0xff5D5FEF),
                        ),
                      ),
                      Text("ADD PHOTO"),
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              InkWell(
                                onTap: () async {
                                  try {
                                    XFile image = await ImagePicker()
                                        .pickImage(source: ImageSource.gallery);

                                    setState(() {
                                      file[index] = File(image.path);
                                      employeeImage[index] =
                                          file[index].path.toString();
                                    });
                                    Navigator.pop(context);
                                    // print(file.path
                                    //     .toString());
                                  } catch (e) {
                                    print(e.toString());
                                  }
                                },
                                child: Icon(
                                  Icons.photo_outlined,
                                  size: 40,
                                  color: Color(0xff5D5FEF),
                                ),
                              ),
                              SizedBox(height: 10),
                              Text("Photo Gallery")
                            ],
                          ),
                          Column(
                            children: [
                              InkWell(
                                onTap: () async {
                                  try {
                                    XFile image = await ImagePicker()
                                        .pickImage(source: ImageSource.camera);

                                    setState(() {
                                      file[index] = File(image.path);
                                    });
                                  } catch (e) {
                                    print(e.toString());
                                  }
                                },
                                child: Icon(
                                  CupertinoIcons.camera,
                                  color: Color(0xff5D5FEF),
                                  size: 40,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text("Camera")
                            ],
                          )
                        ],
                      )
                    ]),
                  );
                });
          },
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
                    if (value != "--") {
                      _textController.text = value;
                      _finalNumofEmployees = value;
                    }
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
                fontSize: 14,
                fontWeight: FontWeight.bold)),
      ]),
    );
  }
}
