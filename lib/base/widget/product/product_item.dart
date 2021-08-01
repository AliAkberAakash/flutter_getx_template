import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:nilam/constants.dart';
import 'package:nilam/data/remote/model/product/product.dart';
import 'package:nilam/util/helper/text.dart';
import 'package:path/path.dart';

class ProductItem extends StatelessWidget {
  final Product item;
  final GestureTapCallback onTap;

  final String currency;
  final Color currencyColor;

  const ProductItem({
    Key? key,
    required this.item,
    required this.onTap,
    this.currency = "tk",
    this.currencyColor = colorLightOrange1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formatCurrency = NumberFormat.decimalPattern();

    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(
          const Radius.circular(10.0),
        ),
      ),
      child: Container(
        width: 200.0,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: const Radius.circular(10.0),
                    topRight: const Radius.circular(10.0),
                  ),
                  child: CachedNetworkImage(
                    width: double.maxFinite,
                    height: 150,
                    fit: BoxFit.cover,
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
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (TextUtil.isNotEmpty(this.item.ItemName))
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            this.item.ItemName!,
                            textAlign: TextAlign.start,
                            style: Get.textTheme.headline6!.copyWith(
                              fontWeight: FontWeight.w500,
                              color: colorLightGray7,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 8.0),
                              decoration: const BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(10.0),
                                ),
                                color: colorLightGreenAccent2,
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                                vertical: 4.0,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "4.7",
                                    textAlign: TextAlign.start,
                                    style: Get.textTheme.bodyText1!.copyWith(
                                      color: colorLightGreenAccent1,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ).marginOnly(right: 2.0),
                                  Icon(
                                    Icons.star,
                                    color: colorLightGreenAccent1,
                                    size: 14.0,
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              "(3)",
                              textAlign: TextAlign.start,
                              style: Get.textTheme.bodyText1,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 6.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            RichText(
                              text: TextSpan(
                                text: this.currency,
                                style: Get.textTheme.bodyText2!.copyWith(
                                  color: this.currencyColor,
                                ),
                                children: [
                                  TextSpan(
                                    text: " ${formatCurrency.format(
                                      this.item.SalesPrice,
                                    )}",
                                    style: Get.textTheme.headline6!.copyWith(
                                      color: this.currencyColor,
                                    ),
                                  ),
                                ],
                              ),
                              textAlign: TextAlign.start,
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  "Current Bid",
                                  textAlign: TextAlign.start,
                                  style: Get.textTheme.caption!.copyWith(
                                    fontWeight: FontWeight.w400,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned.fill(
              child: Material(
                child: InkWell(
                  onTap: this.onTap,
                ),
                color: Colors.transparent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
