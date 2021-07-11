import 'package:flutter/material.dart';

class ParlourLocation extends StatefulWidget {
  @override
  _ParlourLocationState createState() => _ParlourLocationState();
}

class _ParlourLocationState extends State<ParlourLocation> {
  final _formKey = GlobalKey<FormState>();

  String title = 'Parlour';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text('  Where is your ',
                                    style: TextStyle(
                                        fontSize: 22, color: Colors.black)),
                                Container(
                                  color: Color(0xff5D5FEF),
                                  padding: EdgeInsets.all(3),
                                  child: Text('PARLOUR',
                                      style: TextStyle(
                                          fontSize: 22, color: Colors.white)),
                                )
                              ],
                            ),
                            Text('  located ?',
                                style: TextStyle(
                                    fontSize: 22, color: Colors.black))
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 40),
                    Text(
                        'Enter details to help customers better locate and get your services.',
                        style:
                            TextStyle(fontSize: 12, color: Color(0xff606572))),
                    SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Enter shop details',
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xff5D5FEF))),
                          TextFormField(
                            decoration: const InputDecoration(
                                contentPadding: EdgeInsets.only(bottom: -20),
                                hintText: 'Palour name',
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
                                hintText: 'Registered Shop no.',
                                hintStyle: TextStyle(fontSize: 12)),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 40),
                          Text('Parlour location details',
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xff5D5FEF))),
                          TextFormField(
                            decoration: const InputDecoration(
                                contentPadding: EdgeInsets.only(bottom: -20),
                                hintText: 'Address/Floor',
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
                                hintText: 'Area/Street Name/Plot no/Sector.',
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
                                hintText: 'Landmark',
                                hintStyle: TextStyle(fontSize: 12)),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FlatButton(
                            onPressed: () {},
                            child: Row(
                              children: [
                                Text('Set location using the GPS tracker ',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12)),
                                Icon(
                                  Icons.gps_fixed_rounded,
                                  color: Colors.white,
                                )
                              ],
                            ),
                            color: Color(0xff5D5FEF)),
                      ],
                    ),
                    SizedBox(height: 60),
                    FlatButton(
                        onPressed: () {
                          // if (_formKey.currentState.validate()) {
                          //   ScaffoldMessenger.of(context).showSnackBar(
                          //       SnackBar(content: Text('Processing Data')));
                          // }
                          Navigator.pushNamed(context, '/details2',
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
                            )))
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
