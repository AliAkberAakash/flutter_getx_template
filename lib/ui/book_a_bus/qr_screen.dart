import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_share/ui/book_a_bus/booking_controller.dart';
import 'package:go_share/ui/common_widgets/positive_button.dart';
import 'package:go_share/utils/dimens.dart';
import 'package:go_share/utils/spacers.dart';
import 'package:screenshot/screenshot.dart';

class QRScreen extends StatefulWidget {
 QRScreen({Key? key}) : super(key: key);

  @override
  _QRScreenState createState() => _QRScreenState();
}

class _QRScreenState extends State<QRScreen> {
  final BookingController bookingController = Get.find();

  Image? imageWidget;
  ScreenshotController screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx((){

        var response = bookingController.payNowResponse.value;

        if(response != null){
          var image = response.data?.attributes.instructions.qrCodeDisplayImage;
          imageWidget = Image.memory(
            base64Decode(image ?? ""),
            height: dp220,
            width: dp220,
          );
          return Container(
            width: double.maxFinite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  "Please scan the QR and make payment",
                ),
                VSpacer20(),
                imageWidget!,
                VSpacer20(),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: dp20),
                        child: PositiveButton(
                          text: "Download",
                          onClicked: () {
                            //todo
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: dp20),
                        child: PositiveButton(
                          text: "Submit",
                          onClicked: () {
                            //todo
                          },
                        ),
                      ),
                    ),
                  ],
                )
            ],
            ),
          );
        }
        else return Container();
      })
    );
  }
}
