import 'package:go_share/data/remote/model/banner/banner.dart';

class BannerResponse {
  late List<Banner> items;

  BannerResponse.fromJson(List<dynamic> json) {
    items = (json)
        .map(
          (e) => Banner.fromJson(e as Map<String, dynamic>),
        )
        .toList();
  }
}
