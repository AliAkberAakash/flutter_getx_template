import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_share/base/widget/GSButtonWidget.dart';
import 'package:go_share/base/widget/GSTextField.dart';
import 'package:go_share/ui/container/UIConstants/Colors.dart';
import 'package:go_share/ui/container/UIConstants/GSWidgetStyles.dart';
import 'package:go_share/ui/container/UIConstants/Strings.dart';
import 'package:go_share/ui/container/UIConstants/UISizeConstants.dart';

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
                GSStrings.forgot_password,
                textAlign: TextAlign.start,
                style:
                    GSTextStyles.make28xw700Style(color: GSColors.gray_primary),
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
          hints: GSStrings.email_field_hints,
        ),
        SizedBox(
          height: GSSizeConstants.padding30,
        ),
        GSButton(
          text: GSStrings.submit,
        ),
        SizedBox(
          height: GSSizeConstants.padding7,
        ),
      ],
    )));
  } //: Widget
} //: State
