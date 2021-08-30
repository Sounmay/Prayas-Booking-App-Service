import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freelance_booking_app_service/Models/User.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments as Map<dynamic, dynamic>;
    final userDetails = args["userDetails"];
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Profile', style: TextStyle(color: Colors.black),),
        leading: BackButton(
            color: Colors.black
        ),
      ),
      bottomNavigationBar: Container(
        height: 100,
        color: Colors.white,
        child: InkWell(
          onTap: () => print('tap on close'),
          child: Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Column(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.logout_outlined),
                  color: Theme.of(context).accentColor,
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.pop(context);
                  },
                ),
                Text('Log Out'),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FlatButton(
                  child: Container(
                    padding: EdgeInsets.only(left: 5.0),
                    width: width*0.25,
                    height: height*0.05,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      border: Border.all(color: Color(0xff5D5FEF))
                    ),
                    child: Center(
                      child: Row(
                        children: [
                          Text(
                            'Edit Profile', style: TextStyle(color: Color(0xff5D5FEF)),
                          ),
                          Icon(Icons.edit, color: Color(0xff5D5FEF),),
                        ],
                      ),
                    )
                  ),
                  onPressed: (){
                    Navigator.pushNamed(
                        context, '/editprofile',
                        arguments: {
                          "userDetails": userDetails
                        }
                    );
                  },
                )
              ],
            ),
            Row(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  margin: EdgeInsets.all(10.0),
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: ClipOval(
                    child: CachedNetworkImage(
                      imageUrl: userDetails.image,
                      fit: BoxFit.fitHeight,
                      height: 40,
                      width: 40,

                      // placeholder: (context, url) =>
                      //     new Image.asset('assets/doctor.png'),
                      errorWidget: (context, url, error) => new Stack(
                        fit: StackFit.expand,
                        children: [
                          Icon(Icons.hide_image, size: 40),
                          ClipRRect(
                            // Clip it cleanly.
                            child: Container(
                              color: Colors.grey[100].withOpacity(0.1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20.0,),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('${userDetails.name}', style: TextStyle(color: Colors.black, fontSize: 22),),
                      Text('${userDetails.number}', style: TextStyle(color: Colors.black),),
//                      Text('lokeshgain@gmail.com', style: TextStyle(color: Colors.black),),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.insert_drive_file, color: Color(0xff5D5FEF), size: 40,),
                          SizedBox(width: 20.0,),
                          Text('Edit Form', style: TextStyle(color: Color(0xff5D5FEF), fontSize: 15),),
                          Divider(
                              color: Colors.black
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 10.0,),
                  Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.photo, color: Color(0xff5D5FEF), size: 40,),
                          SizedBox(width: 20.0,),
                          Text('Photos', style: TextStyle(color: Color(0xff5D5FEF), fontSize: 15),),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 10.0,),
                  Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.credit_card, color: Color(0xff5D5FEF), size: 40,),
                          SizedBox(width: 20.0,),
                          Text('Payments', style: TextStyle(color: Color(0xff5D5FEF), fontSize: 15),),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 10.0,),
                  Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.food_bank, color: Color(0xff5D5FEF), size: 40,),
                          SizedBox(width: 20.0,),
                          Text('Bank Details', style: TextStyle(color: Color(0xff5D5FEF), fontSize: 15),),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 10.0,),
                  Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.calendar_today, color: Color(0xff5D5FEF), size: 40,),
                          SizedBox(width: 20.0,),
                          Text('Service History', style: TextStyle(color: Color(0xff5D5FEF), fontSize: 15),),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 10.0,),
                  Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.book_online, color: Color(0xff5D5FEF), size: 40,),
                          SizedBox(width: 20.0,),
                          Text('Terms and Conditions', style: TextStyle(color: Color(0xff5D5FEF), fontSize: 15),),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 10.0,),
                  Column(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.settings, color: Color(0xff5D5FEF), size: 40,),
                          SizedBox(width: 20.0,),
                          Text('Settings', style: TextStyle(color: Color(0xff5D5FEF), fontSize: 15),),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 10.0,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
