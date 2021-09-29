
import 'dart:convert';

GeneralUserLoginRequest generalUserLoginRequestFromJson(String str) => GeneralUserLoginRequest.fromJson(json.decode(str));

String generalUserLoginRequestToJson(GeneralUserLoginRequest data) => json.encode(data.toJson());

class GeneralUserLoginRequest {
  GeneralUserLoginRequest({
    required this.email,
    required this.password,
  });

  String email;
  String password;

  factory GeneralUserLoginRequest.fromJson(Map<String, dynamic> json) => GeneralUserLoginRequest(
    email: json["email"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
  };
}