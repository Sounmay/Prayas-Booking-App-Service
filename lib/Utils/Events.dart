import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  final String id;
  final String customerName;
  final List<dynamic> serviceNames;
  final List<dynamic> price;
  final List<dynamic> timeList;
  Timestamp day;
  String timeSlot;
  int subtotal;
  int time;
  bool isApproved;
  String otp;
  String uid;

  Event(
      {this.id,
      this.uid,
      this.otp,
      this.isApproved,
      this.customerName,
      this.serviceNames,
      this.price,
      this.timeList,
      this.day,
      this.subtotal,
      this.timeSlot,
      this.time});

  Map<String, dynamic> toJson(String uid, bool approval) => {
        "serviceId": uid,
        "isApproved": approval,
        "id": id,
        "otp": otp,
        "name": "naiyar",
        "serviceName": serviceNames,
        "price": price,
        "serviceTimeList": timeList,
        "date": day,
        "timeslot": timeSlot,
        "amount": subtotal,
        "serviceTime": time,
      };
}
