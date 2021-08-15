import 'package:flutter/material.dart';
import 'package:go_share/ui/container/UIConstants/Colors.dart';
import 'package:go_share/ui/container/UIConstants/Strings.dart';
import 'package:go_share/ui/container/UIConstants/UISizeConstants.dart';
import 'package:go_share/utils/colors.dart';

class CreateAccountButtonOutlineStock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      child: Text(
        GSStrings.create_new_account,
        style: TextStyle(
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            fontSize: GSFontSizes.font18),
      ),
      style: OutlinedButton.styleFrom(
        primary: white,
        side: BorderSide(color: white),
        shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(GSBorderRadius.radius8))),
        minimumSize: GSSizes.size316x56,
      ),
      onPressed: () {
        print('Pressed');
      },
    );
  }
}
