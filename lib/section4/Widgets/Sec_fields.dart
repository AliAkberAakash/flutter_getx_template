import 'package:flutter/material.dart';
import 'package:go_share/ui/container/UIConstants/Colors.dart';
import 'package:go_share/ui/container/UIConstants/GSWidgetStyles.dart';
import 'package:go_share/ui/container/UIConstants/Strings.dart';
import 'package:go_share/ui/container/UIConstants/UISizeConstants.dart';

class Sec4TextField extends StatelessWidget {
  String hints;

  Sec4TextField({required this.hints});

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: GSSizes.size316x56.width,
      margin: EdgeInsets.symmetric(horizontal: 20),
      height: GSSizes.size316x56.height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(GSBorderRadius.radius8),
        border: Border.all(color: GSColors.gray_normal),
      ),
      child: TextField(
        decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            contentPadding: EdgeInsets.all(
              GSSizeConstants.padding16,
            ),
            hintText: hints),
        style: GSTextStyles.make18xw400Style(color: GSColors.gray_primary),
      ),
    );
  }
}

class Sec4PasswordTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //width: GSSizes.size316x56.width,
      margin: EdgeInsets.symmetric(horizontal: 20),
      height: GSSizes.size316x56.height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(GSBorderRadius.radius8),
        border: Border.all(color: GSColors.gray_normal),
      ),
      child: TextField(
        decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            contentPadding: EdgeInsets.all(
              GSSizeConstants.padding16,
            ),
            hintText: GSStrings.password,
            suffix: Padding(
              padding: const EdgeInsets.only(
                  top: GSSizeConstants.padding20,
                  right: GSSizeConstants.padding12),
              child: Icon(
                Icons.visibility_off,
              ), // myIcon is a 48px-wide widget.
            )),
        style: GSTextStyles.make18xw400Style(color: GSColors.gray_primary),
      ),
    );
  }
}

class Sec4TextButton extends StatelessWidget {
  String text;

  Sec4TextButton({required this.text});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        text,
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            fontSize: GSFontSizes.font16),
      ),
      onPressed: () {
        print('Pressed');
      },
    );
  }
}
