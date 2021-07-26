import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freelance_booking_app_service/Models/ParlourDetails.dart';
import 'package:image_picker/image_picker.dart';
import 'package:marquee/marquee.dart';

class FinalEditPage extends StatefulWidget {
  const FinalEditPage({Key key}) : super(key: key);

  @override
  _FinalEditPageState createState() => _FinalEditPageState();
}

class _FinalEditPageState extends State<FinalEditPage> {
  String ownerImagepath = '';
  File file;

  @override
  Widget build(BuildContext context) {
    final _arguments =
        ModalRoute.of(context).settings.arguments as Map<dynamic, dynamic>;
    Location _location = _arguments["location"];
    Details _details = _arguments["details"];
    ParlourDetails parlourDetails =
        ParlourDetails(location: _location, details: _details);
    print(parlourDetails);
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(children: [
            Row(children: [
              Container(
                  height: 110,
                  width: 10,
                  decoration: BoxDecoration(
                      color: Color(0xff5D5FEF),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10)))),
              Flexible(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  margin: EdgeInsets.only(left: 10),
                  child: Row(children: [
                    Flexible(
                      child: Text(
                          'Thanks for filling in your details. Please check before you proceed to the next steps.',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                          )),
                    ),
                  ]),
                ),
              ),
            ]),
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Shop Details',
                    style: TextStyle(color: Color(0xff606572)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      decoration: BoxDecoration(color: Colors.grey[400]),
                      height: 200,
                      width: 200,
                      child: file != null
                          ? Image.file(
                              File(file.path),
                              fit: BoxFit.cover,
                              width: double.infinity,
                            )
                          : null,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 40,
                    width: 110,
                    child: TextButton(
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
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
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
                                                  file = File(image.path);
                                                  ownerImagepath =
                                                      file.path.toString();
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
                                                  file = File(image.path);
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
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xFF0F2735),
                    ),
                    // margin: const EdgeInsets.fromLTRB(40, 20, 40, 10),
                    padding: const EdgeInsets.all(4),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(
                            CupertinoIcons.location,
                            color: Colors.green,
                            size: 20,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            height: 30,
                            child: Marquee(
                                text: parlourDetails.location.address,
                                scrollAxis: Axis.horizontal,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                blankSpace: 20.0,
                                velocity: 10.0,
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400)),
                          )
                        ]),
                  ),
                  SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        CupertinoIcons.scissors,
                        size: 24,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(parlourDetails.location.name,
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 24)),
                    ],
                  ),
                  // task != null ? buildUploadStatus(task) : Container(),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Text('${parlourDetails.details.parlourType} Parlour',
                      style: TextStyle(
                          color: Color(0xff5D5FEF),
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 10,
                  ),
                  Flexible(
                      child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Text(parlourDetails.details.aboutParlour,
                        style: TextStyle(color: Color(0xff606572))),
                  )),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Your Team',
                      style: TextStyle(
                          color: Color(0xff5D5FEF),
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 10,
                  ),
                  ...List.generate(
                      int.parse(parlourDetails.details.numOfEmployees),
                      (index) => Container(child: Text('hello'))),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
