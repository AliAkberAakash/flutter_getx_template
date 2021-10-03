import 'dart:convert';

UpdateProfileRequest updateProfileRequestFromJson(String str) => UpdateProfileRequest.fromJson(json.decode(str));

String updateProfileRequestToJson(UpdateProfileRequest data) => json.encode(data.toJson());

class UpdateProfileRequest {
  UpdateProfileRequest({
    required this.name,
    required this.address,
    required this.phone,
    required this.nric,
    required this.dateOfBirth,
  });

  String name;
  String address;
  String phone;
  String nric;
  DateTime dateOfBirth;

  factory UpdateProfileRequest.fromJson(Map<String, dynamic> json) => UpdateProfileRequest(
    name: json["name"],
    address: json["address"],
    phone: json["phone"],
    nric: json["nric"],
    dateOfBirth: DateTime.parse(json["date_of_birth"]),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "address": address,
    "phone": phone,
    "nric": nric,
    "date_of_birth": "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
  };
}