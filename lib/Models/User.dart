import 'package:cloud_firestore/cloud_firestore.dart';

class AppUser {
  final String uid;
  final String name;
  final String image;

  AppUser({this.uid="", this.name="",this.image=""});
  
}



class AppUserDetails {
  final String uid;
  final String name;
  final String image;
  final bool isRegistered;

  AppUserDetails({this.uid = "", this.name = "", this.image = "", this.isRegistered=false});

  factory AppUserDetails.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data();

    return AppUserDetails(
      name: data['name'],
      isRegistered: data['isRegistered']
    );
  }
}

