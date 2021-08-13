import 'package:flutter/material.dart';
import 'package:go_share/ui/container/UIConstants/GSWidgetStyles.dart';
import 'package:go_share/ui/container/UIConstants/Strings.dart';

class CustomAppPromotionWidget extends StatelessWidget {
  final String title;

  const CustomAppPromotionWidget({
    Key? key,
    this.title = GSStrings.app_promotion_title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 32.0,
          vertical: 64.0,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              this.title,
              textAlign: TextAlign.center,
              style: GSTextStyles.make20xw700Style(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    "images/ic_download_ios_app.png",
                    height: 40.0,
                    fit: BoxFit.fitHeight,
                  ),
                  Image.asset(
                    "images/ic_download_android_app.png",
                    height: 40.0,
                    fit: BoxFit.fitHeight,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
