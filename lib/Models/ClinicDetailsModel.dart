class ClinicLocationAndDoctor {
  String serviceUid;
  String clinicName;
  String shopNo;
  String address;
  String clinicImage;
  String aboutClinic;
  String latitude;
  String longitude;

  ClinicLocationAndDoctor(
      {this.clinicName,
      this.serviceUid,
      this.clinicImage,
      this.latitude,
      this.longitude,
      this.shopNo,
      this.address,
      this.aboutClinic});

  ClinicLocationAndDoctor.fromJson(Map<String, dynamic> json) {
    clinicName = json['clinicName'];
    shopNo = json['shopNo'];
    address = json['address'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    serviceUid = json['serviceUid'];
    clinicImage = json['clinicImage'];
   aboutClinic = json['aboutClinic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['clinicName'] = this.clinicName;
    data['shopNo'] = this.shopNo;
    data['address'] = this.address;
    data['clinicImage'] = this.clinicImage;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
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

class DoctorDetails {
  String name;
  String number;
  String imagefile;
  String specialization;
  String yearsOfExperience;
  String aboutDoctor;
  String workingDays;

  DoctorDetails(
      {this.name,
      this.specialization,
      this.workingDays="",
      this.aboutDoctor,
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
    return data;
  }
}
