// class ParlourDetails {
//   Location location;
//   Details details;

//   ParlourDetails({this.location, this.details});

//   ParlourDetails.fromJson(Map<String, dynamic> json) {
//     location = json['location'] != null
//         ? new Location.fromJson(json['location'])
//         : null;
//     details =
//         json['details'] != null ? new Details.fromJson(json['details']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.location != null) {
//       data['location'] = this.location.toJson();
//     }
//     if (this.details != null) {
//       data['details'] = this.details.toJson();
//     }
//     return data;
//   }
// }

class Location {
  String serviceUid;
  String servId;
  String name;
  String shopNo;
  String address;
  String ownerImage;
  String ownerName;
  String ownerNumber;
  String aboutOwner;
  String latitude;
  String longitude;
  String status;
  DateTime regDate;

  Location(
      {this.name,
      this.serviceUid,
        this.servId,
      this.latitude,
      this.longitude,
      this.shopNo,
      this.address,
      this.ownerImage,
      this.ownerName,
      this.ownerNumber,
      this.aboutOwner,
      this.status,
      this.regDate});

  Location.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    shopNo = json['shopNo'];
    address = json['address'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    serviceUid = json['serviceUid'];
    servId = json['servId'];
    ownerImage = json['ownerImage'];
    ownerName = json['ownerName'];
    ownerNumber = json['ownerNumber'];
    aboutOwner = json['aboutOwner'];
    status = json['status'];
    regDate =json['regDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['shopNo'] = this.shopNo;
    data['address'] = this.address;
    data['ownerImage'] = this.ownerImage;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['ownerName'] = this.ownerName;
    data['ownerNumber'] = this.ownerNumber;
    data['aboutOwner'] = this.aboutOwner;
    data['serviceUid'] = this.serviceUid;
    data['servId'] = this.servId;
    data['status'] = this.status;
    data['regDate'] = this.regDate;
    return data;
  }
}

class Details {
  String serviceType;
  String parlourType;
  String aboutParlour;
  String numOfEmployees;
  String parlourImage;


  Details(
      {
        this.serviceType,
        this.parlourType,
      this.aboutParlour,
      this.parlourImage,
      this.numOfEmployees});

  Details.fromJson(Map<String, dynamic> json) {
    serviceType = json['serviceType'];
    parlourType = json['parlourType'];
    aboutParlour = json['aboutParlour'];
    parlourImage = json['parlourImage'];
    numOfEmployees = json['numOfEmployees'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['serviceType'] = this.serviceType;
    data['parlourType'] = this.parlourType;
    data['aboutParlour'] = this.aboutParlour;
    data['parlourImage'] = this.parlourImage;
    data['numOfEmployees'] = this.numOfEmployees;

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

class ParlourServiceDetails {
  String name, price, hour, minute;

  ParlourServiceDetails({this.name, this.price, this.hour, this.minute});

  ParlourServiceDetails.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    hour = json['hour'];
    minute = json['minute'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['price'] = this.price;
    data['hour'] = this.hour;
    data['minute'] = this.minute;
    return data;
  }
}

class ParlourSlotDetails {
  String weekRange, fromHr, fromMin, toHr, toMin;

  ParlourSlotDetails(
      {this.weekRange, this.fromHr, this.fromMin, this.toHr, this.toMin});

  ParlourSlotDetails.fromJson(Map<String, dynamic> json) {
    weekRange = json['weekRange'];
    fromHr = json['fromHr'];
    fromMin = json['fromMin'];
    toHr = json['toHr'];
    toMin = json['toMin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['weekRange'] = this.weekRange;
    data['fromHr'] = this.fromHr;
    data['fromMin'] = this.fromMin;
    data['toHr'] = this.toHr;
    data['toMin'] = this.toMin;
    return data;
  }
}
