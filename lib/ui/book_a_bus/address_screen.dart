import 'package:flutter/material.dart';
import 'package:go_share/base/widget/custom_text_form_field.dart';
import 'package:go_share/constants.dart';
import 'package:go_share/ui/common_widgets/grey_button.dart';
import 'package:go_share/ui/common_widgets/large_headline_widget.dart';
import 'package:go_share/ui/common_widgets/text_field_headline.dart';
import 'package:go_share/ui/service_provider/widgets/common_text_field.dart';
import 'package:go_share/ui/service_provider/widgets/positive_button.dart';
import 'package:go_share/utils/colors.dart';
import 'package:go_share/utils/dimens.dart';
import 'package:go_share/utils/spacers.dart';
import 'package:google_fonts/google_fonts.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  _AddressScreenState createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
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
            TextFieldHeadline(headline: "Pickup Point*"),
            VSpacer20(),
            CommonTextField(
              controller: TextEditingController(),
              hint: "Location",
            ),
            VSpacer20(),
            Row(
              children: [
                Flexible(
                  child: CommonTextField(
                    controller: TextEditingController(),
                    hint: "Postal Code",
                  ),
                ),
                Container(
                  width: 200,
                )
              ],
            ),
            VSpacer20(),
            TextFieldHeadline(headline: "Pickup Remarks"),
            VSpacer20(),
            CommonTextField(
              controller: TextEditingController(),
            ),
            VSpacer40(),
            TextFieldHeadline(headline: "Drop Off Location*"),
            VSpacer20(),
            CommonTextField(
              controller: TextEditingController(),
              hint: "Location",
            ),
            VSpacer20(),
            Row(
              children: [
                Flexible(
                  child: CommonTextField(
                    controller: TextEditingController(),
                    hint: "Postal Code",
                  ),
                ),
                Container(
                  width: 200,
                )
              ],
            ),
            VSpacer20(),
            TextFieldHeadline(headline: "Write your comments"),
            VSpacer20(),
            TextFormField(
              maxLines: 3,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(dp10),
                  borderSide: BorderSide(color: grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(dp10),
                  borderSide: BorderSide(color: accent),
                ),
              ),
              cursorColor: grey,
            ),
            VSpacer20(),
            Row(
              children: [
                Expanded(
                  child: GreyButton(
                    title: "Back",
                  ),
                ),
                HSpacer10(),
                Expanded(
                  child: PositiveButton(text: "Next", onClicked: () {

                  }),
                ),
              ],
            ),
            VSpacer40(),
            VSpacer40(),
          ],
        ),
      ),
    );
  }
}
