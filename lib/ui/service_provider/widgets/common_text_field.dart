import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nilam/utils/colors.dart';
import 'package:nilam/utils/dimens.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;

  const CommonTextField({required this.controller, this.hint = ""});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: TextStyle(
        color: darkText,
        fontSize: dp18,
        fontWeight: FontWeight.bold,
      ),
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
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
      ),
      cursorColor: accent,
    );
  }
}
