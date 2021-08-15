import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_share/base/widget/GSButtonWidget.dart';
import 'package:go_share/base/widget/GSTextField.dart';
import 'package:go_share/section4/Component/Sec_fields.dart';
import 'package:go_share/ui/container/UIConstants/Colors.dart';
import 'package:go_share/ui/container/UIConstants/GSWidgetStyles.dart';
import 'package:go_share/ui/container/UIConstants/Strings.dart';
import 'package:go_share/ui/container/UIConstants/UISizeConstants.dart';
import 'package:go_share/ui/container/widget_container/widget_container.dart';
import 'package:go_share/ui/navigation_container/navigation_container.dart';
import 'package:go_share/utils/colors.dart';
import 'package:go_share/utils/dimens.dart';
import 'package:google_fonts/google_fonts.dart';

// UI
class Sec4SignInScreen extends StatefulWidget {
  @override
  _Sec4SignInScreenState createState() => _Sec4SignInScreenState();
} //: UI

// State
class _Sec4SignInScreenState extends State<Sec4SignInScreen> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: GSColors.green_primary,
        body: Stack(
      children: [
        Image.asset(
          "images/ic_background_one.png",
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
                    height: MediaQuery.of(context).size.height * 0.3,
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
                    height: GSSizeConstants.padding4,
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
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    width: 14,
                    height: 14,
                    color: Colors.white60,
                    child: Checkbox(
                        checkColor: Colors.yellowAccent, // color of tick Mark
                        activeColor: GSColors.green_normal,
                        value: value,
                        onChanged: (v) {
                          setState(() {
                            value = v == true ? true : false;
                          });
                        }),
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
                  Get.to(WidgetContainerView());
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
              text: GSStrings.forget_password_reset_here,
            ),
          ],
        )),
      ],
    ));
  } //: Widget
} //: State
