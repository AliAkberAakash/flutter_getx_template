import 'dart:convert';

import 'package:go_share/data/models/vehicles/vehicle_list_response.dart';

DriverLoginResponse driverLoginResponseFromJson(String str) => DriverLoginResponse.fromJson(json.decode(str));

String driverLoginResponseToJson(DriverLoginResponse data) => json.encode(data.toJson());

class DriverLoginResponse {
  DriverLoginResponse({
    required this.message,
    this.data,
  });

  String message;
  Data? data;

  factory DriverLoginResponse.fromJson(Map<String, dynamic> json) => DriverLoginResponse(
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data == null ? null : data?.toJson(),
  };
}

class Data {
  Data({
    required this.vehicle,
    required this.token,
  });

  Vehicle vehicle;
  String token;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    vehicle: Vehicle.fromJson(json["vehicle"]),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "vehicle": vehicle.toJson(),
    "token": token,
  };
}
