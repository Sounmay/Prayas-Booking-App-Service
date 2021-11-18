import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:freelance_booking_app_service/Models/ClinicDetailsModel.dart';
import 'package:freelance_booking_app_service/Models/ParlourBookings.dart';
import 'package:freelance_booking_app_service/Models/ParlourDetailsModel.dart';
import 'package:freelance_booking_app_service/Models/User.dart';
import 'package:freelance_booking_app_service/Screens/uploadImage.dart';

class DividedSlots {
  final int emp;
  final String time;

  DividedSlots({this.emp, this.time});

  Map<String, dynamic> toJson() => {
        "time": time,
        "emp": emp,
      };
}

class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  final uid = FirebaseAuth.instance?.currentUser?.uid ?? '';
  Future uploadImage(String imgUrl) async {
    FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .update({"image": imgUrl});
  }

  Future updateServiceProviderInfo(
      String name, String number, String newImage) async {
    FirebaseFirestore.instance
        .collection("ServiceProviders")
        .doc(uid)
        .update({"name": name, "number": number, "image": newImage});
  }

  Future setRegistered() async {
    _db.collection('ServiceProviders').doc(uid).update({"isRegistered": true});
  }

  Stream<AppUserDetails> streamUser() {
    var ref = _db.collection('ServiceProviders').doc(uid).snapshots();

    return ref.map((event) => AppUserDetails.fromFirestore(event));
  }

  // Stream<ParlourBookingList> streamBookings() {
  //   var ref = _db.collection('events').doc('thisevent').snapshots();

  //   return ref.map((event) => ParlourBookingList.fromFirestore(event));

  //   // return asfd;
  // }

  uploadClinicServiceData(ClinicLocationAndDoctor clinicLocation,
      List<DoctorDetails> doctorDetailsList, AdminDetails admin) async {
    try {
      await _db.collection("MedicalServices").doc(uid).set({
        "location": clinicLocation.toJson(),
        "doctorList": doctorDetailsList.map((e) => e.toJson()).toList(),
        "adminDetails": admin.toJson(),
        "type": "clinic"
      });
      await _db
          .collection('ServiceProviders')
          .doc(uid)
          .update({"image": admin.imagefile, "type": "clinic"});
    } catch (e) {
      print(e.toString());
    }
  }

  uploadParlourServiceData(
      Location location,
      Details details,
      List<EmployeeDetailList> finalEmployeeList,
      List<ParlourServiceDetails> parlourServiceList,
      List<ParlourSlotDetails> parlourSlotList) async {
    List<DividedSlots> dividedSlots = [];

    for (int i = int.parse(parlourSlotList[0].fromHr);
        i < int.parse(parlourSlotList[0].toHr);
        i++) {
      var startingTime, startingSuffix, endingTime, endingSuffix;
      if (i > 12) {
        startingSuffix = 'PM';
        endingSuffix = 'PM';
        startingTime =
            '${i - 12}:${parlourSlotList[0].fromMin} $startingSuffix';
        endingTime = (i - 12 + 1) > 12
            ? '${i - 12 + 1 - 12}:${parlourSlotList[0].fromMin} $endingSuffix'
            : '${i - 12 + 1}:${parlourSlotList[0].fromMin} $endingSuffix';
      } else {
        startingSuffix = i == 12 ? 'PM' : 'AM';
        endingSuffix = (i + 1) >= 12 ? 'PM' : 'AM';
        startingTime = '$i:${parlourSlotList[0].fromMin} $startingSuffix';
        endingTime = (i + 1) > 12
            ? '${i + 1 - 12}:${parlourSlotList[0].fromMin} $endingSuffix'
            : '${i + 1}:${parlourSlotList[0].fromMin} $endingSuffix';
      }
      DividedSlots tempSlot = DividedSlots(
          time: '$startingTime - $endingTime',
          emp: int.parse(details.numOfEmployees));
      dividedSlots.add(tempSlot);
    }

    try {
      await _db.collection('ParlourServices').doc(uid).set({
        "location": location.toJson(),
        "details": details.toJson(),
        "employeeDetails": FieldValue.arrayUnion(
            finalEmployeeList.map((e) => e.toJson()).toList()),
        "servicesList": parlourServiceList.map((e) => e.toJson()).toList(),
        "slotList": parlourSlotList.map((e) => e.toJson()).toList(),
        "slots":
            FieldValue.arrayUnion(dividedSlots.map((e) => e.toJson()).toList()),
        "type": "parlour"
      });
      await _db
          .collection('ServiceProviders')
          .doc(uid)
          .update({"image": location.ownerImage, "type": "parlour"});
    } catch (e) {
      print(e.toString());
    }
    // await getUserdata(user);
    // notifyListeners();
  }

  uploadSalonServiceData(
      Location location,
      Details details,
      List<EmployeeDetailList> finalEmployeeList,
      List<ParlourServiceDetails> parlourServiceList,
      List<ParlourSlotDetails> parlourSlotList) async {
    List<DividedSlots> dividedSlots = [];

    for (int i = int.parse(parlourSlotList[0].fromHr);
        i < int.parse(parlourSlotList[0].toHr);
        i++) {
      var startingTime, startingSuffix, endingTime, endingSuffix;
      if (i > 12) {
        startingSuffix = 'PM';
        endingSuffix = 'PM';
        startingTime =
            '${i - 12}:${parlourSlotList[0].fromMin} $startingSuffix';
        endingTime = (i - 12 + 1) > 12
            ? '${i - 12 + 1 - 12}:${parlourSlotList[0].fromMin} $endingSuffix'
            : '${i - 12 + 1}:${parlourSlotList[0].fromMin} $endingSuffix';
      } else {
        startingSuffix = i == 12 ? 'PM' : 'AM';
        endingSuffix = (i + 1) >= 12 ? 'PM' : 'AM';
        startingTime = '$i:${parlourSlotList[0].fromMin} $startingSuffix';
        endingTime = (i + 1) > 12
            ? '${i + 1 - 12}:${parlourSlotList[0].fromMin} $endingSuffix'
            : '${i + 1}:${parlourSlotList[0].fromMin} $endingSuffix';
      }
      DividedSlots tempSlot = DividedSlots(
          time: '$startingTime - $endingTime',
          emp: int.parse(details.numOfEmployees));
      dividedSlots.add(tempSlot);
    }

    try {
      await _db.collection('SalonServices').doc(uid).set({
        "location": location.toJson(),
        "details": details.toJson(),
        "employeeDetails": finalEmployeeList.map((e) => e.toJson()).toList(),
        "servicesList": parlourServiceList.map((e) => e.toJson()).toList(),
        "slotList": parlourSlotList.map((e) => e.toJson()).toList(),
        "slots":
            FieldValue.arrayUnion(dividedSlots.map((e) => e.toJson()).toList()),
        "type": "salon"
      });
      await _db
          .collection('ServiceProviders')
          .doc(uid)
          .update({"image": location.ownerImage, "type": "salon"});
    } catch (e) {
      print(e.toString());
    }
    // await getUserdata(user);
    // notifyListeners();
  }
}
