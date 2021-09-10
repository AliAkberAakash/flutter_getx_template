import 'package:flutter/material.dart';
import 'package:go_share/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Server Error",
          style: GoogleFonts.poppins(
            color: light_grey,
          ),
        ),
      ),
    );
  }
}
