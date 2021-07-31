import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freelance_booking_app_service/Models/ParlourDetailsModel.dart';
import 'package:freelance_booking_app_service/Models/User.dart';
import 'package:freelance_booking_app_service/Screens/uploadImage.dart';

class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  final uid = FirebaseAuth.instance?.currentUser?.uid ?? '';
  Future uploadImage(String imgUrl) async {
    FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .update({"image": imgUrl});
  }

  Future setRegistered() async {
    _db.collection('Users').doc(uid).update({"isRegistered": true});
  }

  Stream<AppUserDetails> streamUser() {
    var ref = _db.collection('Users').doc(uid).snapshots();

    return ref.map((event) => AppUserDetails.fromFirestore(event));
  }

  uploadParlourServiceData(
      Location location,
      Details details,
      List<EmployeeDetailList> finalEmployeeList,
      List<ParlourServiceDetails> parlourServiceList,
      List<ParlourSlotDetails> parlourSlotList) async {
    try {
      await _db.collection('ParlourServices').doc(uid).set({
        "location": location.toJson(),
        "details": details.toJson(),
        "employeeDetails": finalEmployeeList.map((e) => e.toJson()).toList(),
        "servicesList": parlourServiceList.map((e) => e.toJson()).toList(),
        "slotList": parlourSlotList.map((e) => e.toJson()).toList(),
      });
    } catch (e) {
      print(e.toString());
    }
    // await getUserdata(user);
    // notifyListeners();
  }
}
