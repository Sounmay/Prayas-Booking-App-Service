class ClinicLocationAndDoctor {
  String serviceUid;
  String clinicName;
  String shopNo;
  String address;
  String doctorImage;
  String clinicImage;
  String doctorName;
  String doctorExperience;
  String doctorNumber;
  String speciality;
  String aboutClinic;
  String latitude;
  String aboutDoctor;
  String longitude;

  ClinicLocationAndDoctor(
      {this.clinicName,
      this.serviceUid,
      this.doctorExperience,
      this.clinicImage,
      this.latitude,
      this.longitude,
      this.shopNo,
      this.address,
      this.doctorImage,
      this.speciality,
      this.doctorName,
      this.doctorNumber,
      this.aboutDoctor,
      this.aboutClinic});

  ClinicLocationAndDoctor.fromJson(Map<String, dynamic> json) {
    clinicName = json['clinicName'];
    shopNo = json['shopNo'];
    address = json['address'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    serviceUid = json['serviceUid'];
    doctorImage = json['doctorImage'];
    clinicImage = json['clinicImage'];
    doctorExperience = json['doctorExperience'];
    doctorName = json['doctorName'];
    doctorNumber = json['doctorNumber'];
    aboutClinic = json['aboutClinic'];
    aboutDoctor = json['aboutDoctor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['clinicName'] = this.clinicName;
    data['shopNo'] = this.shopNo;
    data['address'] = this.address;
    data['doctorImage'] = this.doctorImage;
    data['clinicImage'] = this.clinicImage;
    data['doctorExperience'] = this.doctorExperience;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['doctorName'] = this.doctorName;
    data['doctorNumber'] = this.doctorNumber;
    data['aboutClinic'] = this.aboutClinic;
    data['aboutDoctor'] = this.aboutDoctor;
    data['serviceUid'] = this.serviceUid;
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
