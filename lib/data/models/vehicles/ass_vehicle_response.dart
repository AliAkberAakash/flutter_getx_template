// To parse this JSON data, do
//
//     final addVehicleResponse = addVehicleResponseFromJson(jsonString);

import 'dart:convert';

AddVehicleResponse addVehicleResponseFromJson(String str) => AddVehicleResponse.fromJson(json.decode(str));

String addVehicleResponseToJson(AddVehicleResponse data) => json.encode(data.toJson());

class AddVehicleResponse {
  AddVehicleResponse({
    required this.success,
    this.data,
  });

  bool success;
  Data? data;

  factory AddVehicleResponse.fromJson(Map<String, dynamic> json) => AddVehicleResponse(
    success: json["success"],
    data: json["data"]==null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "data": data == null? null : data?.toJson(),
  };
}

class Data {
  Data({
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
    required this.updatedAt,
    required this.createdAt,
    required this.id,
    required this.availableStatus,
  });

  String vehicleNumber;
  String servicePartnerId;
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
  DateTime updatedAt;
  DateTime createdAt;
  int id;
  String availableStatus;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    id: json["id"],
    availableStatus: json["available_status"],
  );

  Map<String, dynamic> toJson() => {
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
    "updated_at": updatedAt.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "id": id,
    "available_status": availableStatus,
  };
}
