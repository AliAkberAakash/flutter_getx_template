import 'package:flutter/material.dart';
import 'package:go_share/utils/colors.dart';
import 'package:go_share/utils/dimens.dart';
import 'package:google_fonts/google_fonts.dart';

class PositiveButton extends StatelessWidget {
  final String text;
  final Function() onClicked;

  const PositiveButton({required this.text, required this.onClicked});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.all(dp10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(
            dp10,
          ),
        ),
      ),
      onPressed: onClicked,
      color: accent,
      child: Text(
        text,
        style: GoogleFonts.manrope(
          color: white,
          fontSize: dp20,
        ),
      ),
    );
  }
}
