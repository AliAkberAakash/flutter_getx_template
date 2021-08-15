import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_share/constants.dart';
import 'package:go_share/section4/successful_bottom_sheet/successful_bottom_sheet.dart';
import 'package:go_share/ui/container/UIConstants/Colors.dart';
import 'package:go_share/utils/dimens.dart';
import 'package:google_fonts/google_fonts.dart';

class Sec4NotificationItem extends StatelessWidget {
  const Sec4NotificationItem({Key? key}) : super(key: key);

  final String msg =
      "Hey Erin, thanks for shopping at Clothstore! We’ve got tons of exciting deals in our upcoming Fall Collection. Stay tuned or visit www.cstore.com to learn more.";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        modalBottomSheetMenu(context);
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: SvgPicture.asset(
                            vehicleIcon,
                          ),
                        ),
                        Text(
                          "Admin Notice",
                          style: GoogleFonts.manrope(
                            color: GSColors.gray_secondary,
                            fontSize: dp12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: GSColors.green_light,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      child: Text(
                        "Successful",
                        style: GoogleFonts.manrope(
                          color: GSColors.green_primary,
                          fontSize: dp10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  msg,
                  style: GoogleFonts.manrope(
                    color: GSColors.gray_primary,
                    fontSize: dp14,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "March 12, 2020    10:00 PM",
                  style: GoogleFonts.manrope(
                    color: GSColors.gray_normal,
                    fontSize: dp10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 0.8,
          ),
        ],
      ),
    );
  }
}
