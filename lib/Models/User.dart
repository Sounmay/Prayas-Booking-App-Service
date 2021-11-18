import 'package:cloud_firestore/cloud_firestore.dart';

class AppUser {
  final String uid;
  final String name;
  final String image;
  final String number;

  AppUser({this.uid = "", this.name = "", this.image = "", this.number = ""});
}

class AppUserDetails {
  final String uid;
  final String name;
  final String image;
  final String number;
  final String type;
  final bool isRegistered;

  AppUserDetails(
      {this.uid = "",
      this.name = "",
      this.image = "",
      this.type = "",
      this.isRegistered = false,
      this.number = ""});

  factory AppUserDetails.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data();

    return AppUserDetails(
      name: data['name'],
      isRegistered: data['isRegistered'],
      image: data['image'],
      number: data['number'],
      type: data['type'],
    );
  }
}
