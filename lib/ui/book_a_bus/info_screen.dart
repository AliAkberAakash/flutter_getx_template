import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_share/ui/book_a_bus/address_screen.dart';
import 'package:go_share/ui/common_widgets/large_headline_widget.dart';
import 'package:go_share/ui/common_widgets/text_field_headline.dart';
import 'package:go_share/ui/service_provider/widgets/common_text_field.dart';
import 'package:go_share/ui/service_provider/widgets/positive_button.dart';
import 'package:go_share/utils/colors.dart';
import 'package:go_share/utils/dimens.dart';
import 'package:go_share/utils/spacers.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {

  int seat=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(dp20),
        child: ListView(
          children: [
            VSpacer20(),
            LargeHeadlineWidget(headline: "Book a Bus"),
            VSpacer40(),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "01. Info",
                        style: GoogleFonts.manrope(
                          color: accent,
                        ),
                      ),
                      VSpacer10(),
                      Container(
                        height: dp5,
                        color: accent,
                      ),
                    ],
                  ),
                ),
                HSpacer5(),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "02. Address",
                        style: GoogleFonts.manrope(
                          color: grey,
                        ),
                      ),
                      VSpacer10(),
                      Container(
                        height: dp5,
                        color: light_grey,
                      ),
                    ],
                  ),
                ),
                HSpacer5(),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "03. Payment",
                        style: GoogleFonts.manrope(
                          color: grey,
                        ),
                      ),
                      VSpacer10(),
                      Container(
                        height: dp5,
                        color: light_grey,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            VSpacer20(),
            Row(
              children: [
                Expanded(
                  child: TextFieldHeadline(headline: "Seat"),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        dp5,
                      ),
                    ),
                    border: Border.all(
                      color: light_grey
                    )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: (){
                          setState(() {
                            seat++;
                          });
                        },
                        icon: Icon(
                          Icons.add,
                          color: accent,
                        ),
                      ),
                      Container(
                        width: 1,
                        height: 50,
                        color: light_grey,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: dp20),
                        child: Text(
                          seat.toString(),
                        ),
                      ),
                      Container(
                        width: 1,
                        height: 50,
                        color: light_grey,
                      ),
                      IconButton(
                        onPressed: (){
                          setState(() {
                            if(seat>0)
                              seat--;
                          });
                        },
                        icon: Icon(
                          Icons.remove,
                          color: accent,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            VSpacer20(),
            TextFieldHeadline(headline: "Child Name*"),
            VSpacer20(),
            CommonTextField(
              controller: TextEditingController(),
              hint: "Child Name",
            ),
            VSpacer20(),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFieldHeadline(headline: "Start Date*"),
                      VSpacer20(),
                      CommonTextField(
                        controller: TextEditingController(),
                        hint: "Start Date",
                      ),
                    ],
                  ),
                ),
                HSpacer20(),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFieldHeadline(headline: "End Date*"),
                      VSpacer20(),
                      CommonTextField(
                        controller: TextEditingController(),
                        hint: "End Date",
                      ),
                    ],
                  ),
                ),
              ],
            ),
            VSpacer20(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFieldHeadline(headline: "Pickup Time*"),
                      VSpacer20(),
                      CommonTextField(
                        controller: TextEditingController(),
                        hint: "Child Name",
                      ),
                    ],
                  ),
                ),
                HSpacer20(),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CommonTextField(
                        controller: TextEditingController(),
                        hint: "10:00 AM",
                      ),
                    ],
                  ),
                ),
              ],
            ),
            VSpacer20(),
            PositiveButton(
              text: "Next",
              onClicked: () {
                Get.to(
                  AddressScreen(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
