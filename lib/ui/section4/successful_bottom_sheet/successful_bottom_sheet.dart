import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_share/base/widget/GSButtonWidget.dart';
import 'package:go_share/ui/container/UIConstants/Colors.dart';
import 'package:go_share/ui/navigation_container/navigation_container.dart';
import 'package:go_share/utils/constants.dart';
import 'package:go_share/utils/dimens.dart';
import 'package:google_fonts/google_fonts.dart';

void modalBottomSheetMenuSuccess(BuildContext context) {
  showModalBottomSheet(
      isDismissible: false,
      context: context,
      isScrollControlled: true,
      builder: (builder) {
        return new Container(
          height: 450.0,
          color: Color(0xFF737373), //could change this to Color(0xFF737373),
          //so you don't have to change MaterialApp canvasColor
          child: new Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              decoration: new BoxDecoration(
                  color: Colors.white,
                  borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(20.0),
                      topRight: const Radius.circular(20.0))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SvgPicture.asset(
                    AssetConstants.successfulIcon,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          "Successful!",
                          style: GoogleFonts.manrope(
                            color: GSColors.green_secondary,
                            fontSize: dp25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          "Your charity program has been successfully created.\n Now you can check and maintain in your\n'activity' menu.",
                          style: GoogleFonts.manrope(
                            color: GSColors.text_secondary,
                            fontSize: dp14,
                            fontWeight: FontWeight.normal,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: GSButton(
                      text: "Go To Home",
                      onClick: () {
                        Get.back();
                        Get.back();
                        Get.to(NavigationContainer());
                      },
                    ),
                  ),
                ],
              )),
        );
      });
}