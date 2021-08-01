import 'package:cloud_firestore/cloud_firestore.dart';

class ParlourBooking {
  final String amount;
  final String name;
  final Timestamp date;
  final String service;

  ParlourBooking(
      {this.amount = "",
      this.name="",
      this.date,
      this.service = ""});

  factory ParlourBooking.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data();

    return ParlourBooking(
        name: data['name'],
        service: data['service'],
        amount: data['amount'],
        date: data['date']);
  }
}



