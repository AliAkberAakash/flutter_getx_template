import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:go_share/base/widget/GSButtonWidget.dart';
import 'package:go_share/base/widget/GSTextField.dart';
import 'package:go_share/ui/common_widgets/positive_button.dart';
import 'package:go_share/ui/container/UIConstants/Colors.dart';
import 'package:go_share/ui/container/UIConstants/GSWidgetStyles.dart';
import 'package:go_share/ui/container/UIConstants/Strings.dart';
import 'package:go_share/ui/container/UIConstants/UISizeConstants.dart';
import 'package:go_share/ui/not_logged_in_welcome/navigation_container/navigation_container.dart';
import 'package:go_share/ui/section1/service_provider_password_reset/service_provider_passowrd_reset_screen.dart';
import 'package:go_share/utils/constants.dart';
import 'package:go_share/utils/dimens.dart';
import 'package:go_share/utils/spacers.dart';
import 'package:google_fonts/google_fonts.dart';

// UI
class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
} //: UI

// State
class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: GSColors.green_primary,
        body: SafeArea(
            child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: double.infinity,
          child: Column(
            children: [
              //Get start text
              Text(
                "Request Password Reset",
                textAlign: TextAlign.start,
                style:
                    GSTextStyles.make28xw700Style(color: GSColors.gray_primary),
              ),

              VSpacer40(),

              // Description test
              Container(
                  width: 256,
                  child: Center(
                      child: Text(
                    "Please enter your email address to get the code",
                    style: GSTextStyles.make18xw400Style(
                        color: GSColors.gray_secondary),
                    textAlign: TextAlign.center,
                  ))),
            ],
          ),
        ),
        SizedBox(
          height: GSSizeConstants.padding38,
        ),
        GSTextField(
          controller: TextEditingController(),
          hints: "Email Address",
        ),
        SizedBox(
          height: GSSizeConstants.padding30,
        ),
        GSButton(
          onClick: (){
            showSuccessSheet(context);
          },
          text: GSStrings.submit,
        ),
        SizedBox(
          height: GSSizeConstants.padding7,
        ),
      ],
    )));
  }

  void showSuccessSheet(BuildContext context) {
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
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: dp30),
                          child: Text(
                            "Reset password request sent",
                            textAlign: TextAlign.center,
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
                            "Please check your email for the code",
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: dp30),
                      child: Row(
                        children: [
                          Expanded(
                            child: PositiveButton(
                              text: "Reset Password",
                              onClicked: (){
                                Get.back();
                                Get.back();
                                Get.to(ServiceProviderPasswordResetScreen());
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          );
        });
  }

}
