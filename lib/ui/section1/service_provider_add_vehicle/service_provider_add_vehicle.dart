import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_share/data/models/vehicles/add_vehicle_request.dart';
import 'package:go_share/ui/common_widgets/common_loading_dialog.dart';
import 'package:go_share/ui/common_widgets/common_text_field.dart';
import 'package:go_share/ui/common_widgets/large_headline_widget.dart';
import 'package:go_share/ui/common_widgets/positive_button.dart';
import 'package:go_share/ui/common_widgets/text_field_headline.dart';
import 'package:go_share/ui/section4/pending_bottom_sheet/pending_bottom_sheet.dart';
import 'package:go_share/util/lib/toast.dart';
import 'package:go_share/utils/colors.dart';
import 'package:go_share/utils/dimens.dart';
import 'package:go_share/utils/spacers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import 'service_provider_add_vehicle_controller.dart';

class ServiceProviderAddVehicleScreen extends StatefulWidget {
  const ServiceProviderAddVehicleScreen({Key? key}) : super(key: key);

  @override
  _ServiceProviderAddVehicleScreenState createState() => _ServiceProviderAddVehicleScreenState();
}

class _ServiceProviderAddVehicleScreenState extends State<ServiceProviderAddVehicleScreen> {
  var mainWidth;
  var maxLines = 3;
  bool isChecked = false;

  final _controller = ServiceProviderAddVehicleController();

  var vehicleNumberController = TextEditingController();
  var vehicleCapacityController = TextEditingController();
  var driverNameController = TextEditingController();
  var driverLicenseNumberController = TextEditingController();
  var driverLicenseValidityController = TextEditingController();
  var driverPhoneController = TextEditingController();
  var attendantNamePositionController = TextEditingController();
  var attendantPhonePositionController = TextEditingController();
  var attendantNRICPositionController = TextEditingController();
  var attendantDOBController = TextEditingController();

  File? _image;

  final picker = ImagePicker();

  void _getImage() async {
    XFile? imageFile = await picker.pickImage(source: ImageSource.gallery);
    if (imageFile == null) return;
    File tmpFile = File(imageFile.path);
    setState(() {
      _image = tmpFile;
    });
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
            LargeHeadlineWidget(headline: 'Add your vehicle'),
            VSpacer40(),
            TextFieldHeadline(headline: 'Vehicle Image'),
            VSpacer20(),
            _captureImage(),
            VSpacer40(),
            TextFieldHeadline(headline: 'Vehicle Number'),
            VSpacer10(),
            CommonTextField(
              controller: vehicleNumberController,
              type: TextInputType.number,
            ),
            VSpacer40(),
           /* TextFieldHeadline(headline: 'Service Provider ID'),
            VSpacer10(),
            CommonTextField(controller: serviceProviderIdController),
            VSpacer40(),
            TextFieldHeadline(headline: 'Password'),
            VSpacer10(),
            CommonTextField(controller: passwordController),
            VSpacer40(),*/
            TextFieldHeadline(headline: 'Vehicle Capacity',),
            VSpacer10(),
            CommonTextField(
              controller: vehicleCapacityController,
              type: TextInputType.number,
            ),
            VSpacer40(),
            TextFieldHeadline(headline: 'Driver Name'),
            VSpacer10(),
            CommonTextField(controller: driverNameController),
            VSpacer40(),
            TextFieldHeadline(headline: 'Driver License Number'),
            VSpacer10(),
            CommonTextField(
              controller: driverLicenseNumberController,
              type: TextInputType.number,
            ),
            VSpacer40(),
            TextFieldHeadline(headline: 'Driver License Issue Date'),
            VSpacer10(),
            _datePicker(driverLicenseValidityController, "Driver License Validity"),
            VSpacer40(),
            TextFieldHeadline(headline: 'Driver Phone Number'),
            VSpacer10(),
            CommonTextField(
              controller: driverPhoneController,
              type: TextInputType.phone,
            ),
            VSpacer40(),
            /*TextFieldHeadline(headline: 'Contact Person Position'),
            VSpacer10(),
            CommonTextField(controller: contactPersonPositionController),
            VSpacer40(),*/
            TextFieldHeadline(headline: 'Attendant Name'),
            VSpacer10(),
            CommonTextField(controller: attendantNamePositionController),
            VSpacer40(),
            TextFieldHeadline(headline: 'Attendant Phone'),
            VSpacer10(),
            CommonTextField(controller: attendantPhonePositionController),
            VSpacer40(),
            TextFieldHeadline(headline: 'Attendant NRIC'),
            VSpacer10(),
            CommonTextField(controller: attendantNRICPositionController),
            VSpacer40(),
            TextFieldHeadline(headline: 'Attendant DOB'),
            VSpacer10(),
            _datePicker(attendantDOBController, "Attendant DOB"),
            VSpacer40(),
            _agreeToTerms(),
            VSpacer20(),
            PositiveButton(text: "Submit", onClicked: () {
              showLoader();
              var request = AddVehicleRequest(
                vehicleNumber: vehicleNumberController.text,
                capacity: int.parse(vehicleCapacityController.text),
                driverName: driverNameController.text,
                driverLicenseNumber: driverLicenseNumberController.text,
                driverPhone: driverPhoneController.text,
                attendantName: attendantNamePositionController.text,
                attendantPhone: attendantPhonePositionController.text,
                driverLicenseValidity: driverLicenseValidityController.text,
                attendantNric: attendantNRICPositionController.text,
                attendantDob: attendantDOBController.text,
              );
              addVehicle(request);
            }),
            VSpacer40(),
          ],
        ),
      ),
    );
  }

  DateTime selectedDate = DateTime.now();

  _selectDate(BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        builder: (ctx, child){
          return Theme(
            data: ThemeData.light().copyWith(
              colorScheme: ColorScheme.light(primary: accent),
            ),
            child: child!,
          );
        },
        firstDate: DateTime(1950),
        lastDate: DateTime(2201)
    );
    setState(() {
      controller.text=formatDate(picked!);
      selectedDate = picked!;
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

  addVehicle(AddVehicleRequest request) async{
    if(_image!=null){
      if(isChecked){
        var response = await _controller.addVehicle(request, _image!);
        Get.back();
        if(response.data!=null){
          modalBottomSheetMenuPending(context);
        }else{
          ToastUtil.show("Failed to add vehicle");
        }
      }else{
        Get.back();
        ToastUtil.show("Please accept Terms & Conditions");
      }
    }else{
      Get.back();
      ToastUtil.show("Please Select Image");
    }

  }

  _captureImage() => Row(
        children: [
          _image != null
              ? CircleAvatar(
                  radius: dp35,
                  backgroundImage: Image.file(_image!, fit: BoxFit.cover).image,
                )
              : CircleAvatar(
                  radius: dp35,
                  backgroundColor: grey,
                ),
          HSpacer40(),
          TextButton(
            onPressed: () => _getImage(),
            child: Container(
              height: dp40,
              width: dp120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(dp10),
                border: Border.all(
                  color: accent,
                ),
              ),
              child: Center(
                child: Text(
                  'Upload Image',
                  style: TextStyle(color: accent),
                ),
              ),
            ),
          ),
        ],
      );

  _agreeToTerms() => Row(
        children: [
          Checkbox(
              fillColor: MaterialStateProperty.all(accent),
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value!;
                });
              }),
          Text(
            'I agree to terms & conditions',
            style: TextStyle(fontSize: dp15, color: grey),
          ),
        ],
      );
}
