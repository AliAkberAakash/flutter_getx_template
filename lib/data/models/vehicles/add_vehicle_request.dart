import 'dart:convert';

AddVehicleRequest addVehicleRequestFromJson(String str) => AddVehicleRequest.fromJson(json.decode(str));

String addVehicleRequestToJson(AddVehicleRequest data) => json.encode(data.toJson());

class AddVehicleRequest {
  AddVehicleRequest({
    required this.vehicleNumber,
    required this.servicePartnerId,
    required this.capacity,
    required this.password,
    required this.driverName,
    required this.driverLicenseNumber,
    required this.driverPhone,
    required this.attendantName,
    required this.attendantPhone,
    required this.driverLicenseValidity,
    required this.attendantNric,
    required this.attendantDob,
  });

  String vehicleNumber;
  int servicePartnerId;
  int capacity;
  String password;
  String driverName;
  String driverLicenseNumber;
  String driverPhone;
  String attendantName;
  String attendantPhone;
  String driverLicenseValidity;
  String attendantNric;
  String attendantDob;

  factory AddVehicleRequest.fromJson(Map<String, dynamic> json) => AddVehicleRequest(
    vehicleNumber: json["vehicle_number"],
    servicePartnerId: json["service_partner_id"],
    capacity: json["capacity"],
    password: json["password"],
    driverName: json["driver_name"],
    driverLicenseNumber: json["driver_license_number"],
    driverPhone: json["driver_phone"],
    attendantName: json["attendant_name"],
    attendantPhone: json["attendant_phone"],
    driverLicenseValidity: json["driver_license_validity"],
    attendantNric: json["attendant_nric"],
    attendantDob: json["attendant_dob"],
  );

  Map<String, dynamic> toJson() => {
    "vehicle_number": vehicleNumber,
    "service_partner_id": servicePartnerId,
    "capacity": capacity,
    "password": password,
    "driver_name": driverName,
    "driver_license_number": driverLicenseNumber,
    "driver_phone": driverPhone,
    "attendant_name": attendantName,
    "attendant_phone": attendantPhone,
    "driver_license_validity": driverLicenseValidity,
    "attendant_nric": attendantNric,
    "attendant_dob": attendantDob,
  };
}
