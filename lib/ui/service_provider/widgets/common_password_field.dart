import 'package:flutter/material.dart';
import 'package:go_share/ui/container/UIConstants/UISizeConstants.dart';
import 'package:go_share/utils/colors.dart';
import 'package:go_share/utils/dimens.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonPasswordField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;

  const CommonPasswordField({required this.controller, this.hint = ""});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: true,
      controller: controller,
      style: TextStyle(
        color: darkText,
        fontSize: dp18,
        fontWeight: FontWeight.bold,
      ),
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 10),
        hintText: hint,
        hintStyle: GoogleFonts.manrope(
            color: light_grey,
            fontSize: 14
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(dp10),
          borderSide: BorderSide(color: grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(dp10),
          borderSide: BorderSide(color: accent),
        ),
        suffix: Padding(
          padding: EdgeInsets.only(right: dp10),
          child: Icon(
            Icons.visibility_off,
          ),
        ),
      ),
      cursorColor: accent,
    );
  }
}
