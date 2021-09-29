import 'dart:convert';

InfoRequest infoRequestFromJson(String str) => InfoRequest.fromJson(json.decode(str));

String infoRequestToJson(InfoRequest data) => json.encode(data.toJson());

class InfoRequest {
  InfoRequest({
    required this.childNames,
    required this.startDate,
    required this.endDate,
    required this.pickupTime,
  });

  List<String> childNames;
  String startDate;
  String endDate;
  String pickupTime;

  factory InfoRequest.fromJson(Map<String, dynamic> json) => InfoRequest(
    childNames: List<String>.from(json["child_names"].map((x) => x)),
    startDate: json["start_date"],
    endDate: json["end_date"],
    pickupTime: json["pickup_time"],
  );

  Map<String, dynamic> toJson() => {
    "child_names": List<dynamic>.from(childNames.map((x) => x)),
    "start_date": startDate,
    "end_date": endDate,
    "pickup_time": pickupTime,
  };
}