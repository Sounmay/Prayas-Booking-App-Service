import 'package:cloud_firestore/cloud_firestore.dart';

class ParlourBookingList {
  List<ParlourBooking> parlourBooking;

  ParlourBookingList({this.parlourBooking});

  ParlourBookingList.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data();

    if (data != null) {
      parlourBooking = new List<ParlourBooking>();
      data['event'].forEach((v) {
        parlourBooking.add(new ParlourBooking.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.parlourBooking != null) {
      data['event'] = this.parlourBooking.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ParlourBooking {
  String name;
  String service;
  String amount;
  String timeslot;
  Timestamp date;

  ParlourBooking({this.name, this.service, this.amount, this.timeslot, this.date});

  ParlourBooking.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    service = json['service'];
    amount = json['amount'];
    timeslot = json['timeslot'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['service'] = this.service;
    data['amount'] = this.amount;
    data['timeslot'] = this.timeslot;
    data['date'] = this.date;
    return data;
  }
}
