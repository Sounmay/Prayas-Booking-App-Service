import 'dart:io';
import 'package:path/path.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:freelance_booking_app_service/Models/ClinicDetailsModel.dart';
import 'package:freelance_booking_app_service/Providers/ClinicDetailsProvider.dart';
import 'package:freelance_booking_app_service/Providers/database.dart';
import 'package:image_picker/image_picker.dart';
import 'package:marquee/marquee.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class DoctorFinal extends StatefulWidget {
  @override
  _DoctorFinalState createState() => _DoctorFinalState();
}

class _DoctorFinalState extends State<DoctorFinal> {
  UploadTask task;
  File file;
  List<DoctorDetails> _doctorList = [];
  List<DoctorDetails> _finaldoctorList = [];
  bool doctorImagesUploaded = false;

  var employeeImage = "";
  bool isLoading = false,
      clinicImageuploaded = false,
      adminImageuploaded = false;

  String clinicImageUrl = '';
  String adminImageUrl = '';

  @override
  Widget build(BuildContext context) {
    final clinic = Provider.of<ClinicDetailsProvider>(context);

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
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                            height: 110,
                            width: 10,
                            decoration: BoxDecoration(
                                color: Color(0xff5D5FEF),
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10)))),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.7,
                          margin: EdgeInsets.only(left: 10),
                          child: Text(
                              'Thanks for filling in your details. Please check before you proceed to the next steps.',
                              softWrap: true,
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.black,
                              )),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    ...List.generate(
                        clinic?.doctorDetails?.length ?? 0,
                        (index) =>
                            doctorCards(clinic?.doctorDetails[index], context)),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        'Clinic details',
                        style: TextStyle(color: Color(0xff606572)),
                      ),
                    ),
                    // ClipRRect(
                    //   borderRadius: BorderRadius.circular(8),
                    //   child: Container(
                    //     decoration: BoxDecoration(color: Colors.grey[400]),
                    //     height: MediaQuery.of(context).size.height * 0.22,
                    //     width: MediaQuery.of(context).size.width * 0.4,
                    //   ),
                    // ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.22,
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: BoxDecoration(color: Colors.grey[400]),
                        child: file != null
                            ? Image.file(
                                File(file.path),
                                fit: BoxFit.cover,
                                width: double.infinity,
                              )
                            : null,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: SizedBox(
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
                                        width:
                                            MediaQuery.of(context).size.width *
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
                                                                source:
                                                                    ImageSource
                                                                        .gallery);

                                                    setState(() {
                                                      file = File(image.path);
                                                      employeeImage =
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
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.45,
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
                              color: Color(0xff02CF96),
                              size: 20,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.35,
                              height: MediaQuery.of(context).size.height * 0.06,
                              child: Marquee(
                                  text: clinic?.clinicLocationAndDoctorDetails
                                          ?.address ??
                                      "",
                                  scrollAxis: Axis.horizontal,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  blankSpace: 20.0,
                                  velocity: 10.0,
                                  style: TextStyle(
                                      color: Color(0xff02CF96),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400)),
                            )
                          ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Text(
                        clinic?.clinicLocationAndDoctorDetails?.clinicName ??
                            "",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text('_______________',
                        style:
                            TextStyle(color: Color(0xff5D5FEF), fontSize: 25)),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      margin:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color:
                                  /*isEditMode
                                ? Color(0xff5D5FEF)
                                :*/
                                  Colors.transparent),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                          /*Row(
                            mainAxisAlignment: /*isEditMode
                                ? MainAxisAlignment.spaceBetween
                                : */MainAxisAlignment.center,
                            children: [
                             /* if (isEditMode) Container(),*/
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
                            ]),*/
                          SizedBox(
                            height:
                                MediaQuery.of(context).size.height * 0.5 * 0.06,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Text(
                                clinic?.clinicLocationAndDoctorDetails
                                        ?.aboutClinic ??
                                    "",
                                softWrap: true,
                                textAlign: TextAlign.left,
                                style: TextStyle(color: Color(0xff8F8F8F))),
                          ),
                          SizedBox(
                            height:
                                MediaQuery.of(context).size.height * 0.5 * 0.06,
                          ),
                          Text('Admin Details',
                              style: TextStyle(
                                  color: Color(0xff5D5FEF),
                                  fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 10,
                          ),
                          // new Container(
                          //     width: MediaQuery.of(context).size.width * 0.25,
                          //     height: MediaQuery.of(context).size.height * 0.1,
                          //     margin: EdgeInsets.only(bottom: 8),
                          //     decoration: new BoxDecoration(
                          //         shape: BoxShape.circle,
                          //         image: new DecorationImage(
                          //             fit: BoxFit.fill,
                          //             image: AssetImage('assets/doctor 3.png')
                          //             /*FileImage(File(
                          //                                 _employeeList[index]
                          //                                     .imagefile))*/
                          //             ))),
                          ClipOval(
                            child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.14,
                                width: MediaQuery.of(context).size.width * 0.2,
                                decoration: BoxDecoration(
                                    color: Colors.grey[400],
                                    image: DecorationImage(
                                        image: AssetImage(
                                          'assets/user.png',
                                        ),
                                        fit: BoxFit.contain)),
                                child: Image.file(
                                  File(clinic?.adminDetails?.imagefile ?? ""),
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                )),
                          ),
                          new Text(
                            clinic?.adminDetails?.name ?? "",
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: new Text(
                              clinic?.adminDetails?.designation ?? "",
                              style: TextStyle(
                                  color: Color(0xff00A676), fontSize: 12),
                            ),
                          ),
                          new Text(
                            clinic?.adminDetails?.number ?? "",
                            style: TextStyle(
                                color: Color(0xff5D5FEF), fontSize: 12),
                          )
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        TextButton(
                            onPressed: () async {
                              print(FirebaseAuth.instance.currentUser.uid);
                              setState(() {
                                isLoading = true;
                                _doctorList = clinic.doctorDetails;
                              });
                              try {
                                await uploadDoctorImages();
                                await uploadImage(
                                    clinic.adminDetails.imagefile, true);
                                await uploadImage(file.path, false);

                                if (adminImageuploaded &&
                                    doctorImagesUploaded &&
                                    clinicImageuploaded) {
                                  clinic.updateAdminImageUrl(adminImageUrl);
                                  clinic.updateClinicImageUrl(clinicImageUrl);
                                  DatabaseService().uploadClinicServiceData(
                                      clinic.clinicLocationAndDoctorDetails,
                                      _finaldoctorList,
                                      clinic.adminDetails);

                                  setState(() {
                                    isLoading = false;
                                    DatabaseService().setRegistered().then(
                                        (value) => Navigator.popUntil(context,
                                            ModalRoute.withName('/wrapper')));
                                  });
                                }
                              } catch (e) {
                                print(e.toString());
                                setState(() {
                                  isLoading = false;
                                });
                              }
                            },
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Looks Good!!',
                                        style: TextStyle(color: Colors.white)),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.04,
                                    ),
                                    Icon(Icons.thumb_up_alt_outlined,
                                        color: Colors.white),
                                  ]),
                            ),
                            style: TextButton.styleFrom(
                                backgroundColor: Color(0xFF00A676))),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.2,
                          child: OutlinedButton(
                            onPressed: () {
                              setState(() {
                                /*isEditMode = !isEditMode;*/
                              });
                            },
                            style: ButtonStyle(
                              side: MaterialStateProperty.all(
                                BorderSide(color: Color(0xff5D5FEF)),
                              ),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(5.0))),
                            ),
                            child: Text('Edit',
                                style: TextStyle(color: Color(0xff5D5FEF))),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  Future uploadDoctorImages() async {
    final uid = FirebaseAuth.instance.currentUser.uid;

    try {
      for (var img in _doctorList) {
        File file = File(img.imagefile);
        final ref = FirebaseStorage.instance
            .ref()
            .child('serviceImageClinic/$uid/${basename(file.path)}');
        await ref.putFile(file).whenComplete(() async {
          await ref.getDownloadURL().then((value) {
            setState(() {
              _finaldoctorList.add(DoctorDetails(
                  name: img.name,
                  number: img.number,
                  aboutDoctor: img.aboutDoctor,
                  specialization: img.specialization,
                  workingDays: img.workingDays,
                  slots: img.slots,
                  yearsOfExperience: img.yearsOfExperience,
                  imagefile: value.toString()));
            });
          });
        });
      }
      setState(() {
        doctorImagesUploaded = true;
      });
    } catch (e) {
      print(e.toString());
      setState(() {
        doctorImagesUploaded = false;
      });
    }
  }

  Future uploadImage(String imgString, bool isAdmin) async {
    final uid = FirebaseAuth.instance.currentUser.uid;

    try {
      File file = File(imgString);
      final ref = FirebaseStorage.instance
          .ref()
          .child('serviceImageClinic/$uid/${basename(file.path)}');
      await ref.putFile(file).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          setState(() {
            if (isAdmin) {
              adminImageUrl = value;
            } else {
              clinicImageUrl = value;
            }
          });
        });
      });
      setState(() {
        adminImageuploaded = true;
        clinicImageuploaded = true;
      });
    } catch (e) {
      print(e.toString());
      setState(() {
        adminImageuploaded = false;
        clinicImageuploaded = false;
      });
    }
  }
}

Widget doctorCards(DoctorDetails doctorDetails, BuildContext context) {
  return Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height * 0.32,
      width: MediaQuery.of(context).size.width * 1,
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 20.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0), color: Color(0xff0F2735)),
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                ClipOval(
                  child: Container(
                      height: MediaQuery.of(context).size.height * 0.08,
                      width: MediaQuery.of(context).size.width * 0.13,
                      decoration: BoxDecoration(
                          color: Colors.grey[400],
                          image: DecorationImage(
                              image: AssetImage(
                                'assets/user.png',
                              ),
                              fit: BoxFit.contain)),
                      child: Image.file(
                        File(doctorDetails?.imagefile),
                        fit: BoxFit.cover,
                        width: double.infinity,
                      )),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Column(
                  children: [
                    Text(
                      doctorDetails.name,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Row(
                      children: [
                        Icon(Icons.phone_outlined, color: Color(0xff5D5FEF)),
                        Text(
                          doctorDetails.number,
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: 20.0),
            Container(
                width: MediaQuery.of(context).size.width * 0.3,
                height: MediaQuery.of(context).size.height * 0.05,
                decoration: BoxDecoration(
                    color: Color(0xffC4C4C4).withOpacity(0.2),
                    border: Border.all(color: Color(0xff5D5FEF)),
                    borderRadius: BorderRadius.circular(5.0)),
                child: Center(
                  child: Text(
                    doctorDetails.specialization,
                    style: TextStyle(color: Color(0xff00E7A4)),
                  ),
                ) // rand comment
                ),
            Text(
              '- - - - - - - -',
              style: TextStyle(color: Color(0xffFBFBFB)),
            ),
            SizedBox(height: 5),
            Text(
              'Experience',
              style: TextStyle(color: Color(0xffFFC700)),
            ),
            Text(
              '${doctorDetails.yearsOfExperience}+ years',
              style: TextStyle(color: Color(0xffFFFFFF)),
            ),
          ],
        ),
      ));
}
