import 'package:freelance_booking_app_service/Models/ParlourDetailsModel.dart';
import 'package:freelance_booking_app_service/Screens/ParlourScreens/ParlourServices.dart';

class ClinicLocationAndDoctor {
  String serviceUid;
  String clinicName;
  String shopNo;
  String address;
  String clinicImage;
  String speciality;
  String aboutClinic;
  String latitude;
  String longitude;
  String isApproved;

  ClinicLocationAndDoctor(
      {this.clinicName,
      this.serviceUid,
      this.clinicImage,
      this.latitude,
      this.longitude,
      this.shopNo,
      this.address,
      this.speciality,
      this.aboutClinic,
      this.isApproved});

  ClinicLocationAndDoctor.fromJson(Map<String, dynamic> json) {
    clinicName = json['clinicName'];
    shopNo = json['shopNo'];
    address = json['address'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    serviceUid = json['serviceUid'];
    clinicImage = json['clinicImage'];
    aboutClinic = json['aboutClinic'];
    isApproved = json['isApproved'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['clinicName'] = this.clinicName;
    data['shopNo'] = this.shopNo;
    data['address'] = this.address;
    data['clinicImage'] = this.clinicImage;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['aboutClinic'] = this.aboutClinic;
    data['serviceUid'] = this.serviceUid;
    data['isApproved'] = this.isApproved;
    return data;
  }
}

class AdminDetails {
  String name;
  String number;
  String imagefile;
  String designation;

  AdminDetails({this.name, this.designation, this.number, this.imagefile});

  AdminDetails.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    number = json['number'];
    imagefile = json['imagefile'];
    designation = json['designation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['number'] = this.number;
    data['imagefile'] = this.imagefile;
    data['designation'] = this.designation;
    return data;
  }
}

class DoctorDetails {
  String name;
  String number;
  String imagefile;
  String specialization;
  String yearsOfExperience;
  String aboutDoctor;
  String workingDays;
  List<ParlourServiceDetails> serviceList;
  List<ParlourSlotDetails> slot;

  DoctorDetails(
      {this.name,
      this.serviceList,
      this.specialization,
      this.workingDays = "",
      this.aboutDoctor,
      this.slot,
      this.yearsOfExperience,
      this.number,
      this.imagefile});

  DoctorDetails.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    number = json['number'];
    imagefile = json['imagefile'];
    specialization = json['specialization'];
    aboutDoctor = json['aboutDoctor'];
    yearsOfExperience = json['yearsOfExperience'];
    workingDays = json['workingDays'];
    slot = json['slot'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['number'] = this.number;
    data['imagefile'] = this.imagefile;
    data['specialization'] = this.specialization;
    data['aboutDoctor'] = this.aboutDoctor;
    data['yearsOfExperience'] = this.yearsOfExperience;
    data['workingDays'] = this.workingDays;
    data['serviceList'] = this.serviceList.map((e) => e.toJson()).toList();
    data['slot'] = this.slot.map((e) => e.toJson()).toList();
    return data;
  }
}
