import 'dart:convert';

VehicleListResponse vehicleListResponseFromJson(String str) => VehicleListResponse.fromJson(json.decode(str));

String vehicleListResponseToJson(VehicleListResponse data) => json.encode(data.toJson());

class VehicleListResponse {
  VehicleListResponse({
    this.data,
    this.msg
  });

  Data? data;
  String? msg;

  factory VehicleListResponse.fromJson(Map<String, dynamic> json) => VehicleListResponse(
    data: Data.fromJson(json["data"]),
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
    "msg" : msg,
  };
}

class Data {
  Data({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
    required this.image,
    required this.address,
    required this.businessIdentificationNumber,
    required this.contactPersonName,
    required this.contactPersonPosition,
    required this.contactPersonPhone,
    required this.contactPersonNric,
    required this.status,
    this.approvedDate,
    required this.createdAt,
    this.updatedAt,
    required this.vehicles,
  });

  int id;
  String name;
  String phone;
  String email;
  String password;
  String image;
  String address;
  String businessIdentificationNumber;
  String contactPersonName;
  String contactPersonPosition;
  String contactPersonPhone;
  String contactPersonNric;
  String status;
  DateTime? approvedDate;
  DateTime createdAt;
  DateTime? updatedAt;
  List<Vehicle> vehicles;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    phone: json["phone"],
    email: json["email"],
    password: json["password"],
    image: json["image"],
    address: json["address"],
    businessIdentificationNumber: json["business_identification_number"],
    contactPersonName: json["contact_person_name"],
    contactPersonPosition: json["contact_person_position"],
    contactPersonPhone: json["contact_person_phone"],
    contactPersonNric: json["contact_person_NRIC"],
    status: json["status"],
    approvedDate: json["approved_date"] == null ? null : DateTime.parse(json["approved_date"]),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    vehicles: List<Vehicle>.from(json["vehicles"].map((x) => Vehicle.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "phone": phone,
    "email": email,
    "password": password,
    "image": image,
    "address": address,
    "business_identification_number": businessIdentificationNumber,
    "contact_person_name": contactPersonName,
    "contact_person_position": contactPersonPosition,
    "contact_person_phone": contactPersonPhone,
    "contact_person_NRIC": contactPersonNric,
    "status": status,
    "approved_date": approvedDate?.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "vehicles": List<dynamic>.from(vehicles.map((x) => x.toJson())),
  };
}

class Vehicle {
  Vehicle({
    required this.id,
    required this.vehicleNumber,
    required this.servicePartnerId,
    required this.capacity,
    required this.image,
    required this.password,
    required this.driverName,
    required this.driverLicenseNumber,
    required this.driverPhone,
    required this.driverLicenseValidity,
    required this.attendantName,
    required this.attendantPhone,
    required this.attendantNric,
    required this.attendantDob,
    required this.status,
    required this.isVerified,
    this.approvedDate,
    required this.createdAt,
    this.updatedAt,
    required this.availableStatus,
  });

  int id;
  String vehicleNumber;
  int servicePartnerId;
  String capacity;
  String image;
  String password;
  String driverName;
  String driverLicenseNumber;
  String driverPhone;
  DateTime driverLicenseValidity;
  String attendantName;
  String attendantPhone;
  String attendantNric;
  DateTime attendantDob;
  int status;
  int isVerified;
  DateTime? approvedDate;
  DateTime createdAt;
  DateTime? updatedAt;
  String availableStatus;

  factory Vehicle.fromJson(Map<String, dynamic> json) => Vehicle(
    id: json["id"],
    vehicleNumber: json["vehicle_number"],
    servicePartnerId: json["service_partner_id"],
    capacity: json["capacity"],
    image: json["image"],
    password: json["password"],
    driverName: json["driver_name"],
    driverLicenseNumber: json["driver_license_number"],
    driverPhone: json["driver_phone"],
    driverLicenseValidity: DateTime.parse(json["driver_license_validity"]),
    attendantName: json["attendant_name"],
    attendantPhone: json["attendant_phone"],
    attendantNric: json["attendant_nric"],
    attendantDob: DateTime.parse(json["attendant_dob"]),
    status: json["status"],
    isVerified: json["is_verified"],
    approvedDate: json["approved_date"] == null ? null : DateTime.parse(json["approved_date"]),
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    availableStatus: json["available_status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "vehicle_number": vehicleNumber,
    "service_partner_id": servicePartnerId,
    "capacity": capacity,
    "image": image,
    "password": password,
    "driver_name": driverName,
    "driver_license_number": driverLicenseNumber,
    "driver_phone": driverPhone,
    "driver_license_validity": "${driverLicenseValidity.year.toString().padLeft(4, '0')}-${driverLicenseValidity.month.toString().padLeft(2, '0')}-${driverLicenseValidity.day.toString().padLeft(2, '0')}",
    "attendant_name": attendantName,
    "attendant_phone": attendantPhone,
    "attendant_nric": attendantNric,
    "attendant_dob": "${attendantDob.year.toString().padLeft(4, '0')}-${attendantDob.month.toString().padLeft(2, '0')}-${attendantDob.day.toString().padLeft(2, '0')}",
    "status": status,
    "is_verified": isVerified,
    "approved_date": approvedDate?.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "available_status": availableStatus,
  };
}
