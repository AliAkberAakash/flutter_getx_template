import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nilam/ui/common_widgets/text_field_headline.dart';
import 'package:nilam/utils/colors.dart';

class VehicleInfoWidget extends StatelessWidget {

  final String title, value;

  const VehicleInfoWidget({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFieldHeadline(
          headline: title,
        ),
        Text(
          "VA 112414",
          style: GoogleFonts.manrope(
              fontWeight: FontWeight.w600,
              color: blueText
          ),
        ),
      ],
    );
  }
}
