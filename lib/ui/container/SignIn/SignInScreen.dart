import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_share/base/widget/GSButtonWidget.dart';
import 'package:go_share/base/widget/GSTextField.dart';
import 'package:go_share/ui/container/UIConstants/Colors.dart';
import 'package:go_share/ui/container/UIConstants/GSWidgetStyles.dart';
import 'package:go_share/ui/container/UIConstants/Strings.dart';
import 'package:go_share/ui/container/UIConstants/UISizeConstants.dart';

// UI
class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
} //: UI

// State
class _SignInScreenState extends State<SignInScreen> {
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
          color: GSColors.green_primary,
          child: Column(
            children: [
              SizedBox(
                height: GSSizeConstants.padding120,
              ),

              //Get start text
              Text(
                GSStrings.welcome_back,
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
                    GSStrings.sign_in_description,
                    style: GSTextStyles.make18xw400Style(),
                    textAlign: TextAlign.center,
                  ))),
            ],
          ),
        ),
        SizedBox(
          height: GSSizeConstants.padding55,
        ),
        GSTextField(
          hints: GSStrings.email_field_hints,
        ),
        SizedBox(
          height: GSSizeConstants.padding17,
        ),
        GSPasswordTextField(),
        SizedBox(
          height: GSSizeConstants.padding87,
        ),
        GSButton(
          text: GSStrings.sign_in,
        ),
        SizedBox(
          height: GSSizeConstants.padding7,
        ),
        GSTextButton(
          text: GSStrings.forget_password_reset_here,
        )
      ],
    )));
  } //: Widget
} //: State
