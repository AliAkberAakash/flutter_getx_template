import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_share/ui/common_widgets/common_text_field.dart';
import 'package:go_share/ui/common_widgets/positive_button.dart';
import 'package:go_share/ui/common_widgets/text_field_headline.dart';
import 'package:go_share/utils/colors.dart';
import 'package:go_share/utils/date_time_utils.dart';
import 'package:go_share/utils/dimens.dart';
import 'package:go_share/utils/spacers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  var mainWidth;
  var maxLines = 3;

  TextEditingController dateController = TextEditingController();

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
            VSpacer20(),
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
            TextFieldHeadline(headline: 'NRIC'),
            VSpacer10(),
            CommonTextField(controller: TextEditingController()),
            VSpacer40(),
            TextFieldHeadline(headline: 'Date of Birth'),
            VSpacer10(),
            _datePicker(dateController, "Date of Birth", 1),
            VSpacer40(),
            TextFieldHeadline(headline: 'Caretaker Image'),
            VSpacer10(),
            _captureImage(),
            VSpacer40(),
            TextFieldHeadline(headline: 'Caretaker Full Name'),
            VSpacer10(),
            CommonTextField(controller: TextEditingController()),
            VSpacer40(),
            TextFieldHeadline(headline: 'Caretaker Mobile Number'),
            VSpacer10(),
            CommonTextField(controller: TextEditingController()),
            VSpacer40(),
            PositiveButton(text: "Update Now", onClicked: () {
              Get.back();
            }),
            VSpacer40(),
          ],
        ),
      ),
    );
  }

  _datePicker(TextEditingController controller, String hint, int type){
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
            _selectDate(context);
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

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
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
        selectedDate = picked;
        dateController.text = speakDate(selectedDate);
      });
  }

  String formatDate(DateTime date){
    var outputFormat = DateFormat('MM.dd.yyyy');
    return outputFormat.format(date);
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
              'Upload Photo',
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
