import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments as Map<dynamic, dynamic>;
    final userDetails = args["userDetails"];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Edit Profile', style: TextStyle(color: Colors.black),),
        leading: BackButton(
            color: Colors.black
        ),
        actions: [
          FlatButton(
              onPressed: (){},
              child: Container(
                padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff5D5FEF)),
                  borderRadius: BorderRadius.circular(20.0)
                ),
                child: Text('Save'),
              )
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50.0,),
            Center(
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    margin: EdgeInsets.all(10.0),
                    decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: ClipOval(
                      child: CachedNetworkImage(
                        imageUrl: userDetails.image,
                        fit: BoxFit.fitHeight,
                        height: 150,
                        width: 150,

                        placeholder: (context, url) =>
                        new Image.asset('assets/doctor.png'),
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
                  Container(
                    margin: EdgeInsets.all(10.0),
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle
                    ),
                    child: Center(
                      child: IconButton(
                        icon: Icon(Icons.camera_alt, color: Colors.white,),
                      ),
                    )
                  )
                ],
              ),
            ),
            SizedBox(height: 30.0,),
            Container(
              margin: EdgeInsets.all(20.0),
              child: TextFormField(
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: -20),
                    hintText: 'Name',
                    hintStyle: TextStyle(fontSize: 12)),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(20.0),
              child: TextFormField(
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: -20),
                    hintText: 'Email ID',
                    hintStyle: TextStyle(fontSize: 12)),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter your email address';
                  }
                  return null;
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(20.0),
              child: TextFormField(
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: -20),
                    hintText: 'Phone Number',
                    hintStyle: TextStyle(fontSize: 12)),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter your number';
                  }
                  return null;
                },
              ),
            ),
          ],
        )
      ),
    );
  }
}
