// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['Id']);
  return Product()
    ..Id = json['Id'] as int
    ..CategoryId = json['CategoryId'] as int?
    ..CategoryName = json['CategoryName'] as String?
    ..ItemId = json['ItemId'] as int?
    ..ImageId = json['ImageId'] as int?
    ..ImageRootUrl = json['ImageRootUrl'] as String?
    ..ImageUrl = json['ImageUrl'] as String?
    ..ImageName = json['ImageName'] as String?
    ..BrandName = json['BrandName'] as String?
    ..ItemName = json['ItemName'] as String?
    ..MeasurementName = json['MeasurementName'] as String?
    ..StockNature = json['StockNature'] as String?
    ..StockType = json['StockType'] as String?
    ..SaleType = json['SaleType'] as String?
    ..BasePrice = (json['BasePrice'] as num?)?.toDouble()
    ..SalesPrice = (json['SalesPrice'] as num?)?.toDouble()
    ..DiscountedPrice = (json['DiscountedPrice'] as num?)?.toDouble()
    ..StockQuantity = (json['StockQuantity'] as num?)?.toDouble()
    ..CartQuantity = (json['CartQuantity'] as num?)?.toDouble()
    ..ShippedBy = json['ShippedBy'] as String?
    ..Location = json['Location'] as String?
    ..IsVerified = json['IsVerified'] as bool?
    ..Status = json['Status'] as String?
    ..IsFavorite = json['IsFavorite'] as bool?
    ..IsPromoted = json['IsPromoted'] as bool?
    ..AuctionStatus = json['AuctionStatus'] as String?
    ..StartTime = json['StartTime'] as String?
    ..EndTime = json['EndTime'] as String?
    ..AverageRating = (json['AverageRating'] as num?)?.toDouble()
    ..NoOfReview = json['NoOfReview'] as int?
    ..BidCount = json['BidCount'] as int?
    ..ItemGroupId = json['ItemGroupId'] as int?
    ..AuctionId = json['AuctionId'] as int?
    ..ViewCount = json['ViewCount'] as int?
    ..ClickCount = json['ClickCount'] as int?
    ..OrderCount = json['OrderCount'] as int?
    ..HasAddToCart = json['HasAddToCart'] as bool?
    ..HasBargain = json['HasBargain'] as bool?
    ..HasBuyNow = json['HasBuyNow'] as bool?
    ..OrderId = json['OrderId'] as int?
    ..MaxBidAmount = (json['MaxBidAmount'] as num?)?.toDouble()
    ..BidAmount = (json['BidAmount'] as num?)?.toDouble()
    ..MaxBidderId = json['MaxBidderId'] as int?
    ..BidTime = json['BidTime'] as String?
    ..OrderConfirmationLastTime = json['OrderConfirmationLastTime'] as String?
    ..OrderConfirmAt = json['OrderConfirmAt'] as String?
    ..WinStatus = json['WinStatus'] as String?
    ..CreatedAt = json['CreatedAt'] as String?
    ..CreatedAtFormated = json['CreatedAtFormated'] as String?
    ..PublishedAt = json['PublishedAt'] as String?
    ..PublishedAtFormated = json['PublishedAtFormated'] as String?
    ..Slug = json['Slug'] as String?;
}

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'Id': instance.Id,
      'CategoryId': instance.CategoryId,
      'CategoryName': instance.CategoryName,
      'ItemId': instance.ItemId,
      'ImageId': instance.ImageId,
      'ImageRootUrl': instance.ImageRootUrl,
      'ImageUrl': instance.ImageUrl,
      'ImageName': instance.ImageName,
      'BrandName': instance.BrandName,
      'ItemName': instance.ItemName,
      'MeasurementName': instance.MeasurementName,
      'StockNature': instance.StockNature,
      'StockType': instance.StockType,
      'SaleType': instance.SaleType,
      'BasePrice': instance.BasePrice,
      'SalesPrice': instance.SalesPrice,
      'DiscountedPrice': instance.DiscountedPrice,
      'StockQuantity': instance.StockQuantity,
      'CartQuantity': instance.CartQuantity,
      'ShippedBy': instance.ShippedBy,
      'Location': instance.Location,
      'IsVerified': instance.IsVerified,
      'Status': instance.Status,
      'IsFavorite': instance.IsFavorite,
      'IsPromoted': instance.IsPromoted,
      'AuctionStatus': instance.AuctionStatus,
      'StartTime': instance.StartTime,
      'EndTime': instance.EndTime,
      'AverageRating': instance.AverageRating,
      'NoOfReview': instance.NoOfReview,
      'BidCount': instance.BidCount,
      'ItemGroupId': instance.ItemGroupId,
      'AuctionId': instance.AuctionId,
      'ViewCount': instance.ViewCount,
      'ClickCount': instance.ClickCount,
      'OrderCount': instance.OrderCount,
      'HasAddToCart': instance.HasAddToCart,
      'HasBargain': instance.HasBargain,
      'HasBuyNow': instance.HasBuyNow,
      'OrderId': instance.OrderId,
      'MaxBidAmount': instance.MaxBidAmount,
      'BidAmount': instance.BidAmount,
      'MaxBidderId': instance.MaxBidderId,
      'BidTime': instance.BidTime,
      'OrderConfirmationLastTime': instance.OrderConfirmationLastTime,
      'OrderConfirmAt': instance.OrderConfirmAt,
      'WinStatus': instance.WinStatus,
      'CreatedAt': instance.CreatedAt,
      'CreatedAtFormated': instance.CreatedAtFormated,
      'PublishedAt': instance.PublishedAt,
      'PublishedAtFormated': instance.PublishedAtFormated,
      'Slug': instance.Slug,
    };
