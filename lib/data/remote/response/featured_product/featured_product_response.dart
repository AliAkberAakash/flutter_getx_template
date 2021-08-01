import 'package:go_share/data/remote/model/product/product.dart';

class FeaturedProductResponse {
  late List<Product> items;

  FeaturedProductResponse.fromJson(List<dynamic> json) {
    items = (json)
        .map(
          (e) => Product.fromJson(e as Map<String, dynamic>),
        )
        .toList();
  }
}
