import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:flutter/cupertino.dart';

class DoctorFinal extends StatefulWidget {
  @override
  _DoctorFinalState createState() => _DoctorFinalState();
}

class _DoctorFinalState extends State<DoctorFinal> {
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
              Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * 0.32,
                  width: MediaQuery.of(context).size.width * 1,
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  padding:
                      EdgeInsets.symmetric(horizontal: 60.0, vertical: 20.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Color(0xff0F2735)),
                  child: Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.blueAccent,
                              radius: 30.0,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Column(
                              children: [
                                Text(
                                  'DR. MUKUND DEV',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.phone_outlined,
                                        color: Color(0xff5D5FEF)),
                                    Text(
                                      '+91992334789',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
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
                                'MD in Medicines',
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
                          '5+ years',
                          style: TextStyle(color: Color(0xffFFFFFF)),
                        ),
                      ],
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  'Clinic details',
                  style: TextStyle(color: Color(0xff606572)),
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  decoration: BoxDecoration(color: Colors.grey[400]),
                  height: MediaQuery.of(context).size.height * 0.22,
                  width: MediaQuery.of(context).size.width * 0.4,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: SizedBox(
                  height: 40,
                  width: 110,
                  child: TextButton(
                    onPressed: () {},
                    child: Row(children: [
                      Text('Add Photo', style: TextStyle(color: Colors.white)),
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
                            text: 'Sec 19, Near library, Rourkela',
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
                  'Shri Clinic',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
              Text('_______________',
                  style: TextStyle(color: Color(0xff5D5FEF), fontSize: 25)),
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
                      height: MediaQuery.of(context).size.height * 0.5 * 0.06,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Text(
                          'Step into our salon and experience the most contemporary hair cutting, coloring, and designing techniques in demand today. Our talented team of devoted stylists has dedicated their time by continuing their education to ensure you have the latest up to date style.',
                          softWrap: true,
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Color(0xff8F8F8F))),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.5 * 0.06,
                    ),
                    Text('Admin Details',
                        style: TextStyle(
                            color: Color(0xff5D5FEF),
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 10,
                    ),
                    new Container(
                        width: MediaQuery.of(context).size.width * 0.25,
                        height: MediaQuery.of(context).size.height * 0.1,
                        margin: EdgeInsets.only(bottom: 8),
                        decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage('assets/doctor 3.png')
                                /*FileImage(File(
                                                    _employeeList[index]
                                                        .imagefile))*/
                                ))),
                    new Text(
                      'Martha',
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: new Text(
                        'NURSE',
                        style:
                            TextStyle(color: Color(0xff00A676), fontSize: 12),
                      ),
                    ),
                    new Text(
                      '+91 1234567890',
                      style: TextStyle(color: Color(0xff5D5FEF), fontSize: 12),
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  TextButton(
                      onPressed: () async {
                        /*
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
                            }*/
                      },
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Looks Good!!',
                                  style: TextStyle(color: Colors.white)),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.04,
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
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0))),
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
}
