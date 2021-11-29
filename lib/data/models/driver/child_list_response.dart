import 'dart:convert';

ChildListResponse childListResponseFromJson(String str) => ChildListResponse.fromJson(json.decode(str));

String childListResponseToJson(ChildListResponse data) => json.encode(data.toJson());

class ChildListResponse {
  ChildListResponse({
    required this.success,
    required this.msg,
    this.data,
  });

  bool success;
  String msg;
  List<Datum>? data;

  factory ChildListResponse.fromJson(Map<String, dynamic> json) => ChildListResponse(
    success: json["success"],
    msg: json["msg"],
    data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "msg": msg,
    "data": data==null ? null : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.bookingTravelId,
    required this.bookingId,
    required this.isFinished,
    required this.children,
  });

  int bookingTravelId;
  int bookingId;
  int isFinished;
  List<Child>? children;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    bookingTravelId: json["booking_travel_id"],
    bookingId: json["booking_id"],
    isFinished: json["is_finished"],
    children: json["children"]==null ? null : List<Child>.from(json["children"].map((x) => Child.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "booking_travel_id": bookingTravelId,
    "booking_id": bookingId,
    "is_finished": isFinished,
    "children": children==null ? null : List<dynamic>.from(children!.map((x) => x.toJson())),
  };
}

class Child {
  Child({
    required this.id,
    required this.userId,
    required this.name,
  });

  int id;
  int userId;
  String name;

  factory Child.fromJson(Map<String, dynamic> json) => Child(
    id: json["id"],
    userId: json["user_id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "name": name,
  };
}
