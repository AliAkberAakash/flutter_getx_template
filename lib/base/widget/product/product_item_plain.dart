import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_share/constants.dart';
import 'package:go_share/data/remote/model/product/product.dart';
import 'package:go_share/util/helper/text.dart';
import 'package:path/path.dart';

class ProductItemPlain extends StatelessWidget {
  final Product item;
  final GestureTapCallback onTap;

  const ProductItemPlain({
    Key? key,
    required this.item,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.0,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CachedNetworkImage(
                width: 200,
                height: 120,
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
              if (TextUtil.isNotEmpty(this.item.ItemName))
                Text(
                  this.item.ItemName!,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: Get.textTheme.bodyText2,
                ).marginOnly(top: 16.0),
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
    );
  }
}
