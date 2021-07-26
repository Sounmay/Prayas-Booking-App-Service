class ParlourDetails {
  Location location;
  Details details;

  ParlourDetails({this.location, this.details});

  ParlourDetails.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    details =
        json['details'] != null ? new Details.fromJson(json['details']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.location != null) {
      data['location'] = this.location.toJson();
    }
    if (this.details != null) {
      data['details'] = this.details.toJson();
    }
    return data;
  }
}

class Location {
  String name;
  String shopNo;
  String address;
  String parlourImage;
  String ownerImage;
  String ownerName;
  String ownerNumber;
  String aboutOwner;

  Location(
      {this.name,
      this.shopNo,
      this.address,
      this.parlourImage,
      this.ownerImage,
      this.ownerName,
      this.ownerNumber,
      this.aboutOwner});

  Location.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    shopNo = json['shopNo'];
    address = json['address'];
    parlourImage = json['parlourImage'];
    ownerImage = json['ownerImage'];
    ownerName = json['ownerName'];
    ownerNumber = json['ownerNumber'];
    aboutOwner = json['aboutOwner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['shopNo'] = this.shopNo;
    data['address'] = this.address;
    data['parlourImage'] = this.parlourImage;
    data['ownerImage'] = this.ownerImage;
    data['ownerName'] = this.ownerName;
    data['ownerNumber'] = this.ownerNumber;
    data['aboutOwner'] = this.aboutOwner;
    return data;
  }
}

class Details {
  String parlourType;
  String aboutParlour;
  String numOfEmployees;
  List<EmployeeDetailList> employeeDetailList;

  Details(
      {this.parlourType,
      this.aboutParlour,
      this.numOfEmployees,
      this.employeeDetailList});

  Details.fromJson(Map<String, dynamic> json) {
    parlourType = json['parlourType'];
    aboutParlour = json['aboutParlour'];
    numOfEmployees = json['numOfEmployees'];
    if (json['employeeDetailList'] != null) {
      employeeDetailList = new List<EmployeeDetailList>();
      json['employeeDetailList'].forEach((v) {
        employeeDetailList.add(new EmployeeDetailList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['parlourType'] = this.parlourType;
    data['aboutParlour'] = this.aboutParlour;
    data['numOfEmployees'] = this.numOfEmployees;
    if (this.employeeDetailList != null) {
      data['employeeDetailList'] =
          this.employeeDetailList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class EmployeeDetailList {
  String name;
  String number;
  String imagefile;

  EmployeeDetailList({this.name, this.number, this.imagefile});

  EmployeeDetailList.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    number = json['number'];
    imagefile = json['imagefile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['number'] = this.number;
    data['imagefile'] = this.imagefile;
    return data;
  }
}