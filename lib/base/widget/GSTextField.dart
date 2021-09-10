import 'package:flutter/material.dart';
import 'package:go_share/ui/container/UIConstants/Colors.dart';
import 'package:go_share/ui/container/UIConstants/GSWidgetStyles.dart';
import 'package:go_share/ui/container/UIConstants/Strings.dart';
import 'package:go_share/ui/container/UIConstants/UISizeConstants.dart';

class GSTextField extends StatelessWidget {
  String hints;

  final TextEditingController controller;
  GSTextField({required this.hints, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: GSSizes.size316x56.width,
      height: GSSizes.size316x56.height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(GSBorderRadius.radius8),
        border: Border.all(color: GSColors.gray_normal),
      ),
      child: TextField(
        controller: controller,
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

class GSPasswordTextField extends StatelessWidget {

  final TextEditingController controller;

  const GSPasswordTextField({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: GSSizes.size316x56.width,
      height: GSSizes.size316x56.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(GSBorderRadius.radius8),
        border: Border.all(color: GSColors.gray_normal),
      ),
      child: TextField(
        controller: controller,
        obscureText: true,
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
