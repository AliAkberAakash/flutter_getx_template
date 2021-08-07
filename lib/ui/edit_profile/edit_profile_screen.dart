import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nilam/ui/common_widgets/text_field_headline.dart';
import 'package:nilam/ui/service_provider/widgets/common_text_field.dart';
import 'package:nilam/ui/service_provider/widgets/positive_button.dart';
import 'package:nilam/utils/colors.dart';
import 'package:nilam/utils/dimens.dart';
import 'package:nilam/utils/spacers.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
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
            _captureImage(),
            VSpacer40(),
            TextFieldHeadline(headline: 'Full Name'),
            VSpacer10(),
            CommonTextField(controller: TextEditingController()),
            VSpacer40(),
            TextFieldHeadline(headline: 'Email Address'),
            VSpacer10(),
            CommonTextField(controller: TextEditingController()),
            VSpacer40(),
            TextFieldHeadline(headline: 'Phone Number'),
            VSpacer10(),
            CommonTextField(controller: TextEditingController()),
            VSpacer40(),
            TextFieldHeadline(headline: 'Address'),
            VSpacer10(),
            _getAddress(),
            VSpacer40(),
            TextFieldHeadline(headline: 'Contact Person name'),
            VSpacer10(),
            CommonTextField(controller: TextEditingController()),
            VSpacer40(),
            TextFieldHeadline(headline: 'Contact Person Position'),
            VSpacer10(),
            CommonTextField(controller: TextEditingController()),
            VSpacer40(),
            TextFieldHeadline(headline: 'Contact Person Phone'),
            VSpacer10(),
            CommonTextField(controller: TextEditingController()),
            VSpacer40(),
            TextFieldHeadline(headline: 'NRIC'),
            VSpacer10(),
            CommonTextField(controller: TextEditingController()),
            VSpacer40(),
            TextFieldHeadline(headline: 'Business Identification Number'),
            VSpacer10(),
            CommonTextField(controller: TextEditingController()),
            VSpacer40(),
            PositiveButton(text: "Update Now", onClicked: () {
              Get.back();
            }),
          ],
        ),
      ),
    );
  }

  _captureImage() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
          TextButton(
            onPressed: () => _getImage(),
            child: Container(
              height: dp40,
              width: dp100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(dp10),
                border: Border.all(
                  color: accent,
                ),
              ),
              child: Center(
                child: Text(
                  'Upload Logo',
                  style: TextStyle(color: accent),
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Container(
              height: dp40,
              width: dp80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(dp10),
                border: Border.all(
                  color: grey,
                ),
              ),
              child: Center(
                child: Text(
                  'Remove',
                  style: TextStyle(color: grey),
                ),
              ),
            ),
          ),
        ],
      );

  _getAddress() => TextFormField(
        style: TextStyle(
          color: black,
          fontSize: dp18,
          fontWeight: FontWeight.bold,
        ),
        maxLines: maxLines,
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
      );
}
