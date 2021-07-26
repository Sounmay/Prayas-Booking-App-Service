import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      decoration: BoxDecoration(color: Colors.grey[400]),
                      height: 220,
                      width: 220,
                      child: file != null
                          ? Image.file(
                              File(file.path),
                              fit: BoxFit.cover,
                              width: double.infinity,
                            )
                          : null,
                    ),
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
                                              XFile image = await ImagePicker()
                                                  .pickImage(
                                                      source:
                                                          ImageSource.gallery);

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
                                              XFile image = await ImagePicker()
                                                  .pickImage(
                                                      source:
                                                          ImageSource.camera);

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
                      Text('Add Photo', style: TextStyle(color: Colors.white)),
                      Icon(Icons.photo_outlined, color: Colors.white)
                    ]),
                    style: TextButton.styleFrom(
                        backgroundColor: Color(0xff5D5FEF)),
                  )
                  // task != null ? buildUploadStatus(task) : Container(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
