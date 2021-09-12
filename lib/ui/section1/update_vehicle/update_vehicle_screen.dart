import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_share/data/models/vehicles/update_vehicle_details_request.dart';
import 'package:go_share/data/models/vehicles/vehicle_list_response.dart';
import 'package:go_share/ui/common_widgets/common_loading_dialog.dart';
import 'package:go_share/ui/common_widgets/common_text_field.dart';
import 'package:go_share/ui/common_widgets/large_headline_widget.dart';
import 'package:go_share/ui/common_widgets/positive_button.dart';
import 'package:go_share/ui/common_widgets/text_field_headline.dart';
import 'package:go_share/ui/container/UIConstants/Colors.dart';
import 'package:go_share/ui/section1/update_vehicle/update_vehicle_details_controller.dart';
import 'package:go_share/ui/section4/widgets/pending_button.dart';
import 'package:go_share/util/lib/toast.dart';
import 'package:go_share/utils/colors.dart';
import 'package:go_share/utils/constants.dart';
import 'package:go_share/utils/dimens.dart';
import 'package:go_share/utils/spacers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../../constants.dart';

class UpdateVehicleScreen extends StatefulWidget {

  final Vehicle vehicle;

  const UpdateVehicleScreen({Key? key, required this.vehicle}) : super(key: key);

  @override
  _UpdateVehicleScreenState createState() => _UpdateVehicleScreenState(vehicle);
}

class _UpdateVehicleScreenState extends State<UpdateVehicleScreen> {

  final Vehicle vehicle;

  var mainWidth;
  var maxLines = 3;

  File? _image;
  final picker = ImagePicker();

  final _controller = UpdateVehicleDetailsController();

  var driverNameController = TextEditingController();
  var driverLicenseNumberController = TextEditingController();
  var driverLicenseValidityController = TextEditingController();
  var driverPhoneController = TextEditingController();
  var attendantNamePositionController = TextEditingController();
  var attendantPhonePositionController = TextEditingController();
  var attendantNRICPositionController = TextEditingController();
  var attendantDOBController = TextEditingController();

  _UpdateVehicleScreenState(this.vehicle);

  void _getImage() async {
    XFile? imageFile = await picker.pickImage(source: ImageSource.gallery);
    if (imageFile == null) return;
    File tmpFile = File(imageFile.path);
    setState(() {
      _image = tmpFile;
    });
  }

  @override
  void initState() {
    driverNameController.text = vehicle.driverName;
    driverLicenseNumberController.text = vehicle.driverLicenseNumber;
    driverLicenseValidityController.text = formatDate(vehicle.driverLicenseValidity);
    driverPhoneController.text = vehicle.driverPhone;
    attendantNamePositionController.text = vehicle.attendantName;
    attendantPhonePositionController.text = vehicle.attendantPhone;
    attendantNRICPositionController.text = vehicle.attendantNric;
    attendantDOBController.text = formatDate(vehicle.attendantDob);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mainWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: ListView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(dp20),
          children: [
            LargeHeadlineWidget(headline: 'Update your vehicle'),
            VSpacer40(),
            TextFieldHeadline(headline: 'Vehicle image'),
            VSpacer20(),
            _capTureImage(vehicle.image),
            VSpacer40(),
            /*TextFieldHeadline(headline: 'Vehicle number'),
            VSpacer10(),
            CommonTextField(controller: TextEditingController()),
            VSpacer40(),
            TextFieldHeadline(headline: 'Vaeicle capacity'),
            VSpacer10(),
            CommonTextField(controller: TextEditingController()),
            VSpacer40(),*/
            TextFieldHeadline(headline: 'Driver name'),
            VSpacer10(),
            CommonTextField(controller: driverNameController),
            VSpacer40(),
            TextFieldHeadline(headline: 'Driver license number'),
            VSpacer10(),
            CommonTextField(
              controller: driverLicenseNumberController,
              type: TextInputType.number,
            ),
            VSpacer40(),
            TextFieldHeadline(headline: 'Driver License Validity'),
            VSpacer10(),
            _datePicker(driverLicenseValidityController, "Driver License Validity"),
            VSpacer40(),
            TextFieldHeadline(headline: 'Driver phone number'),
            VSpacer10(),
            CommonTextField(
              controller: driverPhoneController,
              type: TextInputType.phone,
            ),
            VSpacer40(),
            TextFieldHeadline(headline: 'Attendant name'),
            VSpacer10(),
            CommonTextField(controller: attendantNamePositionController),
            VSpacer40(),
            TextFieldHeadline(headline: 'Attendant phone'),
            VSpacer10(),
            CommonTextField(
              controller: attendantPhonePositionController,
              type: TextInputType.phone,
            ),
            VSpacer40(),
            TextFieldHeadline(headline: 'Attendant NRIC'),
            VSpacer10(),
            CommonTextField(
              controller: attendantNRICPositionController,
              type: TextInputType.number,
            ),
            VSpacer40(),
            TextFieldHeadline(headline: 'Attendant DOB'),
            VSpacer10(),
            _datePicker(attendantDOBController, "Attendant DOB"),
            VSpacer40(),
            PositiveButton(text: "Update", onClicked: () {

              showLoader();
              var request = UpdateVehicleDetailsRequest(
                driverName: driverNameController.text,
                driverLicenseNumber: driverLicenseNumberController.text,
                driverPhone: driverPhoneController.text,
                attendantName: attendantNamePositionController.text,
                attendantPhone: attendantPhonePositionController.text,
                driverLicenseValidity: driverLicenseValidityController.text,
                attendantNric: attendantNRICPositionController.text,
                attendantDob: attendantDOBController.text,
                id: vehicle.id,
              );
              updateVehicleDetails(request);

              //modalBottomSheetMenuPending(context);
            }),
          ],
        ),
      ),
    );
  }

  updateVehicleDetails(UpdateVehicleDetailsRequest request) async{
    var response = await _controller.updateVehicleDetails(request, _image);

    Get.back();
    if(response.data != null){
      modalBottomSheetMenuPending(context);
    }

    ToastUtil.show(response.msg);

  }

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        builder: (ctx, child){
          return Theme(
            data: ThemeData.light().copyWith(
              colorScheme: ColorScheme.light(primary: accent),
              // buttonTheme: ButtonThemeData(
              //     textTheme: acce
              // ),
            ),
            child: child!,
          );
        },
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101)
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        controller.text=formatDate(selectedDate);
        selectedDate = picked;
      });
  }

  String formatDate(DateTime date){
    var outputFormat = DateFormat('yyyy-MM-dd');
    return outputFormat.format(date);
  }

  _datePicker(TextEditingController controller, String hint){
    return TextField(
      readOnly: true,
      controller: controller,
      style: TextStyle(
        color: darkText,
        fontSize: dp18,
        fontWeight: FontWeight.bold,
      ),
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: (){
            _selectDate(context, controller);
          },
          icon: Icon(
            Icons.date_range,
            color: accent,
          ),
        ),
        contentPadding: EdgeInsets.only(left: 10),
        hintText: hint,
        hintStyle: GoogleFonts.manrope(
            color: light_grey,
            fontSize: 14
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(dp10),
          borderSide: BorderSide(color: grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(dp10),
          borderSide: BorderSide(color: accent),
        ),
      ),
      cursorColor: accent,
    );
  }

  void modalBottomSheetMenuPending(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (builder) {
          return new Container(
            height: 450.0,
            color: Color(0xFF737373), //could change this to Color(0xFF737373),
            //so you don't have to change MaterialApp canvasColor
            child: new Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(20.0),
                        topRight: const Radius.circular(20.0))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SvgPicture.asset(
                      AssetConstants.pendingIcon,
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            "Pending",
                            style: GoogleFonts.manrope(
                              color: colorPending,
                              fontSize: dp25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            "Your charity program has been successfully created.\n Now you can check and maintain in your\n'activity' menu.",
                            style: GoogleFonts.manrope(
                              color: GSColors.text_secondary,
                              fontSize: dp14,
                              fontWeight: FontWeight.normal,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: PendingButton(
                        text: "My Vehicle List",
                        onClick: () {
                          Get.back();
                          Get.back();
                          Get.back();
                        },
                      ),
                    ),
                  ],
                )),
          );
        });
  }

  _capTureImage(String imageUrl) => Row(
        children: [
          _image != null
              ? CircleAvatar(
                  radius: dp35,
                  backgroundImage: Image.file(_image!, fit: BoxFit.cover).image,
                )
              : ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(dp100),
            ),
            child: CachedNetworkImage(
              height: dp70,
              width: dp70,
              imageUrl: imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          HSpacer20(),
          TextButton(
            onPressed: () => _getImage(),
            child: Container(
              height: dp40,
              width: dp140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(dp10),
                border: Border.all(
                  color: accent,
                ),
              ),
              child: Center(
                child: Text(
                  'Re-Upload Image',
                  style: TextStyle(color: accent),
                ),
              ),
            ),
          ),
        ],
      );
}
