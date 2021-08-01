import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable(fieldRename: FieldRename.none)
class Product {
  @JsonKey(required: true)
  late int Id;

  @JsonKey(defaultValue: null)
  late int? CategoryId;

  @JsonKey(defaultValue: null)
  late String? CategoryName;

  @JsonKey(defaultValue: null)
  late int? ItemId;

  @JsonKey(defaultValue: null)
  late int? ImageId;

  @JsonKey(defaultValue: null)
  late String? ImageRootUrl;

  @JsonKey(defaultValue: null)
  late String? ImageUrl;

  @JsonKey(defaultValue: null)
  late String? ImageName;

  @JsonKey(defaultValue: null)
  late String? BrandName;

  @JsonKey(defaultValue: null)
  late String? ItemName;

  @JsonKey(defaultValue: null)
  late String? MeasurementName;

  @JsonKey(defaultValue: null)
  late String? StockNature;

  @JsonKey(defaultValue: null)
  late String? StockType;

  @JsonKey(defaultValue: null)
  late String? SaleType;

  @JsonKey(defaultValue: null)
  late double? BasePrice;

  @JsonKey(defaultValue: null)
  late double? SalesPrice;

  @JsonKey(defaultValue: null)
  late double? DiscountedPrice;

  @JsonKey(defaultValue: null)
  late double? StockQuantity;

  @JsonKey(defaultValue: null)
  late double? CartQuantity;

  @JsonKey(defaultValue: null)
  late String? ShippedBy;

  @JsonKey(defaultValue: null)
  late String? Location;

  @JsonKey(defaultValue: null)
  late bool? IsVerified;

  @JsonKey(defaultValue: null)
  late String? Status;

  @JsonKey(defaultValue: null)
  late bool? IsFavorite;

  @JsonKey(defaultValue: null)
  late bool? IsPromoted;

  @JsonKey(defaultValue: null)
  late String? AuctionStatus;

  @JsonKey(defaultValue: null)
  late String? StartTime;

  @JsonKey(defaultValue: null)
  late String? EndTime;

  @JsonKey(defaultValue: null)
  late double? AverageRating;

  @JsonKey(defaultValue: null)
  late int? NoOfReview;

  @JsonKey(defaultValue: null)
  late int? BidCount;

  @JsonKey(defaultValue: null)
  late int? ItemGroupId;

  @JsonKey(defaultValue: null)
  late int? AuctionId;

  @JsonKey(defaultValue: null)
  late int? ViewCount;

  @JsonKey(defaultValue: null)
  late int? ClickCount;

  @JsonKey(defaultValue: null)
  late int? OrderCount;

  @JsonKey(defaultValue: null)
  late bool? HasAddToCart;

  @JsonKey(defaultValue: null)
  late bool? HasBargain;

  @JsonKey(defaultValue: null)
  late bool? HasBuyNow;

  @JsonKey(defaultValue: null)
  late int? OrderId;

  @JsonKey(defaultValue: null)
  late double? MaxBidAmount;

  @JsonKey(defaultValue: null)
  late double? BidAmount;

  @JsonKey(defaultValue: null)
  late int? MaxBidderId;

  @JsonKey(defaultValue: null)
  late String? BidTime;

  @JsonKey(defaultValue: null)
  late String? OrderConfirmationLastTime;

  @JsonKey(defaultValue: null)
  late String? OrderConfirmAt;

  @JsonKey(defaultValue: null)
  late String? WinStatus;

  @JsonKey(defaultValue: null)
  late String? CreatedAt;

  @JsonKey(defaultValue: null)
  late String? CreatedAtFormated;

  @JsonKey(defaultValue: null)
  late String? PublishedAt;

  @JsonKey(defaultValue: null)
  late String? PublishedAtFormated;

  @JsonKey(defaultValue: null)
  late String? Slug;

  Product();

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
