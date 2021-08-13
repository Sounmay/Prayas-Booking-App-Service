import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freelance_booking_app_service/Providers/ParlourDetailsProvider.dart';
import 'package:freelance_booking_app_service/Providers/database.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freelance_booking_app_service/Models/ParlourDetailsModel.dart';
import 'package:freelance_booking_app_service/Providers/FirebaseApi.dart';
import 'package:image_picker/image_picker.dart';
import 'package:marquee/marquee.dart';
import 'package:provider/provider.dart';

class FinalEditPage extends StatefulWidget {
  const FinalEditPage({Key key}) : super(key: key);

  @override
  _FinalEditPageState createState() => _FinalEditPageState();
}

class _FinalEditPageState extends State<FinalEditPage> {
  String parlourImagepath = '';
  File file;
  bool isEditMode = false;
  bool isLoading = false;
  String parlourImageUrl = '';
  String ownerImageUrl = '';
  bool employeeImagesuploaded = false,
      parlourImageuploaded = false,
      ownerImageuploaded = false;

  List<String> imageUrls = [];

  List<EmployeeDetailList> employeeList = [];
  List<EmployeeDetailList> finalEmployeeList = [];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final parlourProvider = Provider.of<ParlourDetailsProvider>(context);

    Location _location = parlourProvider.parlourLocationDetails;
    Details _details = parlourProvider.parlourDetails;
    List<EmployeeDetailList> _employeeList =
        parlourProvider.parlourEmployeeDetails;

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
      body: isLoading
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [CircularProgressIndicator()],
              ),
            )
          : SingleChildScrollView(
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
                                bottomRight: Radius.circular(10)
                            )
                        )
                    ),
                    Container(
                      width: width * 0.7,
                      margin: EdgeInsets.only(left: 10),
                      child: Text(
                          'Thanks for filling in your details. Please check before you proceed to the next steps.',
                          softWrap: true,
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                          )),
                    ),
                  ]),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: isEditMode
                                ? Color(0xff5D5FEF)
                                : Colors.transparent),
                        borderRadius: BorderRadius.circular(10)),
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                            mainAxisAlignment: isEditMode
                                ? MainAxisAlignment.spaceBetween
                                : MainAxisAlignment.center,
                            children: [
                              if (isEditMode) Container(),
                              Text(
                                'Shop Details',
                                style: TextStyle(color: Color(0xff606572)),
                              ),
                              if (isEditMode)
                                IconButton(
                                    onPressed: () {
                                      Navigator.of(context).popUntil(
                                          ModalRoute.withName(
                                              "/parlourlocation"));
                                    },
                                    icon: Icon(Icons.edit))
                            ]),
                        SizedBox(
                          height: 10,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Container(
                            decoration: BoxDecoration(color: Colors.grey[400]),
                            height: height * 0.22,
                            width: width * 0.4,
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
                                      padding:
                                          EdgeInsets.only(top: 10, bottom: 40),
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
                                                        file = File(image.path);
                                                        parlourImagepath = file
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
                                                                  source:
                                                                      ImageSource
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
                          width: width * 0.45,
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.35,
                                  height: height * 0.06,
                                  child: Marquee(
                                      text: _location.address,
                                      scrollAxis: Axis.horizontal,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                            Text(_location.name,
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
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: isEditMode
                                ? Color(0xff5D5FEF)
                                : Colors.transparent),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        Row(
                            mainAxisAlignment: isEditMode
                                ? MainAxisAlignment.spaceBetween
                                : MainAxisAlignment.center,
                            children: [
                              if (isEditMode) Container(),
                              Text('${_details.parlourType} Parlour',
                                  style: TextStyle(
                                      color: Color(0xff5D5FEF),
                                      fontWeight: FontWeight.bold)),
                              if (isEditMode)
                                IconButton(
                                    onPressed: () {
                                      Navigator.of(context).popUntil(
                                          ModalRoute.withName("/details2"));
                                    },
                                    icon: Icon(Icons.edit))
                            ]),
                        SizedBox(
                          height: height * 0.5 * 0.06,
                        ),
                        Container(
                          width: width * 0.8,
                          child: Text(_details.aboutParlour,
                              softWrap: true,
                              textAlign: TextAlign.left,
                              style: TextStyle(color: Color(0xff606572))),
                        ),
                        SizedBox(
                          height: height * 0.5 * 0.06,
                        ),
                        Text('Your Team',
                            style: TextStyle(
                                color: Color(0xff5D5FEF),
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          height:
                              MediaQuery.of(context).size.height * 0.5 * 0.4,
                          width: MediaQuery.of(context).size.width * 0.75,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: _employeeList.length,
                            itemBuilder: (BuildContext ctx, index) {
                              return Container(
                                margin: EdgeInsets.symmetric(horizontal: 1),
                                child: new Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    new Container(
                                        width: width * 0.25,
                                        height: height * 0.1,
                                        margin: EdgeInsets.only(bottom: 8),
                                        decoration: new BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: new DecorationImage(
                                                fit: BoxFit.fill,
                                                image: FileImage(File(
                                                    _employeeList[index]
                                                        .imagefile))))),
                                    new Text(
                                      _employeeList[index].name,
                                    ),
                                    new Text(
                                      _employeeList[index].number,
                                      style: TextStyle(
                                          color: Color(0xff5D5FEF),
                                          fontSize: 12),
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      TextButton(
                          onPressed: () async {
                            setState(() {
                              isLoading = true;
                              employeeList = _employeeList;
                            });
                            try {
                              // deleteFolder();
                              await uploadEmployeeImages();
                              await uploadImage(_location.ownerImage, true);
                              await uploadImage(parlourImagepath, false);

                              if (parlourImageuploaded &&
                                  ownerImageuploaded &&
                                  employeeImagesuploaded) {
                                Location finalParlourLocation = Location(
                                    aboutOwner: _location.aboutOwner,
                                    ownerImage: ownerImageUrl,
                                    ownerName: _location.ownerName,
                                    ownerNumber: _location.ownerNumber,
                                    name: _location.name,
                                    address: _location.address,
                                    shopNo: _location.shopNo,
                                    longitude: _location.longitude,
                                    latitude: _location.latitude,
                                    serviceUid: _location.serviceUid);

                                Details finalParlourDetails = Details(
                                    aboutParlour: _details.aboutParlour,
                                    parlourImage: parlourImageUrl,
                                    parlourType: _details.parlourType,
                                    numOfEmployees: _details.numOfEmployees);

                                if (title == "PARLOUR") {
                                  DatabaseService().uploadParlourServiceData(
                                      finalParlourLocation,
                                      finalParlourDetails,
                                      finalEmployeeList,
                                      parlourProvider.parlourServiceListDetails,
                                      parlourProvider.parlourSlotListDetails);
                                } else {
                                  DatabaseService().uploadSalonServiceData(
                                      finalParlourLocation,
                                      finalParlourDetails,
                                      finalEmployeeList,
                                      parlourProvider.parlourServiceListDetails,
                                      parlourProvider.parlourSlotListDetails);
                                }

                                setState(() {
                                  isLoading = false;
                                  DatabaseService().setRegistered().then(
                                      (value) => Navigator.popUntil(context,
                                          ModalRoute.withName('/wrapper')));
                                });
                              }
                            } catch (e) {
                              print(e.toString());
                            }
                          },
                          child: SizedBox(
                            width: width * 0.4,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Looks Good!!',
                                      style: TextStyle(color: Colors.white)),
                                  SizedBox(
                                    width: width * 0.04,
                                  ),
                                  Icon(Icons.thumb_up_alt_outlined,
                                      color: Colors.white),
                                ]),
                          ),
                          style: TextButton.styleFrom(
                              backgroundColor: Color(0xFF00A676))),
                      SizedBox(
                        width: width * 0.2,
                        child: OutlinedButton(
                          onPressed: () {
                            setState(() {
                              isEditMode = !isEditMode;
                            });
                          },
                          style: ButtonStyle(
                            side: MaterialStateProperty.all(
                              BorderSide(color: Color(0xff5D5FEF)),
                            ),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0))),
                          ),
                          child: Text('Edit',
                              style: TextStyle(color: Color(0xff5D5FEF))),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: height * 0.03,
                  )
                ]),
              ),
            ),
    );
  }

  UploadTask task;
  Future<bool> deleteFolder() async {
    final uid = FirebaseAuth.instance.currentUser.uid;
    try {
      final awa = await FirebaseStorage.instance
          .ref()
          .child("serviceImage/$uid")
          .listAll();
      awa.items.forEach((element) {
        element.delete();
      });
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future uploadEmployeeImages() async {
    final uid = FirebaseAuth.instance.currentUser.uid;

    try {
      for (var img in employeeList) {
        File file = File(img.imagefile);
        final ref = FirebaseStorage.instance
            .ref()
            .child('serviceImage/$uid/${basename(file.path)}');
        await ref.putFile(file).whenComplete(() async {
          await ref.getDownloadURL().then((value) {
            setState(() {
              finalEmployeeList.add(EmployeeDetailList(
                  name: img.name,
                  number: img.number,
                  imagefile: value.toString()));
            });
          });
        });
      }
      setState(() {
        employeeImagesuploaded = true;
      });
    } catch (e) {
      print(e.toString());
      setState(() {
        employeeImagesuploaded = false;
      });
    }
  }

  Future uploadImage(String imgString, bool isOwner) async {
    final uid = FirebaseAuth.instance.currentUser.uid;

    try {
      File file = File(imgString);
      final ref = FirebaseStorage.instance
          .ref()
          .child('serviceImage/$uid/${basename(file.path)}');
      await ref.putFile(file).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          setState(() {
            if (isOwner) {
              ownerImageUrl = value;
            } else {
              parlourImageUrl = value;
            }
          });
        });
      });
      setState(() {
        ownerImageuploaded = true;
        parlourImageuploaded = true;
      });
    } catch (e) {
      print(e.toString());
      setState(() {
        ownerImageuploaded = false;
        parlourImageuploaded = false;
      });
    }
  }
}

class MyClip extends CustomClipper<Rect> {
  Rect getClip(Size size) {
    return Rect.fromLTWH(0, 0, 100, 100);
  }

  bool shouldReclip(oldClipper) {
    return false;
  }
}
