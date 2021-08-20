import 'package:custom_check_box/custom_check_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_share/base/widget/GSButtonWidget.dart';
import 'package:go_share/base/widget/GSTextField.dart';
import 'package:go_share/ui/container/ForgotPassword/ForgotPassword.dart';
import 'package:go_share/ui/container/UIConstants/Colors.dart';
import 'package:go_share/ui/container/UIConstants/GSWidgetStyles.dart';
import 'package:go_share/ui/container/UIConstants/Strings.dart';
import 'package:go_share/ui/container/UIConstants/UISizeConstants.dart';
import 'package:go_share/ui/container/widget_container/widget_container.dart';
import 'package:go_share/ui/section4/widgets/text_fields.dart';
import 'package:go_share/utils/colors.dart';
import 'package:go_share/utils/constants.dart';
import 'package:go_share/utils/dimens.dart';
import 'package:google_fonts/google_fonts.dart';

import 'navigation_container/navigation_container.dart';

// UI
class NSignInScreen extends StatefulWidget {
  @override
  _Sec4SignInScreenState createState() => _Sec4SignInScreenState();
} //: UI

// State
class _Sec4SignInScreenState extends State<NSignInScreen> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: GSColors.green_primary,
        body: Stack(
      children: [
        Image.asset(
          AssetConstants.ic_welcome,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        SafeArea(
            child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10),
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              //height: GSSizes.size278h,
              width: double.infinity,
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                  ),

                  //Get start text
                  Text(
                    GSStrings.welcome_back,
                    textAlign: TextAlign.start,
                    style: GoogleFonts.manrope(
                      color: white,
                      fontSize: dp30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(
                    height: GSSizeConstants.padding10,
                  ),

                  // Description test
                  Container(
                      width: 256,
                      child: Center(
                          child: Text(
                        "It’s time to rock n role! Let’s\nget started now.",
                        style: GoogleFonts.manrope(
                          color: white,
                          fontSize: dp18,
                          fontWeight: FontWeight.normal,
                        ),
                        textAlign: TextAlign.center,
                      ))),
                ],
              ),
            ),
            SizedBox(
              height: GSSizeConstants.padding55,
            ),
            Sec4TextField(
              hints: GSStrings.email_field_hints,
            ),
            SizedBox(
              height: GSSizeConstants.padding17,
            ),
            Sec4PasswordTextField(),
            Container(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 5),
              child: Row(
                children: [
                  CustomCheckBox(
                    value: value,
                    shouldShowBorder: true,
                    borderColor: Colors.white,
                    uncheckedFillColor: Colors.white60,
                    checkedFillColor: GSColors.green_normal,
                    borderRadius: 2,
                    borderWidth: 1,
                    checkBoxSize: 15,
                    uncheckedIconColor: Colors.transparent,
                    onChanged: (val) {
                      //do your stuff here
                      setState(() {
                        value = val;
                      });
                    },
                  ),
                  Text(
                    "Keep me signed in",
                    style: GoogleFonts.manrope(
                      color: white,
                      fontSize: dp18,
                      fontWeight: FontWeight.normal,
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: GSButton(
                text: GSStrings.sign_in,
                onClick: () {
                  Get.to(NavigationContainer());
                },
              ),
            ),
            SizedBox(
              height: GSSizeConstants.padding7,
            ),
            //Container(
            //  margin: EdgeInsets.symmetric(horizontal: 20),
            //  child: GSButton(
            //    text: "Sign in as a merchant",
            //    onClick: () {
            //      Get.to(NavigationContainer());
            //    },
            //  ),
            //),
            SizedBox(
              height: GSSizeConstants.padding7,
            ),
            Sec4TextButton(
              text1: "Forgot Password?",
              text2: "Reset here",
              onClicked: (){
                Get.to(ForgotPassword());
              },
            ),
            SizedBox(
              height: GSSizeConstants.padding25,
            ),
          ],
        )),
      ],
    ));
  } //: Widget
} //: State
