import 'package:flutter/material.dart';
import 'package:go_share/utils/colors.dart';
import 'package:go_share/utils/dimens.dart';
import 'package:google_fonts/google_fonts.dart';

class OutlinedMaterialButton extends StatelessWidget {

  final Function() onClick;
  final String text;
  final Color color;

  const OutlinedMaterialButton({
    required this.onClick, 
    required this.text,
    this.color = accent,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: double.infinity,
      onPressed: onClick,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: color,
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
          color: color,
        ),
      ),
    );
  }
}
