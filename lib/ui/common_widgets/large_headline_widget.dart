import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nilam/utils/colors.dart';
import 'package:nilam/utils/dimens.dart';

class LargeHeadlineWidget extends StatelessWidget {

  final String headline;

  const LargeHeadlineWidget({required this.headline});

  @override
  Widget build(BuildContext context) {
    return Text(
      headline,
      style: GoogleFonts.manrope(
        color: darkText,
        fontSize: dp25,
        fontWeight: FontWeight.bold,
      )
    );
  }
}
