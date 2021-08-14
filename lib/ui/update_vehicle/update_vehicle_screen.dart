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

class UpdateVehicleScreen extends StatefulWidget {
  const UpdateVehicleScreen({Key? key}) : super(key: key);

  @override
  _UpdateVehicleScreenState createState() => _UpdateVehicleScreenState();
}

class _UpdateVehicleScreenState extends State<UpdateVehicleScreen> {
  var mainWidth;
  var maxLines = 3;

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
            LargeHeadlineWidget(headline: 'Update your vehicle'),
            VSpacer40(),
            TextFieldHeadline(headline: 'Vehicle image'),
            VSpacer20(),
            _capTureImage(),
            VSpacer40(),
            TextFieldHeadline(headline: 'Vehicle number'),
            VSpacer10(),
            CommonTextField(controller: TextEditingController()),
            VSpacer40(),
            TextFieldHeadline(headline: 'Vaeicle capacity'),
            VSpacer10(),
            CommonTextField(controller: TextEditingController()),
            VSpacer40(),
            TextFieldHeadline(headline: 'Driver name'),
            VSpacer10(),
            CommonTextField(controller: TextEditingController()),
            VSpacer40(),
            TextFieldHeadline(headline: 'Driver license number'),
            VSpacer10(),
            CommonTextField(controller: TextEditingController()),
            VSpacer40(),
            TextFieldHeadline(headline: 'Driver phone number'),
            VSpacer10(),
            CommonTextField(controller: TextEditingController()),
            VSpacer40(),
            TextFieldHeadline(headline: 'Attendant name'),
            VSpacer10(),
            CommonTextField(controller: TextEditingController()),
            VSpacer40(),
            TextFieldHeadline(headline: 'Attendant phone'),
            VSpacer10(),
            CommonTextField(controller: TextEditingController()),
            VSpacer40(),
            PositiveButton(text: "Update", onClicked: () {}),
          ],
        ),
      ),
    );
  }

  _capTureImage() => Row(
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
