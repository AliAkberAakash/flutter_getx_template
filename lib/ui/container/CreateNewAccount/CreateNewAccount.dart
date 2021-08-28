import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_share/base/widget/GSButtonWidget.dart';
import 'package:go_share/base/widget/GSTextField.dart';
import 'package:go_share/ui/container/UIConstants/Colors.dart';
import 'package:go_share/ui/container/UIConstants/GSWidgetStyles.dart';
import 'package:go_share/ui/container/UIConstants/Strings.dart';
import 'package:go_share/ui/container/UIConstants/UISizeConstants.dart';
import 'package:go_share/ui/section4/widgets/text_fields.dart';
import 'package:go_share/utils/dimens.dart';

// UI
class CreateNewAccount extends StatefulWidget {
  @override
  _CreateNewAccountState createState() => _CreateNewAccountState();
} //: UI

// State
class _CreateNewAccountState extends State<CreateNewAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: GSColors.green_primary,
        body: SafeArea(
            child: Stack(children: [
      Container(
        height: GSSizes.size126h,
        width: double.infinity,
        color: GSColors.green_primary,
        child: Center(
          child: Text(
            GSStrings.create_new_account,
            textAlign: TextAlign.start,
            style: GSTextStyles.make28xw600Style(),
          ),
        ),
      ),
      Padding(
          padding: EdgeInsets.only(top: GSSizeConstants.padding105),
          child: Container(
              width: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    GSTextField(
                      hints: GSStrings.full_name,
                    ),
                    SizedBox(
                      height: GSSizeConstants.padding12,
                    ),
                    GSTextField(
                      hints: GSStrings.phone_number,
                    ),
                    SizedBox(
                      height: GSSizeConstants.padding12,
                    ),
                    GSTextField(
                      hints: GSStrings.email_address,
                    ),
                    SizedBox(
                      height: GSSizeConstants.padding12,
                    ),
                    GSTextField(
                      hints: GSStrings.address,
                    ),
                    SizedBox(
                      height: GSSizeConstants.padding12,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: dp23),
                      child: Sec4PasswordTextField(),
                    ),
                    SizedBox(
                      height: GSSizeConstants.padding12,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: dp23),
                      child: Sec4PasswordTextField(
                        hint: GSStrings.reType_password,
                      ),
                    ),
                    SizedBox(
                      height: GSSizeConstants.padding87,
                    ),
                    GSButton(
                      text: GSStrings.create_new_account,
                    ),
                    SizedBox(
                      height: GSSizeConstants.padding7,
                    ),
                    GSTextButton(
                      text: GSStrings.already_have_an_account_sIgn_in,
                    )
                  ],
                ),
              ))),
    ])));
  } //: Widget
} //: State
