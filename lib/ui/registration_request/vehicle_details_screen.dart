import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_share/ui/common_widgets/outlined_material_button.dart';
import 'package:go_share/ui/common_widgets/text_field_headline.dart';
import 'package:go_share/ui/common_widgets/text_field_value_widget.dart';
import 'package:go_share/ui/registration_request/widgets/status_chip.dart';
import 'package:go_share/ui/registration_request/widgets/vehicle_request_item.dart';
import 'package:go_share/ui/update_vehicle/update_vehicle_screen.dart';
import 'package:go_share/utils/colors.dart';
import 'package:go_share/utils/dimens.dart';
import 'package:go_share/utils/spacers.dart';
import 'package:google_fonts/google_fonts.dart';

class VehicleDetailsScreen extends StatefulWidget {
  const VehicleDetailsScreen();

  @override
  _VehicleDetailsScreenState createState() => _VehicleDetailsScreenState();
}

class _VehicleDetailsScreenState extends State<VehicleDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        padding: EdgeInsets.all(dp20),
        child: ListView(
          children: [
            VehicleRequestItem(
              status: ChipStatus.PENDING,
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
                    TextFieldHeadline(headline: "Vehicle Capacity"),
                    VSpacer10(),
                    TextFieldValueWidget(headline: "12 Person"),
                    VSpacer20(),
                    TextFieldHeadline(headline: "Driver Name"),
                    VSpacer10(),
                    TextFieldValueWidget(headline: "Violet Norman"),
                    VSpacer20(),
                    TextFieldHeadline(headline: "Driver phone"),
                    VSpacer10(),
                    TextFieldValueWidget(headline: "+0123 456 789"),
                    VSpacer20(),
                    TextFieldHeadline(headline: "Request Date"),
                    VSpacer10(),
                    TextFieldValueWidget(headline: "19 June, 2021"),
                    VSpacer20(),
                    TextFieldHeadline(headline: "Request Pending Duration"),
                    VSpacer10(),
                    TextFieldValueWidget(headline: "N/A"),
                    VSpacer20(),
                    TextFieldHeadline(headline: "Driver License number"),
                    VSpacer10(),
                    TextFieldValueWidget(headline: "8645241"),
                    VSpacer20(),
                    TextFieldHeadline(headline: "Attendant Name"),
                    VSpacer10(),
                    TextFieldValueWidget(headline: "John Doe"),
                    VSpacer20(),
                    TextFieldHeadline(headline: "Attendant number"),
                    VSpacer10(),
                    TextFieldValueWidget(headline: "+242267682"),
                    VSpacer40(),
                    OutlinedMaterialButton(
                      color: grey,
                      onClick: () {
                        Get.to(() => UpdateVehicleScreen());
                      },
                      text: "Update vehicle details",
                    ),
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
