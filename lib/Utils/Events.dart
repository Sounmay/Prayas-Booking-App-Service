import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  String id;
  String address;
  String customerName;
  List<dynamic> serviceNames;
  List<dynamic> price;
  List<dynamic> timeList;
  Timestamp day;
  String timeSlot, shopName;
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
      this.address,
      this.customerName,
      this.serviceNames,
      this.price,
      this.timeList,
      this.day,
      this.shopName,
      this.subtotal,
      this.timeSlot,
      this.time});

  Event.fromJson(Map<String, dynamic> json) {
    uid = json['serviceId'];
    isApproved = json['isApproved'];
    id = json['id'];
    address = json['address'];
    shopName = json['shopName'];
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
        "shopName": shopName,
        "isApproved": approval,
        "id": id,
        "otp": otp,
        "address": address,
        "name": customerName,
        "serviceName": serviceNames,
        "price": price,
        "serviceTimeList": timeList,
        "date": day,
        "timeslot": timeSlot,
        "amount": subtotal,
        "serviceTime": time,
      };
}
