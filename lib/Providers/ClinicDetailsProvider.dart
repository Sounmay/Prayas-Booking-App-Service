import 'package:flutter/foundation.dart';
import 'package:freelance_booking_app_service/Models/ClinicDetailsModel.dart';
import 'package:freelance_booking_app_service/Models/ParlourDetailsModel.dart';

class ClinicDetailsProvider with ChangeNotifier {
  ClinicLocationAndDoctor _clinicLocationAndDoctor;
  AdminDetails _adminDetails;
  List<DoctorDetails> _doctorDetails = [];
  List<ParlourServiceDetails> _clinicServiceList;
  List<ParlourSlotDetails> _clinicSlotList;
  String _slotDuration, _intervals;

  String get slotDuration {
    String temp = _slotDuration;
    return temp;
  }

  String get intervals {
    String temp = _intervals;
    return temp;
  }

  ClinicLocationAndDoctor get clinicLocationAndDoctorDetails {
    ClinicLocationAndDoctor temp = _clinicLocationAndDoctor;
    return temp;
  }

  AdminDetails get adminDetails {
    AdminDetails temp = _adminDetails;
    return temp;
  }

  List<ParlourServiceDetails> get clinicServiceListDetails {
    List<ParlourServiceDetails> temp = _clinicServiceList;
    return temp;
  }

  List<ParlourSlotDetails> get clinicSlotListDetails {
    List<ParlourSlotDetails> temp = _clinicSlotList;
    return temp;
  }

  List<DoctorDetails> get doctorDetails {
    List<DoctorDetails> temp = _doctorDetails;
    return temp;
  }

  void updateClinicLocationAndDoctor(ClinicLocationAndDoctor _location) {
    _clinicLocationAndDoctor = _location;
    notifyListeners();
  }

  void updateAdminImageUrl(String imgUrl) {
    _adminDetails.imagefile = imgUrl;
    notifyListeners();
  }

  void updateClinicImageUrl(String imgUrl) {
    _clinicLocationAndDoctor.clinicImage = imgUrl;
    notifyListeners();
  }

  void updateAdminDetails(AdminDetails _details) {
    _adminDetails = _details;
    notifyListeners();
  }

  void updateSlotDuration(String duration) {
    _slotDuration = duration;
    notifyListeners();
  }

  void updateInterval(String interval) {
    _intervals = interval;
    notifyListeners();
  }

  void updateServiceListDetails(List<ParlourServiceDetails> _serviceList) {
    _clinicServiceList = _serviceList;
    notifyListeners();
  }

  void updateDoctorListDetails(DoctorDetails _doctorList) {
    _doctorDetails.add(_doctorList);
    notifyListeners();
  }

  void updateSlotListDetails(List<ParlourSlotDetails> _slotList) {
    _clinicSlotList = _slotList;
    notifyListeners();
  }
}
