import 'dart:io';
import 'package:geolocator/geolocator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freelance_booking_app_service/Models/ParlourDetails.dart';
import 'package:image_picker/image_picker.dart';

class ParlourLocation extends StatefulWidget {
  @override
  _ParlourLocationState createState() => _ParlourLocationState();
}

class _ParlourLocationState extends State<ParlourLocation> {
  final _formKey = GlobalKey<FormState>();

  var geoLocator=Geolocator();

  void locatePosition() async{
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    String lati = position.latitude.toString();
    String longi = position. longitude.toString();
    print(position == null ? 'Unknown' : 'Latitude : ' + lati + ', ' +'Longitude : '+ longi);
  }

  String title = 'Parlour';

  File file;

  String about = '';
  String ownerImagepath = '';
  String parlourName = '',
      shopNo = '',
      address = '',
      area = '',
      landmark = '',
      ownerName = '',
      ownerNumber = '';

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
        child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 40),
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
                    SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _title("Enter shop details", false),
                          TextFormField(
                            decoration: const InputDecoration(
                                contentPadding: EdgeInsets.only(bottom: -20),
                                hintText: 'Parlour name',
                                hintStyle: TextStyle(fontSize: 12)),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              setState(() {
                                parlourName = value;
                              });
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
                            onChanged: (value) {
                              setState(() {
                                shopNo = value;
                              });
                            },
                          ),
                          SizedBox(height: 40),
                          _title("Parlour location details", false),
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
                            onChanged: (value) {
                              setState(() {
                                address = value;
                              });
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
                            onChanged: (value) {
                              setState(() {
                                area = value;
                              });
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
                            onChanged: (value) {
                              setState(() {
                                landmark = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FlatButton(
                            onPressed: () {
                              locatePosition();
                            },
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
                    SizedBox(
                      height: 15,
                    ),
                    _title("Details about parlour owner", true),
                    Column(children: [
                      SizedBox(height: 10),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey[400],
                                    image: DecorationImage(
                                        image: AssetImage('assets/user.png'))),
                                height: 80,
                                width: 80,
                                child: file != null
                                    ? Image.file(
                                        file,
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: TextFormField(
                                    style: TextStyle(fontSize: 14),
                                    decoration: InputDecoration(
                                        isDense: true,
                                        hintText: 'Name',
                                        contentPadding:
                                            EdgeInsets.only(bottom: 4)),
                                    validator: (val) => val.isEmpty
                                        ? 'Enter Employee Name'
                                        : null,
                                    onChanged: (value) {
                                      setState(() {
                                        ownerName = value;
                                      });
                                    },
                                  ),
                                ),
                                SizedBox(height: 10),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: TextFormField(
                                    keyboardType: TextInputType.number,
                                    style: TextStyle(fontSize: 14),
                                    validator: (val) => val.length < 10
                                        ? 'Enter Valid Phone Number'
                                        : null,
                                    decoration: InputDecoration(
                                        isDense: true,
                                        hintText: 'Phone Number',
                                        contentPadding:
                                            EdgeInsets.only(bottom: 4)),
                                    onChanged: (value) {
                                      setState(() {
                                        ownerNumber = value;
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
                                        padding: EdgeInsets.only(
                                            top: 10, bottom: 40),
                                        height: 170.0,
                                        color: Colors.transparent,
                                        child: Column(children: [
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.4,
                                            child: Divider(
                                              thickness: 2.0,
                                              color: Color(0xff5D5FEF),
                                            ),
                                          ),
                                          Text("ADD PHOTO"),
                                          Spacer(),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Column(
                                                children: [
                                                  InkWell(
                                                    onTap: () async {
                                                      try {
                                                        XFile image =
                                                            await ImagePicker()
                                                                .pickImage(
                                                                    source: ImageSource
                                                                        .gallery);

                                                        setState(() {
                                                          file =
                                                              File(image.path);
                                                          ownerImagepath = file
                                                              .path
                                                              .toString();
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
                                                        XFile image =
                                                            await ImagePicker()
                                                                .pickImage(
                                                                    source: ImageSource
                                                                        .camera);

                                                        setState(() {
                                                          file =
                                                              File(image.path);
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
                                Text('Add Photo',
                                    style: TextStyle(color: Colors.white)),
                                Icon(Icons.photo_outlined, color: Colors.white)
                              ]),
                              style: TextButton.styleFrom(
                                  backgroundColor: Color(0xff5D5FEF)),
                            )
                          ]),
                    ]),
                    SizedBox(height: 20),
                    _title("About", true),
                    SizedBox(height: 10),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.94,
                      child: TextField(
                          keyboardType: TextInputType.multiline,
                          maxLines: 5,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(left: 10),
                            fillColor: Colors.white,
                            filled: true,
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff5D5FEF))),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xff5D5FEF))),
                          ),
                          
                          onChanged: (val) {
                            setState(() => about = val);
                          }),
                    ),
                    SizedBox(height: 30),
                    FlatButton(
                        onPressed: () {
                          // if (_formKey.currentState.validate()) {
                          //   ScaffoldMessenger.of(context).showSnackBar(
                          //       SnackBar(content: Text('Processing Data')));
                          // }
                          final uid = FirebaseAuth.instance.currentUser.uid;
                          if (_formKey.currentState.validate()) {
                            Location location = Location(
                              serviceUid: uid.toString(),
                                name: parlourName,
                                shopNo: shopNo,
                                address: '$address, $area, $landmark',
                                ownerImage: ownerImagepath,
                                ownerName: ownerName,
                                ownerNumber: ownerNumber,
                                aboutOwner: about);
                            Navigator.pushNamed(context, '/details2',
                                arguments: {
                                  "title": title,
                                  "location": location
                                });
                          }
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

  Widget _title(String text, bool isPadding) {
    return Padding(
      padding: EdgeInsets.only(left: isPadding == true ? 15 : 0),
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
