import 'package:flutter/material.dart';
import 'package:go_share/utils/colors.dart';
import 'package:go_share/utils/dimens.dart';
import 'package:google_fonts/google_fonts.dart';

class GreyButton extends StatelessWidget {

  final String title;

  const GreyButton({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.all(dp10),
      color: Colors.grey,
      textColor: white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(dp10),
      ),
      onPressed: () {},
      child: Text(
        title,
        style: GoogleFonts.manrope(
          color: white,
          fontSize: dp20,
        ),
      ),
    );
  }
}
