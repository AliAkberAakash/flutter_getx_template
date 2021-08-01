import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:nilam/base/widget/central_empty_list_placeholder.dart';
import 'package:nilam/base/widget/central_error_placeholder.dart';
import 'package:nilam/base/widget/central_progress_indicator.dart';
import 'package:nilam/base/widget/custom_carousel_slider.dart';
import 'package:nilam/base/widget/product/auction_item.dart';
import 'package:nilam/base/widget/product/product_item.dart';
import 'package:nilam/base/widget/product/product_item_plain.dart';
import 'package:nilam/constants.dart';
import 'package:nilam/data/remote/response/banner/banner_response.dart';
import 'package:nilam/data/remote/response/featured_product/featured_product_response.dart';
import 'package:nilam/ui/home/content/home_content_controller.dart';
import 'package:nilam/util/extension/data_extension.dart';
import 'package:nilam/util/helper/text.dart';
import 'package:path/path.dart';

import '../../../constants.dart';

class HomeContentView extends GetView<HomeContentController> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: systemUiOverlayStyleGlobal.copyWith(
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: colorPageBackground,
        extendBodyBehindAppBar: true,
        body: SafeArea(
          child: Obx(
            () {
              if (controller.isLoading.value) {
                return CentralProgressIndicator();
              } else {
                return SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  controller: controller.scrollController,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      BannerWidget(),
                      FeaturedAuctionListWidget(),
                      FeaturedProductListWidget(),
                      RecommendedProductListWidget(),
                      //FeaturedAuctionListWidget(),
                    ],
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

class BannerWidget extends StatelessWidget {
  const BannerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeContentController>();

    return FutureBuilder<BannerResponse>(
      future: controller.getBannerList(),
      builder: (_, snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          if (snapshot.data!.items.isNotEmpty) {
            return CustomCarouselSlider(
              itemCount: snapshot.data!.items.length,
              carouselHeight: controller.carouselHeight,
              itemBuilder: (_, index, realIndex) {
                final item = snapshot.data!.items[realIndex];
                return Stack(
                  children: [
                    CachedNetworkImage(
                      height: controller.carouselHeight,
                      width: double.maxFinite,
                      fit: BoxFit.cover,
                      imageUrl: TextUtil.isNotEmpty(item.ImageUrl)
                          ? join(
                              baseAppUrl,
                              item.ImageUrl!,
                            )
                          : defaultString,
                      placeholder: (context, url) {
                        return Container(
                          color: Colors.grey,
                        );
                      },
                      errorWidget: (context, url, error) {
                        return SizedBox.shrink();
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24.0,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (TextUtil.isNotEmpty(item.HeadTitle))
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                item.HeadTitle!,
                                style: Get.textTheme.bodyText2!.copyWith(
                                  fontWeight: FontWeight.w400,
                                  fontFamily: fontFamilyPoppins,
                                  color: colorLightGray1,
                                ),
                                textAlign: TextAlign.start,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          if (TextUtil.isNotEmpty(item.Title))
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                item.Title!,
                                style: Get.textTheme.headline5!.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontFamily: fontFamilyPoppins,
                                  color: Colors.black,
                                ),
                                textAlign: TextAlign.start,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          if (TextUtil.isNotEmpty(item.Summary))
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Text(
                                item.Summary!,
                                style: Get.textTheme.caption!.copyWith(
                                  fontWeight: FontWeight.w400,
                                  fontFamily: fontFamilyPoppins,
                                  color: Colors.black,
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ),
                          if (TextUtil.isNotEmpty(item.ButtonText))
                            Material(
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(29.0),
                                ),
                                onTap: () {},
                                child: Ink(
                                  decoration: const BoxDecoration(
                                    color: colorLightOrange1,
                                    borderRadius: const BorderRadius.all(
                                      const Radius.circular(29.0),
                                    ),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0,
                                    vertical: 8.0,
                                  ),
                                  child: Text(
                                    item.ButtonText!,
                                    style: Get.textTheme.bodyText1!.copyWith(
                                      fontWeight: FontWeight.w600,
                                      fontFamily: fontFamilyPoppins,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            );
          } else {
            return SizedBox.shrink();
          }
        } else if (snapshot.hasError) {
          return CentralErrorPlaceholder(
            message: "${snapshot.error}",
          );
        }

        return SizedBox.shrink();
      },
    );
  }
}

class FeaturedProductListWidget extends StatelessWidget {
  const FeaturedProductListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FeaturedProductResponse>(
      future: Get.find<HomeContentController>().getFeaturedProducts(),
      builder: (_, snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          if (snapshot.data!.items.isNotEmpty) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListHeaderWidget(
                  margin: const EdgeInsets.only(
                    left: 16.0,
                    right: 12.0,
                  ),
                  title: 'home_content_featured_products'.tr.toTitleCase(),
                  subtitle: 'view_more'.tr.toTitleCase(),
                  onTap: () {},
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: const BoxDecoration(
                    border: const Border.fromBorderSide(
                      const BorderSide(color: colorLightGray6),
                    ),
                  ),
                  padding: const EdgeInsets.only(
                    top: 24.0,
                    left: 16.0,
                    right: 16.0,
                  ),
                  child: StaggeredGridView.countBuilder(
                    crossAxisCount: 2,
                    itemCount: snapshot.data!.items.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (
                      BuildContext context,
                      int index,
                    ) {
                      return ProductItemPlain(
                        item: snapshot.data!.items[index],
                        onTap: () {},
                      );
                    },
                    staggeredTileBuilder: (int index) {
                      return StaggeredTile.fit(1);
                    },
                    mainAxisSpacing: 16.0,
                    crossAxisSpacing: 32.0,
                  ),
                ),
              ],
            );
          } else {
            return CentralEmptyListPlaceholder(
              message: 'home_content_error_no_featured_products'.tr,
            );
          }
        } else if (snapshot.hasError) {
          return CentralErrorPlaceholder(
            message: "${snapshot.error}",
          );
        }

        return SizedBox.shrink();

/*        return SpinKitThreeBounce(
          size: 20.0,
          color: Get.theme.primaryColor,
        );*/
      },
    );
  }
}

class FeaturedAuctionListWidget extends StatelessWidget {
  const FeaturedAuctionListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeContentController>();
    return FutureBuilder<FeaturedProductResponse>(
      future: controller.getFeaturedAuctions(),
      builder: (_, snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          if (snapshot.data!.items.isNotEmpty) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListHeaderWidget(
                  margin: const EdgeInsets.only(
                    left: 16.0,
                    right: 12.0,
                  ),
                  title: 'home_content_featured_auctions'.tr.toTitleCase(),
                  subtitle: 'view_more'.tr.toTitleCase(),
                  onTap: () {},
                ),
                Container(
                  height: 220.0,
                  margin: const EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: const BoxDecoration(
                    border: const Border.fromBorderSide(
                      const BorderSide(color: colorLightGray6),
                    ),
                  ),
                  padding: const EdgeInsets.only(
                    top: 8.0,
                    left: 8.0,
                    right: 8.0,
                    bottom: 8.0,
                  ),
                  child: StaggeredGridView.countBuilder(
                    crossAxisCount: 1,
                    itemCount: snapshot.data!.items.length,
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (
                      BuildContext context,
                      int index,
                    ) {
                      return AuctionItem(
                        item: snapshot.data!.items[index],
                        onTap: () {},
                        currency: controller.currency,
                      );
                    },
                    staggeredTileBuilder: (int index) {
                      return StaggeredTile.extent(
                        1,
                        150.0,
                      );
                    },
                    mainAxisSpacing: 8.0,
                    crossAxisSpacing: 10.0,
                  ),
                ),
              ],
            );
          } else {
            return CentralEmptyListPlaceholder(
              message: 'home_content_error_no_featured_auctions'.tr,
            );
          }
        } else if (snapshot.hasError) {
          return CentralErrorPlaceholder(
            message: "${snapshot.error}",
          );
        }

        return SizedBox.shrink();

/*        return SpinKitThreeBounce(
          size: 20.0,
          color: Get.theme.primaryColor,
        );*/
      },
    );
  }
}

class ListHeaderWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final GestureTapCallback? onTap;
  final EdgeInsets margin;

  const ListHeaderWidget({
    Key? key,
    required this.title,
    required this.subtitle,
    this.onTap,
    this.margin = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: this.margin,
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            this.title,
            textAlign: TextAlign.start,
            style: Get.textTheme.headline5!.copyWith(
              color: colorLightGray5,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          InkWell(
            borderRadius: const BorderRadius.all(
              const Radius.circular(8.0),
            ),
            onTap: this.onTap,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    this.subtitle,
                    textAlign: TextAlign.start,
                    style: Get.textTheme.bodyText2!.copyWith(
                      color: colorLightOrange1,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    width: 2.0,
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: colorLightOrange1,
                    size: 18.0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RecommendedProductListWidget extends StatelessWidget {
  const RecommendedProductListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FeaturedProductResponse>(
      future: Get.find<HomeContentController>().getFeaturedProducts(),
      builder: (_, snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          if (snapshot.data!.items.isNotEmpty) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListHeaderWidget(
                  margin: const EdgeInsets.only(
                    left: 16.0,
                    right: 12.0,
                  ),
                  title: 'home_content_recommended_products'.tr.toTitleCase(),
                  subtitle: 'view_more'.tr.toTitleCase(),
                  onTap: () {},
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: StaggeredGridView.countBuilder(
                    crossAxisCount: 2,
                    itemCount: snapshot.data!.items.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (
                      BuildContext context,
                      int index,
                    ) {
                      return ProductItem(
                        item: snapshot.data!.items[index],
                        onTap: () {},
                      );
                    },
                    staggeredTileBuilder: (int index) {
                      return StaggeredTile.fit(1);
                    },
                    mainAxisSpacing: 8.0,
                    crossAxisSpacing: 8.0,
                  ),
                ),
              ],
            );
          } else {
            return CentralEmptyListPlaceholder(
              message: 'home_content_error_no_recommended_products'.tr,
            );
          }
        } else if (snapshot.hasError) {
          return CentralErrorPlaceholder(
            message: "${snapshot.error}",
          );
        }

        return SizedBox.shrink();

/*        return SpinKitThreeBounce(
          size: 20.0,
          color: Get.theme.primaryColor,
        );*/
      },
    );
  }
}
