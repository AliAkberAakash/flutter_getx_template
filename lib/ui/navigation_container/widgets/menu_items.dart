import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nilam/utils/colors.dart';
import 'package:nilam/utils/dimens.dart';
import 'package:nilam/utils/spacers.dart';


class MenuItem extends StatelessWidget {

  final bool isSelected;
  final int index;
  final String title;
  final String icon;

  const MenuItem({
    required this.isSelected,
    required this.index,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isSelected ? accent.withOpacity(0.1) : white,
      padding: EdgeInsets.all(dp20),
      child: Row(
        children: [
          SvgPicture.asset(
            icon,
            height: dp25,
            width: dp25,
            color: isSelected ? accent : menuItemColor,
          ),
          HSpacer20(),
          Text(
            title,
            style: GoogleFonts.manrope(
              color: isSelected ? accent : menuItemColor
            ),
          )
        ],
      ),
    );
  }
}
