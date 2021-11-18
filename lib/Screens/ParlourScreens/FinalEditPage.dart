import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:random_string/random_string.dart';
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
  String status = '';
  bool employeeImagesuploaded = false,
      parlourImageuploaded = false,
      ownerImageuploaded = false;
  String isApproved = 'Pending';

  bool agree = false;
  String sUid = randomAlphaNumeric(6);

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
                children: [
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    margin: EdgeInsets.all(10.0),
                    child: Center(
                      child: Text(
                          'Registration in progress. Please do not press the back button or close the application.',
                          textAlign: TextAlign.center),
                    ),
                  )
                ],
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
                                bottomRight: Radius.circular(10)))),
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
                                                        parlourImagepath = file
                                                            .path
                                                            .toString();
                                                      });
                                                      Navigator.pop(context);
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
                          onPressed: () {
                            if (parlourImagepath == "")
                              Fluttertoast.showToast(
                                  msg: 'Please add all images');
                            if (parlourImagepath != "")
                              return showDialog(
                                context: context,
                                builder: (BuildContext context) =>
                                    StatefulBuilder(
                                  builder: (context, setState) => AlertDialog(
                                    title: const Text('Terms and Conditions'),
                                    content: SingleChildScrollView(
                                      child: ListBody(
                                        children: <Widget>[
                                          new SingleChildScrollView(
                                            child: Text(
                                                'We reserve the right, in our sole discretion, to make changes or modifications to these Terms and Conditions at any time and for any reason. We will alert you about any changes by updating the “Last updated” date of these Terms and Conditions and you waive any right to receive specific notice of each such change. It is your responsibility to periodically review these Terms and Conditions to stay informed of updates. You will be subject to, and will be deemed to have been made aware of and to have accepted, the changes in any revised Terms and Conditions by your continued use of the Application after the date such revised Terms and conditions are posted. \n The information provided on the Application is not intended for distribution to or use by any person or entity in any jurisdiction or country where such distribution or use would be contrary to law or regulation or which would subject us to any registration requirement within such jurisdiction or country. Accordingly, those persons who choose to access the Application from other locations do so on their own initiative and are solely responsible for compliance with local laws, if and to the extent local laws are applicable.\n Option 1: The Application is intended for users who are at least 18 years old. Persons under the age of 13 are not permitted to register for the Application.\n Option 2: The Application is intended for users who are at least 13 years of age. All users who are minors in the jurisdiction in which they reside (generally under the age of 18) must have the permission of, and be directly supervised by, their parent or guardian to use the Application. If you are a minor, you must have your parent or guardian read and agree to these Terms of Use prior to you using the Application. \n \n INTELLECTUAL PROPERTY RIGHTS \n Unless otherwise indicated, the Application is our proprietary property and all source code, databases, functionality, software, website designs, audio, video, text, photographs, and graphics on the Application (collectively, the “Content”) and the trademarks, service marks, and logos contained therein (the “Marks”) are owned or controlled by us or licensed to us, and are protected by copyright and trademark laws and various other intellectual property rights and unfair competition laws of the India, foreign jurisdictions, and international conventions. The Content and the Marks are provided on the Application for your information and personal use only. Except as expressly provided in these Terms of Use, no part of the Application and no Content or Marks may be copied, reproduced, aggregated, republished, uploaded, posted, publicly displayed, encoded, translated, transmitted, distributed, sold, licensed, or otherwise exploited for any commercial purpose whatsoever, without our express prior written permission. \n Provided that you are eligible to use the Application, you are granted a limited license to access and use the Application and to download or print a copy of any portion of the Content to which you have properly gained access solely for your personal, non-commercial use. We reserve all rights not expressly granted to you in and to the Application, Content, and the Marks. \n\n USER REPRESENTATIONS \n \n By using the Application, you represent and warrant that: (1) all registration information you submit will be true, accurate, current, and complete; (2) you will maintain the accuracy of such information and promptly update such registration information as necessary; (3) you have the legal capacity and you agree to comply with these Terms of Use; (4) you are not under the age of 13; (5) not a minor in the jurisdiction in which you reside, or if a minor, you have received parental permission to use the Site; (6) you will not access the Application through automated or non-human means, whether through a bot, script or otherwise; (7) you will not use the Application for any illegal or unauthorized purpose; and (8) your use of the Application will not violate any applicable law or regulation. \n If you provide any information that is untrue, inaccurate, not current, or incomplete, we have the right to suspend or terminate your account and refuse any and all current or future use of the Application (or any portion thereof). \n \n USER REGISTRATION\nYou may be required to register with the Application. You agree to keep your password confidential and will be responsible for all use of your account and password. We reserve the right to remove, reclaim, or change a username you select if we determine, in our sole discretion, that such username is inappropriate, obscene, or otherwise objectionable. \n \n PROHIBITED ACTIVITIES\nYou may not access or use the Application for any purpose other than that for which we make the Application available. The Application may not be used in connection with any commercial endeavors except those that are specifically endorsed or approved by us. \n 1. Systematically retrieve data or other content from the Application to create or compile, directly or indirectly, a collection, compilation, database, or directory without written permission from us.\n 2. Make any unauthorized use of the Application, including collecting usernames and/or email addresses of users by electronic or other means for the purpose of sending unsolicited email, or creating user accounts by automated means or under false pretenses. \n 3. Use the Application to advertise or offer to sell goods and services. \n 4. Circumvent, disable, or otherwise interfere with security-related features of the Application, including features that prevent or restrict the use or copying of any Content or enforce limitations on the use of the Application and/or the Content contained therein. \n 5. Engage in unauthorized framing of or linking to the Application. \n 6. Trick, defraud, or mislead us and other users, especially in any attempt to learn sensitive account information such as user passwords; \n 7. Make improper use of our support services or submit false reports of abuse or misconduct. \n 8. Engage in any automated use of the system, such as using scripts to send comments or messages, or using any data mining, robots, or similar data gathering and extraction tools. \n 9. Interfere with, disrupt, or create an undue burden on the Application or the networks or services connected to the Application. \n 10. Attempt to impersonate another user or person or use the username of another user. \n 11. Sell or otherwise transfer your profile. \n 12. Use any information obtained from the Application in order to harass, abuse, or harm another person. \n 13. Use the Application as part of any effort to compete with us or otherwise use the Application and/or the Content for any revenue-generating endeavor or commercial enterprise. \n 14. Decipher, decompile, disassemble, or reverse engineer any of the software comprising or in any way making up a part of the Application. \n 15. Attempt to bypass any measures of the Application designed to prevent or restrict access to the Application, or any portion of the Application. \n 16. Harass, annoy, intimidate, or threaten any of our employees or agents engaged in providing any portion of the Application to you.\n 17. Delete the copyright or other proprietary rights notice from any Content. \n 18. Copy or adapt the Application’s software, including but not limited to Flash, PHP, HTML, JavaScript, or other code. \n 19. Upload or transmit (or attempt to upload or to transmit) viruses, Trojan horses, or other material, including excessive use of capital letters and spamming (continuous posting of repetitive text), that interferes with any party’s uninterrupted use and enjoyment of the Application or modifies, impairs, disrupts, alters, or interferes with the use, features, functions, operation, or maintenance of the Application. \n 20. Upload or transmit (or attempt to upload or to transmit) any material that acts as a passive or active information collection or transmission mechanism, including without limitation, clear graphics interchange formats (“gifs”), 1×1 pixels, web bugs, cookies, or other similar devices (sometimes referred to as “spyware” or “passive collection mechanisms” or “pcms”). \n 21. Except as may be the result of standard search engine or Internet browser usage, use, launch, develop, or distribute any automated system, including without limitation, any spider, robot, cheat utility, scraper, or offline reader that accesses the Application, or using or launching any unauthorized script or other software. \n 22. Disparage, tarnish, or otherwise harm, in our opinion, us and/or the Application. \n 23. Use the Application in a manner inconsistent with any applicable laws or regulations.\n\nMODIFICATIONS AND INTERRUPTIONS\nWe reserve the right to change, modify, or remove the contents of the Application at any time or for any reason at our sole discretion without notice. However, we have no obligation to update any information on our Application. We also reserve the right to modify or discontinue all or part of the Application without notice at any time. We will not be liable to you or any third party for any modification, price change, suspension, or discontinuance of the Application.We cannot guarantee the Application will be available at all times. We may experience hardware, software, or other problems or need to perform maintenance related to the Application, resulting in interruptions, delays, or errors. We reserve the right to change, revise, update, suspend, discontinue, or otherwise modify the Application at any time or for any reason without notice to you. You agree that we have no liability whatsoever for any loss, damage, or inconvenience caused by your inability to access or use the Application during any downtime or discontinuance of the Application. Nothing in these Terms of Use will be construed to obligate us to maintain and support the Application or to supply any corrections, updates, or releases in connection therewith. \n \nPRIVACY POLICY\nWe care about data privacy and security. By using the Application, you agree to be bound by our Privacy Policy, which is incorporated into these Terms of Use. Please be advised the Application is hosted in the India. If you access the Application from the European Union, Asia, or any other region of the world with laws or other requirements governing personal data collection, use, or disclosure that differ from applicable laws in the India, then through your continued use of the Application or Services, you are transferring your data to the India, and you expressly consent to have your data transferred to and processed in the India. Further, we do not knowingly accept, request, or solicit information from children or knowingly market to children. Therefore, in accordance of Children’s Online Privacy Protection Act, if we receive actual knowledge that anyone under the age of 13 has provided personal information to us without the requisite and verifiable parental consent, we will delete that information from the Application as quickly as is reasonably practical.\n\nCORRECTIONS\nThere may be information on the Application that contains typographical errors, inaccuracies, or omissions that may relate to the Application, including descriptions, pricing, availability, and various other information. We reserve the right to correct any errors, inaccuracies, or omissions and to change or update the information on the Application at any time, without prior notice.\n\nDISCLAIMER\nTHE APPLICATION IS PROVIDED ON AN AS-IS AND AS-AVAILABLE BASIS. YOU AGREE THAT YOUR USE OF THE APPLICATION SERVICES WILL BE AT YOUR SOLE RISK. TO THE FULLEST EXTENT PERMITTED BY LAW, WE DISCLAIM ALL WARRANTIES, EXPRESS OR IMPLIED, IN CONNECTION WITH THE APPLICATION AND YOUR USE THEREOF, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, AND NON-INFRINGEMENT. WE MAKE NO WARRANTIES OR REPRESENTATIONS ABOUT THE ACCURACY OR COMPLETENESS OF THE APPLICATION’S CONTENT OR THE CONTENT OF ANY WEBSITES LINKED TO THIS APPLICATION AND WE WILL ASSUME NO LIABILITY OR RESPONSIBILITY FOR ANY (1) ERRORS, MISTAKES, OR INACCURACIES OF CONTENT AND MATERIALS, (2) PERSONAL INJURY OR PROPERTY DAMAGE, OF ANY NATURE WHATSOEVER, RESULTING FROM YOUR ACCESS TO AND USE OF THE APPLICATION, (3) ANY UNAUTHORIZED ACCESS TO OR USE OF OUR SECURE SERVERS AND/OR ANY AND ALL PERSONAL INFORMATION AND/OR FINANCIAL INFORMATION STORED THEREIN, (4) ANY INTERRUPTION OR CESSATION OF TRANSMISSION TO OR FROM THE APPLICATION, (5) ANY BUGS, VIRUSES, TROJAN HORSES, OR THE LIKE WHICH MAY BE TRANSMITTED TO OR THROUGH THE APPLICATION BY ANY THIRD PARTY, AND/OR (6) ANY ERRORS OR OMISSIONS IN ANY CONTENT AND MATERIALS OR FOR ANY LOSS OR DAMAGE OF ANY KIND INCURRED AS A RESULT OF THE USE OF ANY CONTENT POSTED, TRANSMITTED, OR OTHERWISE MADE AVAILABLE VIA THE APPLICATION. WE DO NOT WARRANT, ENDORSE, GUARANTEE, OR ASSUME RESPONSIBILITY FOR ANY PRODUCT OR SERVICE ADVERTISED OR OFFERED BY A THIRD PARTY THROUGH THE APPLICATION, ANY HYPERLINKED WEBSITE, OR ANY WEBSITE OR MOBILE APPLICATION FEATURED IN ANY BANNER OR OTHER ADVERTISING, AND WE WILL NOT BE A PARTY TO OR IN ANY WAY BE RESPONSIBLE FOR MONITORING ANY TRANSACTION BETWEEN YOU AND ANY THIRD-PARTY PROVIDERS OF PRODUCTS OR SERVICES. AS WITH THE PURCHASE OF A PRODUCT OR SERVICE THROUGH ANY MEDIUM OR IN ANY ENVIRONMENT, YOU SHOULD USE YOUR BEST JUDGMENT AND EXERCISE CAUTION WHERE APPROPRIATE.\n\nLIMITATIONS OF LIABILITY\nIN NO EVENT WILL WE OR OUR DIRECTORS, EMPLOYEES, OR AGENTS BE LIABLE TO YOU OR ANY THIRD PARTY FOR ANY DIRECT, INDIRECT, CONSEQUENTIAL, EXEMPLARY, INCIDENTAL, SPECIAL, OR PUNITIVE DAMAGES, INCLUDING LOST PROFIT, LOST REVENUE, LOSS OF DATA, OR OTHER DAMAGES ARISING FROM YOUR USE OF THE APPLICATION, EVEN IF WE HAVE BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES. [NOTWITHSTANDING ANYTHING TO THE CONTRARY CONTAINED HEREIN, OUR LIABILITY TO YOU FOR ANY CAUSE WHATSOEVER AND REGARDLESS OF THE FORM OF THE ACTION, WILL AT ALL TIMES BE LIMITED TO [THE LESSER OF] [THE AMOUNT PAID, IF ANY, BY YOU TO US DURING THE [# of months] MONTH PERIOD PRIOR TO ANY CAUSE OF ACTION ARISING [OR] [Amount]. CERTAIN STATE LAWS DO NOT ALLOW LIMITATIONS ON IMPLIED WARRANTIES OR THE EXCLUSION OR LIMITATION OF CERTAIN DAMAGES. IF THESE LAWS APPLY TO YOU, SOME OR ALL OF THE ABOVE DISCLAIMERS OR LIMITATIONS MAY NOT APPLY TO YOU, AND YOU MAY HAVE ADDITIONAL RIGHTS.]\n\nINDEMNIFICATION\nYou agree to defend, indemnify, and hold us harmless, including our subsidiaries, affiliates, and all of our respective officers, agents, partners, and employees, from and against any loss, damage, liability, claim, or demand, including reasonable attorneys’ fees and expenses, made by any third party due to or arising out of: (1) your Contributions; (2) use of the Site; (3) breach of these Terms of Use; (4) any breach of your representations and warranties set forth in these Terms of Use; (5) your violation of the rights of a third party, including but not limited to intellectual property rights; or (6) any overt harmful act toward any other user of the Site with whom you connected via the Site. Notwithstanding the foregoing, we reserve the right, at your expense, to assume the exclusive defense and control of any matter for which you are required to indemnify us, and you agree to cooperate, at your expense, with our defense of such claims. We will use reasonable efforts to notify you of any such claim, action, or proceeding which is subject to this indemnification upon becoming aware of it.\n\nUSER DATA\nWe will maintain certain data that you transmit to the Site for the purpose of managing the Site, as well as data relating to your use of the Site. Although we perform regular routine backups of data, you are solely responsible for all data that you transmit or that relates to any activity you have undertaken using the Site. You agree that we shall have no liability to you for any loss or corruption of any such data, and you hereby waive any right of action against us arising from any such loss or corruption of such data.\n\nELECTRONIC COMMUNICATIONS, TRANSACTIONS, AND SIGNATURES\nVisiting the Site, sending us emails, and completing online forms constitute electronic communications. You consent to receive electronic communications, and you agree that all agreements, notices, disclosures, and other communications we provide to you electronically, via email and on the Site, satisfy any legal requirement that such communication be in writing. YOU HEREBY AGREE TO THE USE OF ELECTRONIC SIGNATURES, CONTRACTS, ORDERS, AND OTHER RECORDS, AND TO ELECTRONIC DELIVERY OF NOTICES, POLICIES, AND RECORDS OF TRANSACTIONS INITIATED OR COMPLETED BY US OR VIA THE SITE. You hereby waive any rights or requirements under any statutes, regulations, rules, ordinances, or other laws in any jurisdiction which require an original signature or delivery or retention of non-electronic records, or to payments or the granting of credits by any means other than electronic means.\n\nMISCELLANEOUS\nThese Terms of Use and any policies or operating rules posted by us on the Application constitute the entire agreement and understanding between you and us. Our failure to exercise or enforce any right or provision of these Terms of Use shall not operate as a waiver of such right or provision. These Terms of Use operate to the fullest extent permissible by law. We may assign any or all of our rights and obligations to others at any time. We shall not be responsible or liable for any loss, damage, delay, or failure to act caused by any cause beyond our reasonable control. If any provision or part of a provision of these Terms of Use is determined to be unlawful, void, or unenforceable, that provision or part of the provision is deemed severable from these Terms of Use and does not affect the validity and enforceability of any remaining provisions. There is no joint venture, partnership, employment or agency relationship created between you and us as a result of these Terms of Use or use of the Site. You agree that these Terms of Use will not be construed against us by virtue of having drafted them. You hereby waive any and all defenses you may have based on the electronic form of these Terms of Use and the lack of signing by the parties hereto to execute these Terms of Use.\n\nCONTACT US\nIn order to resolve a complaint regarding the Application or to receive further information regarding use of the Application, please contact us at:\n[Correspondence Phone Number] 9692442037\n[Email Address] prayas@gmail.com'),
                                          )
                                        ],
                                      ),
                                    ),
                                    actions: <Widget>[
                                      Row(
                                        children: [
                                          Material(
                                            child: Checkbox(
                                              value: agree,
                                              onChanged: (value) {
                                                setState(() {
                                                  agree = value;
                                                });
                                              },
                                            ),
                                          ),
                                          Flexible(
                                            child: Text(
                                              'I have read and accepted terms and conditions',
                                              overflow: TextOverflow.visible,
                                            ),
                                          )
                                        ],
                                      ),
                                      TextButton(
                                          onPressed: agree
                                              ? () async {
                                                  Navigator.pop(context, true);
                                                }
                                              : null,
                                          style: agree
                                              ? ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          Colors.blue))
                                              : ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          Colors.grey)),
                                          child: Text(
                                            'Accept',
                                            style: agree
                                                ? TextStyle(color: Colors.white)
                                                : TextStyle(
                                                    color: Colors.white10),
                                          )),
                                    ],
                                  ),
                                ),
                              ).then((value) async {
                                if (value == true) {
                                  setState(() {
                                    isLoading = true;
                                    employeeList = _employeeList;
                                  });
                                  try {
                                    // deleteFolder();
                                    await uploadEmployeeImages();
                                    await uploadImage(
                                        _location.ownerImage, true);
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
                                          serviceUid: _location.serviceUid,
                                          servId: sUid,
                                          status: status,
                                          regDate: DateTime.now());

                                      Details finalParlourDetails = Details(
                                        aboutParlour: _details.aboutParlour,
                                        parlourImage: parlourImageUrl,
                                        parlourType: _details.parlourType,
                                        numOfEmployees: _details.numOfEmployees,
                                        serviceType: 'Parlour',
                                      );

                                      if (title == "PARLOUR") {
                                        DatabaseService()
                                            .uploadParlourServiceData(
                                                finalParlourLocation,
                                                finalParlourDetails,
                                                finalEmployeeList,
                                                parlourProvider
                                                    .parlourServiceListDetails,
                                                parlourProvider
                                                    .parlourSlotListDetails);
                                      } else {
                                        DatabaseService()
                                            .uploadSalonServiceData(
                                                finalParlourLocation,
                                                finalParlourDetails,
                                                finalEmployeeList,
                                                parlourProvider
                                                    .parlourServiceListDetails,
                                                parlourProvider
                                                    .parlourSlotListDetails);
                                      }

                                      setState(() {
                                        isLoading = false;
                                        DatabaseService().setRegistered().then(
                                            (value) => Navigator.popUntil(
                                                context,
                                                ModalRoute.withName(
                                                    '/wrapper')));
                                      });
                                    }
                                  } catch (e) {
                                    print(e.toString());
                                    setState(() {
                                      isLoading = false;
                                    });
                                  }
                                }
                              });
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
          ref.getDownloadURL().then((value) {
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
