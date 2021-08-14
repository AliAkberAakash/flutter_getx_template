import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_share/ui/common_widgets/large_headline_widget.dart';
import 'package:go_share/ui/common_widgets/text_field_headline.dart';
import 'package:go_share/ui/service_provider/widgets/common_text_field.dart';
import 'package:go_share/ui/service_provider/widgets/positive_button.dart';
import 'package:go_share/utils/colors.dart';
import 'package:go_share/utils/dimens.dart';
import 'package:go_share/utils/spacers.dart';
import 'package:image_picker/image_picker.dart';

class AddVehicleScreen extends StatefulWidget {
  const AddVehicleScreen({Key? key}) : super(key: key);

  @override
  _AddVehicleScreenState createState() => _AddVehicleScreenState();
}

class _AddVehicleScreenState extends State<AddVehicleScreen> {
  var mainWidth;
  var maxLines = 3;
  bool isChecked = false;

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
            CommonTextField(controller: TextEditingController()),
            VSpacer40(),
            TextFieldHeadline(headline: 'Vehicle capacity'),
            VSpacer10(),
            CommonTextField(controller: TextEditingController()),
            VSpacer40(),
            TextFieldHeadline(headline: 'Driver Name'),
            VSpacer10(),
            CommonTextField(controller: TextEditingController()),
            VSpacer40(),
            TextFieldHeadline(headline: 'Driver License Number'),
            VSpacer10(),
            CommonTextField(controller: TextEditingController()),
            VSpacer40(),
            TextFieldHeadline(headline: 'Driver Phone Number'),
            VSpacer10(),
            CommonTextField(controller: TextEditingController()),
            VSpacer40(),
            TextFieldHeadline(headline: 'Contact Person Position'),
            VSpacer10(),
            CommonTextField(controller: TextEditingController()),
            VSpacer40(),
            TextFieldHeadline(headline: 'Attendant Name'),
            VSpacer10(),
            CommonTextField(controller: TextEditingController()),
            VSpacer40(),
            TextFieldHeadline(headline: 'Attendant phone'),
            VSpacer10(),
            CommonTextField(controller: TextEditingController()),
            VSpacer40(),
            _agreeToTerms(),
            PositiveButton(text: "Submit", onClicked: () {}),
            VSpacer20(),
          ],
        ),
      ),
    );
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
          HSpacer15(),
          Text(
            'I agree to terms and conditions',
            style: TextStyle(fontSize: dp15, color: grey),
          ),
        ],
      );
}
