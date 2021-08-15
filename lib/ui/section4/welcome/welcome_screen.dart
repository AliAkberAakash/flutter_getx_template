import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_share/base/widget/GSButtonWidget.dart';
import 'package:go_share/ui/container/UIConstants/Colors.dart';
import 'package:go_share/ui/container/UIConstants/Strings.dart';
import 'package:go_share/ui/container/UIConstants/UISizeConstants.dart';
import 'package:go_share/ui/section4/widgets/create_account_button.dart';
import 'package:go_share/utils/colors.dart';
import 'package:go_share/utils/dimens.dart';
import 'package:google_fonts/google_fonts.dart';

// UI
class WelcomeScreen extends StatefulWidget {
  @override
  _Sec4WelcomeScreenState createState() => _Sec4WelcomeScreenState();
} //: UI

// State
class _Sec4WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: GSColors.green_primary,
        body: Stack(
          children: [
            Image.asset(
              "images/ic_background_one.png",
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            SafeArea(
                child: Padding(
                    padding: EdgeInsets.fromLTRB(
                        GSSizeConstants.padding30,
                        GSSizeConstants.zero,
                        GSSizeConstants.padding30,
                        GSSizeConstants.zero),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      //mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        //Get start text
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: GSSizeConstants.padding20),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              GSStrings.get_started + "\n",
                              textAlign: TextAlign.start,
                              //style: GSTextStyles.make18xw400Style(),
                              style: GoogleFonts.manrope(
                                color: white,
                                fontSize: dp18,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ),

                        // Description text
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: GSSizeConstants.padding20),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Millions of\n"
                              "people use to\n"
                              "turn their ideas\n",
                              //style: GSTextStyles.make34xw700Style(),
                              style: GoogleFonts.manrope(
                                color: white,
                                fontSize: dp30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(
                          height: GSSizeConstants.padding30,
                        ),
                        GSButton(
                          text: GSStrings.sign_in,
                        ),
                        SizedBox(
                          height: GSSizeConstants.padding22,
                        ),
                        CreateAccountButtonOutlineStock(),
                        SizedBox(
                          height: GSSizeConstants.padding55,
                        ),
                      ],
                    ))),
          ],
        ));
  } //: Widget
} //: State
