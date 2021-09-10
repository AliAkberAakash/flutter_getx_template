import 'dart:convert';

ServicePartnerLoginRequest servicePartnerLoginRequestFromJson(String str) => ServicePartnerLoginRequest.fromJson(json.decode(str));

String servicePartnerLoginRequestToJson(ServicePartnerLoginRequest data) => json.encode(data.toJson());

class ServicePartnerLoginRequest {
  ServicePartnerLoginRequest({
    required this.email,
    required this.password,
  });

  String email;
  String password;

  factory ServicePartnerLoginRequest.fromJson(Map<String, dynamic> json) => ServicePartnerLoginRequest(
    email: json["email"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
  };
}