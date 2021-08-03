import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  String id;
  String customerName;
  List<dynamic> serviceNames;
  List<dynamic> price;
  List<dynamic> timeList;
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

  Event.fromJson(Map<String, dynamic> json) {
    uid = json['serviceId'];
    isApproved = json['isApproved'];
    id = json['id'];
    otp = json['otp'];
    customerName = json['name'];
    serviceNames = json['serviceName'].cast<String>();
    price = json['price'].cast<int>();
    day = json['date'];
    timeList = json['serviceTimeList'];
    timeSlot = json['timeslot'];
    subtotal = json['amount'];
    time = json['serviceTime'];
  }

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
