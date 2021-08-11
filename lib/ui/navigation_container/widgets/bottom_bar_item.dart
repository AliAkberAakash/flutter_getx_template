import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nilam/utils/colors.dart';
import 'package:nilam/utils/dimens.dart';
import 'package:nilam/utils/spacers.dart';

class BottomBarItem extends StatelessWidget {

  final String iconString;
  final bool isSelected;
  final String title;
  final int index;
  final Function(int) onTap;

  const BottomBarItem({
    Key? key,
    required this.iconString,
    required this.isSelected,
    required this.title,
    required this.index,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:()=> onTap(index),
      child: Container(
        padding: EdgeInsets.all(dp10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            iconString.isEmpty ?
            SizedBox(height: 30,) :
            SvgPicture.asset(
              iconString,
              color: /*isSelected ? accent :*/ darkText,
              height: 30,
              width: 30,
            ),
            Text(
              title,
              style: GoogleFonts.manrope(
                color: /*isSelected ? accent :*/ grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
