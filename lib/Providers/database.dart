import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freelance_booking_app_service/Models/ParlourDetails.dart';
import 'package:freelance_booking_app_service/Screens/uploadImage.dart';

class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  final uid = FirebaseAuth.instance.currentUser.uid;
  Future uploadImage(String imgUrl) async {
    FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser.uid)
        .update({"image": imgUrl});
  }

  uploadParlourServiceData(ParlourDetails parlourDetail) async {
    try {
      await _db
          .collection('ParlourServices')
          .doc(uid)
          .set({"parlourServiceDetails": parlourDetail.toJson()});
    } catch (e) {
      print(e.toString());
    }
    // await getUserdata(user);
    // notifyListeners();
  }
}
