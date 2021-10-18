import 'dart:io';
import 'package:path/path.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:freelance_booking_app_service/Models/User.dart';
import 'package:freelance_booking_app_service/Providers/database.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  String name = "", phoneNumber = "", imageUrl = "", type = "";
  bool isLoaded = false;

  _fetchData() async {
    String uid = FirebaseAuth.instance.currentUser.uid;
    FirebaseFirestore.instance
        .collection("ServiceProviders")
        .doc(uid)
        .get()
        .then((value) {
      setState(() {
        name = value.data()["name"];
        phoneNumber = value.data()["number"];
        imageUrl = value.data()["image"];
        type = value.data()["type"];
        isLoaded = true;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchData();
  }

  UploadTask task;
  File file;
  var newImage = "", newUrl = "";

  @override
  Widget build(BuildContext context) {
    return !isLoaded
        ? Scaffold(
            body: CircularProgressIndicator(),
          )
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: Text(
                'Edit Profile',
                style: TextStyle(color: Colors.black),
              ),
              leading: BackButton(color: Colors.black),
              actions: [
                FlatButton(
                    onPressed: () async {
                      if (newImage == "")
                        DatabaseService().updateServiceProviderInfo(
                            name, phoneNumber, imageUrl);
                      else {
                        try {
                          var oldUrl = imageUrl;
                          File file = File(newImage);
                          var id = FirebaseAuth.instance.currentUser.uid;
                          Reference ref;
                          if (type == "clinic")
                            ref = FirebaseStorage.instance.ref().child(
                                'serviceImageClinic/$id/${basename(file.path)}');
                          else
                            ref = FirebaseStorage.instance.ref().child(
                                'serviceImage/$id/${basename(file.path)}');
                          await ref.putFile(file).whenComplete(() async {
                            await ref.getDownloadURL().then((value) {
                              setState(() {
                                newUrl = value;
                              });
                              Reference oldRef =
                                  FirebaseStorage.instance.refFromURL(oldUrl);
                              oldRef.delete();
                            });
                          });
                        } catch (e) {
                          print(e.toString());
                          setState(() {
                            newUrl = "";
                          });
                        }
                        DatabaseService().updateServiceProviderInfo(
                            name, phoneNumber, newUrl);
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                      decoration: BoxDecoration(
                          border: Border.all(color: Color(0xff5D5FEF)),
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Text('Save'),
                    ))
              ],
            ),
            body: SingleChildScrollView(
                child: Column(
              children: [
                SizedBox(
                  height: 50.0,
                ),
                Center(
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Container(
                        width: 150,
                        height: 150,
                        margin: EdgeInsets.all(20.0),
                        decoration: new BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: ClipOval(
                          child: newImage != ""
                              ? file != null
                                  ? Image.file(
                                      File(file.path),
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                    )
                                  : null
                              : CachedNetworkImage(
                                  imageUrl: imageUrl,
                                  fit: BoxFit.fitHeight,
                                  height: 150,
                                  width: 150,
                                  placeholder: (context, url) =>
                                      new Image.asset('assets/doctor.png'),
                                  errorWidget: (context, url, error) =>
                                      new Stack(
                                    fit: StackFit.expand,
                                    children: [
                                      Icon(Icons.hide_image, size: 40),
                                      ClipRRect(
                                        // Clip it cleanly.
                                        child: Container(
                                          color:
                                              Colors.grey[100].withOpacity(0.1),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.all(10.0),
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Colors.blue, shape: BoxShape.circle),
                          child: Center(
                            child: IconButton(
                              onPressed: () {
                                // print('functionality to be added');
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
                                                          newImage = file.path
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
                              icon: Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Container(
                  margin: EdgeInsets.all(20.0),
                  child: TextFormField(
                    initialValue: name,
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.only(bottom: -20),
                        // hintText: 'Name',
                        hintStyle: TextStyle(fontSize: 12)),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      name = value;
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20.0),
                  child: TextFormField(
                      initialValue: phoneNumber,
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(bottom: -20),
                          // hintText: 'Phone Number',
                          hintStyle: TextStyle(fontSize: 12)),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Please enter your number';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        phoneNumber = value;
                      }),
                ),
              ],
            )),
          );
  }
}
