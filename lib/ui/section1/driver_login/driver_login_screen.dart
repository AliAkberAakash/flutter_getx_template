import 'package:custom_check_box/custom_check_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_share/base/widget/GSButtonWidget.dart';
import 'package:go_share/base/widget/GSTextField.dart';
import 'package:go_share/ui/container/UIConstants/Colors.dart';
import 'package:go_share/ui/container/UIConstants/GSWidgetStyles.dart';
import 'package:go_share/ui/container/UIConstants/Strings.dart';
import 'package:go_share/ui/container/UIConstants/UISizeConstants.dart';
import 'package:go_share/ui/section1/driver_container/driver_container.dart';
import 'package:go_share/utils/colors.dart';
import 'package:go_share/utils/dimens.dart';
import 'package:go_share/utils/spacers.dart';
import 'package:google_fonts/google_fonts.dart';

// UI
class DriverLoginScreen extends StatefulWidget {
  @override
  _DriverLoginScreenState createState() => _DriverLoginScreenState();
} //: UI

// State
class _DriverLoginScreenState extends State<DriverLoginScreen> {

  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: GSColors.green_primary,
        body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: GSSizes.size278h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "images/signup_bg.png",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: GSSizeConstants.padding120,
                      ),

                      //Get start text
                      Text(
                        "Driver Login",
                        textAlign: TextAlign.start,
                        style: GSTextStyles.make28xw600Style(),
                      ),

                      SizedBox(
                        height: GSSizeConstants.padding7,
                      ),

                      // Description test
                      Container(
                          width: 256,
                          child: Center(
                              child: Text(
                                "It’s time to rock n role! Let’s get started now.",
                                style: GSTextStyles.make18xw400Style(),
                                textAlign: TextAlign.center,
                              ))),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: GSSizeConstants.padding55,
                        ),
                        GSTextField(
                          hints: "Vehicle Number"
                        ),
                        SizedBox(
                          height: GSSizeConstants.padding17,
                        ),
                        GSPasswordTextField(),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                          child: Row(
                            children: [
                              CustomCheckBox(
                                value: value,
                                shouldShowBorder: true,
                                borderColor: Colors.white,
                                uncheckedFillColor: Colors.grey,
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
                                  color: grey,
                                  fontSize: dp18,
                                  fontWeight: FontWeight.normal,
                                ),
                              )
                            ],
                          ),
                        ),
                        VSpacer20(),
                        GSButton(
                          text: GSStrings.sign_in,
                          onClick: (){
                            Get.to(DriverContainer());
                          },
                        ),
                        SizedBox(
                          height: GSSizeConstants.padding7,
                        ),
                        SizedBox(
                          height: GSSizeConstants.padding7,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )));
  } //: Widget
} //: State