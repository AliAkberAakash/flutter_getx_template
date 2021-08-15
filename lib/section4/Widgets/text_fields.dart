import 'package:flutter/material.dart';
import 'package:go_share/ui/container/UIConstants/Colors.dart';
import 'package:go_share/ui/container/UIConstants/GSWidgetStyles.dart';
import 'package:go_share/ui/container/UIConstants/Strings.dart';
import 'package:go_share/ui/container/UIConstants/UISizeConstants.dart';
import 'dart:math' as math;

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
          suffixIcon: Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(math.pi),
            child: Icon(
              Icons.visibility_off_rounded,
              color: Colors.black.withOpacity(.4),
            ),
          ),
          suffix: Padding(
            padding: const EdgeInsets.only(
                top: GSSizeConstants.padding20,
                right: GSSizeConstants.padding12),
            // myIcon is a 48px-wide widget.
          ),
        ),
        style: GSTextStyles.make18xw400Style(color: GSColors.gray_primary),
      ),
    );
  }
}

class Sec4TextButton extends StatelessWidget {
  String text1;
  String text2;

  Sec4TextButton({required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text1 + " ",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                fontSize: GSFontSizes.font16),
          ),
          Text(
            text2,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              fontSize: GSFontSizes.font16,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
      onPressed: () {
        print('Pressed');
      },
    );
  }
}
