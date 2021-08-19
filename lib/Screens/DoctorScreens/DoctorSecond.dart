import 'package:flutter/material.dart';
import 'package:freelance_booking_app_service/Screens/DoctorScreens/DoctorThird.dart';

class DoctorSecond extends StatefulWidget {
  @override
  _DoctorSecondState createState() => _DoctorSecondState();
}

class _DoctorSecondState extends State<DoctorSecond> {
  final _formKey = GlobalKey<FormState>();

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
        child: Form(
          key: _formKey,
          child: Column(
            children: [
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
                  Container(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Set up Doctor profile ',
                            style:
                                TextStyle(fontSize: 22, color: Colors.black)),
                        Container(
                          color: Color(0xff5D5FEF),
                          padding: EdgeInsets.all(3),
                          child: Text('CLINIC',
                              style:
                                  TextStyle(fontSize: 22, color: Colors.white)),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  decoration: BoxDecoration(color: Colors.grey[400]),
                  height: MediaQuery.of(context).size.height * 0.22,
                  width: MediaQuery.of(context).size.width * 0.4,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 40,
                width: 110,
                child: TextButton(
                  onPressed: () {},
                  child: Row(children: [
                    Text('Add Photo', style: TextStyle(color: Colors.white)),
                    Icon(Icons.photo_outlined, color: Colors.white)
                  ]),
                  style:
                      TextButton.styleFrom(backgroundColor: Color(0xff5D5FEF)),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Enter necessary details',
                        style:
                            TextStyle(fontSize: 14, color: Color(0xff5D5FEF))),
                    TextFormField(
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(bottom: -20),
                          hintText: 'Name of the doctor/health professional',
                          hintStyle: TextStyle(fontSize: 12)),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(bottom: -20),
                          hintText: 'Specialised In',
                          hintStyle: TextStyle(fontSize: 12)),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                                contentPadding: EdgeInsets.only(bottom: -20),
                                hintText: 'Years of Experience',
                                hintStyle: TextStyle(fontSize: 12)),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.05),
                        Expanded(
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                                contentPadding: EdgeInsets.only(bottom: -20),
                                hintText: 'Phone Number',
                                hintStyle: TextStyle(fontSize: 12)),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width * 1,
                padding: EdgeInsets.only(left: 20.0),
                child: Text('About doctor',
                    style: TextStyle(fontSize: 14, color: Color(0xff5D5FEF))),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.94,
                child: TextFormField(
                  onChanged: (text) {
                    setState(() {});
                  },
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
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
                ),
              ),
              SizedBox(
                height: 20,
              ),
              FlatButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new DoctorThird()));
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
              SizedBox(height: 20)
            ],
          ),
        ),
      ),
    );
  }
}
