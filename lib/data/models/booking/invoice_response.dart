import 'dart:convert';

InvoiceResponse invoiceResponseFromJson(String str) => InvoiceResponse.fromJson(json.decode(str));

String invoiceResponseToJson(InvoiceResponse data) => json.encode(data.toJson());

class InvoiceResponse {
  InvoiceResponse({
    required this.success,
    required this.msg,
    required this.data,
  });

  bool success;
  String msg;
  List<Datum> data;

  factory InvoiceResponse.fromJson(Map<String, dynamic> json) => InvoiceResponse(
    success: json["success"],
    msg: json["msg"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "msg": msg,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.id,
    required this.userId,
    required this.startDate,
    required this.endDate,
    required this.pickupTime,
    required this.dropoffTime,
    required this.numberOfDays,
    required this.bookedSeat,
    required this.pickupAddress,
    required this.dropoffAddress,
    required this.price,
    required this.distance,
    this.rating,
    required this.isApproved,
    required this.isPaid,
    required this.isFinished,
    required this.childrens,
    required this.payment,
  });

  int id;
  int userId;
  DateTime startDate;
  DateTime endDate;
  String pickupTime;
  String dropoffTime;
  int numberOfDays;
  int bookedSeat;
  String pickupAddress;
  String dropoffAddress;
  double price;
  double distance;
  dynamic rating;
  int isApproved;
  int isPaid;
  int isFinished;
  List<Children> childrens;
  List<dynamic> payment;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    userId: json["user_id"],
    startDate: DateTime.parse(json["start_date"]),
    endDate: DateTime.parse(json["end_date"]),
    pickupTime: json["pickup_time"],
    dropoffTime: json["dropoff_time"],
    numberOfDays: json["number_of_days"],
    bookedSeat: json["booked_seat"],
    pickupAddress: json["pickup_address"],
    dropoffAddress: json["dropoff_address"],
    price: json["price"].toDouble(),
    distance: json["distance"].toDouble(),
    rating: json["rating"],
    isApproved: json["is_approved"],
    isPaid: json["is_paid"],
    isFinished: json["is_finished"],
    childrens: List<Children>.from(json["childrens"].map((x) => Children.fromJson(x))),
    payment: List<dynamic>.from(json["payment"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "start_date": "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
    "end_date": "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
    "pickup_time": pickupTime,
    "dropoff_time": dropoffTime,
    "number_of_days": numberOfDays,
    "booked_seat": bookedSeat,
    "pickup_address": pickupAddress,
    "dropoff_address": dropoffAddress,
    "price": price,
    "distance": distance,
    "rating": rating,
    "is_approved": isApproved,
    "is_paid": isPaid,
    "is_finished": isFinished,
    "childrens": List<dynamic>.from(childrens.map((x) => x.toJson())),
    "payment": List<dynamic>.from(payment.map((x) => x)),
  };
}

class Children {
  Children({
    required this.id,
    required this.userId,
    required this.name,
    required this.laravelThroughKey,
  });

  int id;
  int userId;
  String name;
  int laravelThroughKey;

  factory Children.fromJson(Map<String, dynamic> json) => Children(
    id: json["id"],
    userId: json["user_id"],
    name: json["name"],
    laravelThroughKey: json["laravel_through_key"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "name": name,
    "laravel_through_key": laravelThroughKey,
  };
}