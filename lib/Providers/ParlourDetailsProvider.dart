import 'package:flutter/foundation.dart';
import 'package:freelance_booking_app_service/Models/ParlourDetailsModel.dart';

class ParlourDetailsProvider with ChangeNotifier {
  Location _parlourLocationDetails;
  Details _parlourDetails;
  List<EmployeeDetailList> _employeeDetails;
  List<ParlourServiceDetails> _parlourServiceList;
  List<ParlourSlotDetails> _parlourSlotList;
  String _slotDuration, _intervals;

  String get slotDuration {
    String temp = _slotDuration;
    return temp;
  }

  String get intervals {
    String temp = _intervals;
    return temp;
  }

  Location get parlourLocationDetails {
    Location temp = _parlourLocationDetails;
    return temp;
  }

  List<EmployeeDetailList> get parlourEmployeeDetails {
    List<EmployeeDetailList> temp = _employeeDetails;
    return temp;
  }

  List<ParlourServiceDetails> get parlourServiceListDetails {
    List<ParlourServiceDetails> temp = _parlourServiceList;
    return temp;
  }

  List<ParlourSlotDetails> get parlourSlotListDetails {
    List<ParlourSlotDetails> temp = _parlourSlotList;
    return temp;
  }

  Details get parlourDetails {
    Details temp = _parlourDetails;
    return temp;
  }

  void updateParlourLocation(Location _location) {
    _parlourLocationDetails = _location;
    notifyListeners();
  }

  void updatePralourDetails(Details _details) {
    _parlourDetails = _details;
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

  void updatePralourEmployeeDetails(List<EmployeeDetailList> _employees) {
    _employeeDetails = _employees;
    notifyListeners();
  }

  void updateServiceListDetails(List<ParlourServiceDetails> _serviceList) {
    _parlourServiceList = _serviceList;
    notifyListeners();
  }

  void updateSlotListDetails(List<ParlourSlotDetails> _slotList) {
    _parlourSlotList = _slotList;
    notifyListeners();
  }
}
 