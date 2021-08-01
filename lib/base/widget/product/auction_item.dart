import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_share/constants.dart';
import 'package:go_share/data/remote/model/product/product.dart';
import 'package:go_share/util/extension/data_extension.dart';
import 'package:go_share/util/helper/text.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';

class AuctionItem extends StatelessWidget {
  final Product item;
  final String currency;
  final Color currencyColor, timelineBackgroundColor;
  final bool isTimelineVisible;

  final GestureTapCallback onTap;

  // TODO: We will pass a auction item object and remove fields below

  final String timeline;

  const AuctionItem({
    Key? key,
    required this.item,
    required this.onTap,
    required this.currency,
    this.currencyColor = colorLightOrange1,
    this.timelineBackgroundColor = colorLightGray1,
    this.isTimelineVisible = true,
    // TODO: We will remove fields below
    this.timeline = "1 Day 6 Hours Left",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formatCurrency = NumberFormat.decimalPattern();
    final caption = (item.BidCount != null && item.BidCount! > 0)
        ? 'current_bid'.tr.toTitleCase()
        : 'bid_start'.tr.toTitleCase();
    final amount = (item.BidCount != null && item.BidCount! > 0)
        ? item.MaxBidAmount
        : item.BasePrice;

    return Stack(
      children: [
        Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: isTimelineVisible ? 136.0 : 128.0,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    width: 150.0,
                    height: 120.0,
                    decoration: const BoxDecoration(
                      color: colorLightWhite1,
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(10.0),
                      ),
                      border: const Border.fromBorderSide(
                        const BorderSide(color: colorLightWhite2),
                      ),
                    ),
                    padding: const EdgeInsets.all(8.0),
                    child: CachedNetworkImage(
                      width: double.maxFinite,
                      height: double.maxFinite,
                      fit: BoxFit.contain,
                      imageUrl: TextUtil.isNotEmpty(this.item.ImageUrl)
                          ? join(
                              baseAppUrl,
                              this.item.ImageUrl!,
                            )
                          : defaultString,
                      placeholder: (context, url) => SizedBox.shrink(),
                      errorWidget: (context, url, error) => SizedBox.shrink(),
                    ),
                  ),
                  if (this.isTimelineVisible)
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: double.maxFinite,
                        margin: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                        ),
                        padding: const EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 8.0,
                        ),
                        decoration: BoxDecoration(
                          color: this.timelineBackgroundColor,
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(8.0),
                          ),
                        ),
                        child: Text(
                          this.timeline,
                          textAlign: TextAlign.center,
                          style: Get.textTheme.bodyText1!.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 8.0,
                right: 8.0,
                bottom: 2.0,
                top: isTimelineVisible ? 8.0 : 0.0,
              ),
              child: RichText(
                text: TextSpan(
                  text: this.currency,
                  style: Get.textTheme.bodyText2!.copyWith(
                    color: this.currencyColor,
                  ),
                  children: [
                    TextSpan(
                      text: " ${formatCurrency.format(amount)}",
                      style: Get.textTheme.headline5!.copyWith(
                        color: this.currencyColor,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              caption,
              style: Get.textTheme.bodyText2,
            ),
          ],
        ),
        Positioned.fill(
          child: Material(
            child: InkWell(
              borderRadius: const BorderRadius.all(
                const Radius.circular(10.0),
              ),
              onTap: this.onTap,
            ),
            color: Colors.transparent,
          ),
        ),
      ],
    );
  }
}
