import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_share/ui/book_a_bus/booking_controller.dart';

class QRScreen extends StatelessWidget {
 QRScreen({Key? key}) : super(key: key);

  final BookingController bookingController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx((){

        var response = bookingController.payNowResponse.value;

        if(response != null){
          var image = response.data?.attributes.instructions.qrCodeDisplayImage;
          return Column(
              children: [
              Image.memory(base64Decode(image ?? ""),),
          ],
          );
        }
        else return Container();
      })
    );
  }
}
