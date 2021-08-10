import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nilam/ui/common_widgets/text_field_headline.dart';
import 'package:nilam/ui/common_widgets/text_field_value_widget.dart';
import 'package:nilam/ui/registration_request/widgets/status_chip.dart';
import 'package:nilam/ui/vehicle_free_busy_list/widgets/vehicle_free_busy_item.dart';
import 'package:nilam/utils/colors.dart';
import 'package:nilam/utils/dimens.dart';
import 'package:nilam/utils/spacers.dart';

class VehicleFreeBusyDetails extends StatefulWidget {
  const VehicleFreeBusyDetails({Key? key}) : super(key: key);

  @override
  _VehicleFreeBusyDetailsState createState() => _VehicleFreeBusyDetailsState();
}

class _VehicleFreeBusyDetailsState extends State<VehicleFreeBusyDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        padding: EdgeInsets.all(dp20),
        child: ListView(
          children: [
            VehicleFreeBusyItem(
              status: ChipStatus.BUSY,
              showButton: false,
            ),
            VSpacer10(),
            Text(
              "Vehicle Info",
              style: GoogleFonts.manrope(
                color: darkText,
                fontWeight: FontWeight.w600,
              ),
            ),
            VSpacer10(),
            Card(
              elevation: 0,
              margin: EdgeInsets.only(bottom: dp20),
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: greyBorder,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    dp5,
                  ),
                ),
              ),
              child: Container(
                padding: EdgeInsets.all(dp10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      "https://images.unsplash.com/photo-1494976388531-d1058494cdd8",
                      height: 150,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    VSpacer20(),
                    TextFieldHeadline(headline: "Vehicle capacity"),
                    VSpacer10(),
                    TextFieldValueWidget(headline: "12 Person"),
                    VSpacer20(),
                    TextFieldHeadline(headline: "Driver name"),
                    VSpacer10(),
                    TextFieldValueWidget(headline: "Violet Norman"),
                    VSpacer20(),
                    TextFieldHeadline(headline: "Driver phone"),
                    VSpacer10(),
                    TextFieldValueWidget(headline: "+0123 456 789"),
                    VSpacer20(),
                    TextFieldHeadline(headline: "Request date"),
                    VSpacer10(),
                    TextFieldValueWidget(headline: "19 June, 2021"),
                    VSpacer20(),
                    TextFieldHeadline(headline: "Request pending duration"),
                    VSpacer10(),
                    TextFieldValueWidget(headline: "N/A"),
                    VSpacer20(),
                    TextFieldHeadline(headline: "Driver license number"),
                    VSpacer10(),
                    TextFieldValueWidget(headline: "896842424"),
                    VSpacer20(),
                    TextFieldHeadline(headline: "Attendant name"),
                    VSpacer10(),
                    TextFieldValueWidget(headline: "Jhon Doe"),
                    VSpacer20(),
                    TextFieldHeadline(headline: "Attendant phone"),
                    VSpacer10(),
                    TextFieldValueWidget(headline: "+9869878921312"),
                    VSpacer20(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
