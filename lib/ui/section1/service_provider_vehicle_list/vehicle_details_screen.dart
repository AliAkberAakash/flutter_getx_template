import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_share/data/models/vehicles/vehicle_list_response.dart';
import 'package:go_share/ui/common_widgets/outlined_material_button.dart';
import 'package:go_share/ui/common_widgets/text_field_headline.dart';
import 'package:go_share/ui/common_widgets/text_field_value_widget.dart';
import 'package:go_share/ui/section1/service_provider_vehicle_list/widgets/status_chip.dart';
import 'package:go_share/ui/section1/service_provider_vehicle_list/widgets/vehicle_request_item.dart';
import 'package:go_share/ui/section1/update_vehicle/update_vehicle_screen.dart';
import 'package:go_share/utils/colors.dart';
import 'package:go_share/utils/date_time_utils.dart';
import 'package:go_share/utils/dimens.dart';
import 'package:go_share/utils/spacers.dart';
import 'package:go_share/utils/string_utils.dart';
import 'package:google_fonts/google_fonts.dart';

import 'service_provider_vehicle_list_controller.dart';

class VehicleDetailsScreen extends StatefulWidget {

  final Vehicle vehicle;

  const VehicleDetailsScreen({required this.vehicle});

  @override
  _VehicleDetailsScreenState createState() => _VehicleDetailsScreenState(vehicle);
}

class _VehicleDetailsScreenState extends State<VehicleDetailsScreen> {

  final Vehicle vehicle;
  ServiceProviderVehicleListController _controller = Get.find();


  _VehicleDetailsScreenState(this.vehicle);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        padding: EdgeInsets.all(dp20),
        child: ListView(
          children: [
            VehicleRequestItem(
              vehicle: vehicle,
              status: getStatus(vehicle.status),
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
                    CachedNetworkImage(
                      imageUrl: getImagePath(vehicle.image),
                      height: 150,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    VSpacer20(),
                    TextFieldHeadline(headline: "Vehicle Capacity"),
                    VSpacer10(),
                    TextFieldValueWidget(headline: vehicle.capacity),
                    VSpacer20(),
                    TextFieldHeadline(headline: "Driver Name"),
                    VSpacer10(),
                    TextFieldValueWidget(headline: vehicle.driverName),
                    VSpacer20(),
                    TextFieldHeadline(headline: "Driver phone"),
                    VSpacer10(),
                    TextFieldValueWidget(headline: vehicle.driverPhone),
                    VSpacer20(),
                    TextFieldHeadline(headline: "Request Date"),
                    VSpacer10(),
                    TextFieldValueWidget(headline: speakDate(vehicle.createdAt)),
                    VSpacer20(),
                    TextFieldHeadline(headline: "Request Pending Duration"),
                    VSpacer10(),
                    TextFieldValueWidget(headline: daysBetween(vehicle.createdAt)),
                    VSpacer20(),
                    TextFieldHeadline(headline: "Driver License number"),
                    VSpacer10(),
                    TextFieldValueWidget(headline: vehicle.driverLicenseNumber),
                    VSpacer20(),
                    TextFieldHeadline(headline: "Attendant Name"),
                    VSpacer10(),
                    TextFieldValueWidget(headline: vehicle.attendantName),
                    VSpacer20(),
                    TextFieldHeadline(headline: "Attendant Phone"),
                    VSpacer10(),
                    TextFieldValueWidget(headline: vehicle.attendantPhone),
                    VSpacer20(),
                    TextFieldHeadline(headline: "Attendant NRIC"),
                    VSpacer10(),
                    TextFieldValueWidget(headline: vehicle.attendantNric),
                    VSpacer20(),
                    TextFieldHeadline(headline: "Attendant DOB"),
                    VSpacer10(),
                    TextFieldValueWidget(headline: speakDate(vehicle.attendantDob)),
                    VSpacer40(),
                    OutlinedMaterialButton(
                      color: grey,
                      onClick: () {
                        Get.to(() => UpdateVehicleScreen(vehicle: vehicle,))?.then((value){
                          _controller.getVehicleList();
                        });
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

  getStatus(int status){
    return status==0 ? ChipStatus.PENDING : ChipStatus.APPROVED;
  }

}
