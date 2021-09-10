import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_share/utils/dimens.dart';

showLoader(){
  Get.dialog(
    AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(dp10),
        ),
      ),
      content: Container(
        height: 150,
        width: 150,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    ),
    barrierDismissible: false,
  );
}