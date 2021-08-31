import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:go_share/base/widget/GSButtonWidget.dart';
import 'package:go_share/ui/common_widgets/large_headline_widget.dart';
import 'package:go_share/ui/common_widgets/text_field_headline.dart';
import 'package:go_share/ui/container/UIConstants/Colors.dart';
import 'package:go_share/ui/service_provider/widgets/common_password_field.dart';
import 'package:go_share/ui/service_provider/widgets/common_text_field.dart';
import 'package:go_share/ui/service_provider/widgets/positive_button.dart';
import 'package:go_share/utils/constants.dart';
import 'package:go_share/utils/dimens.dart';
import 'package:go_share/utils/spacers.dart';
import 'package:google_fonts/google_fonts.dart';

class ResetVehicleLoginScreen extends StatefulWidget {
  const ResetVehicleLoginScreen({Key? key}) : super(key: key);

  @override
  _ResetVehicleLoginScreenState createState() =>
      _ResetVehicleLoginScreenState();
}

class _ResetVehicleLoginScreenState extends State<ResetVehicleLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (ctx, constraints) {
          return Container(
            padding: EdgeInsets.all(dp20),
            child: ListView(
              children: [
                LargeHeadlineWidget(
                  headline: "Reset Vehicle Login",
                ),
                VSpacer10(),
                SizedBox(
                  width: constraints.maxWidth * 0.6,
                  child: TextFieldHeadline(
                    headline: "It’s time to rock n role!"
                        " Let’s get started now.",
                  ),
                ),
                VSpacer40(),
                CommonPasswordField(
                  controller: TextEditingController(),
                  hint: "Service Partner password",
                ),
                VSpacer20(),
                CommonPasswordField(
                  controller: TextEditingController(),
                  hint: "New password",
                ),
                VSpacer20(),
                CommonPasswordField(
                  controller: TextEditingController(),
                  hint: "Confirm new password",
                ),
                VSpacer60(),
                PositiveButton(text: "Submit", onClicked: () {
                  modalBottomSheetMenuSuccess(context);
                })
              ],
            ),
          );
        },
      ),
    );
  }

  void modalBottomSheetMenuSuccess(BuildContext context) {
    showModalBottomSheet(
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
                        text: "Reset Vehicle Login",
                        onClick: () {
                          Get.back();
                          Get.back();
                        },
                      ),
                    ),
                  ],
                )),
          );
        });
  }

}
