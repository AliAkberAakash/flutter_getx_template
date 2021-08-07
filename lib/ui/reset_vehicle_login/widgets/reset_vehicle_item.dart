import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nilam/ui/common_widgets/outlined_material_button.dart';
import 'package:nilam/ui/registration_request/widgets/status_chip.dart';
import 'package:nilam/ui/registration_request/widgets/vehicle_info_widget.dart';
import 'package:nilam/utils/colors.dart';
import 'package:nilam/utils/dimens.dart';
import 'package:nilam/utils/spacers.dart';

class ResetVehicleItem extends StatelessWidget {

  final ChipStatus status;
  final bool showButton;

  const ResetVehicleItem({
    Key? key,
    required this.status,
    this.showButton = true
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(dp15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Vehicle Number",
                      style: GoogleFonts.manrope(
                        color: darkText,
                      ),
                    ),
                    Text(
                      "VA 07097",
                      style: GoogleFonts.manrope(
                        color: darkText,
                        fontSize: dp20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                StatusChip(chipStatus: status)
              ],
            ),
          ),
          Divider(
            color: greyBorder,
            height: 2,
          ),

          Padding(
            padding: EdgeInsets.all(dp15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          VehicleInfoWidget(
                            title: "Vehicle number",
                            value: "VA 112414",
                          ),
                          VSpacer20(),
                          VehicleInfoWidget(
                            title: "Driver name",
                            value: "John Doe",
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                HSpacer60(),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          VehicleInfoWidget(
                            title: "Request date",
                            value: "19 May, 2021",
                          ),
                          VSpacer20(),
                          VehicleInfoWidget(
                            title: "Pending duration",
                            value: "28 hrs",
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),

          showButton ? Padding(
            padding: const EdgeInsets.all(dp20),
            child: OutlinedMaterialButton(
              onClick: () {

              },
              text: "Reset Login",
            ),
          ) : Container(
            height: dp10,
          ),
        ],
      ),
    );
  }
}
