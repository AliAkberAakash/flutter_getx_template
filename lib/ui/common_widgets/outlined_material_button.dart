import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nilam/utils/colors.dart';
import 'package:nilam/utils/dimens.dart';

class OutlinedMaterialButton extends StatelessWidget {

  final Function() onClick;
  final String text;

  const OutlinedMaterialButton({required this.onClick, required this.text});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: double.infinity,
      onPressed: onClick,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: accent,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(
            dp5,
          ),
        ),
      ),
      child: Text(
        text,
        style: GoogleFonts.manrope(
          color: accent,
        ),
      ),
    );
  }
}
