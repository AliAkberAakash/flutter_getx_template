import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:get/get.dart';
import 'package:go_share/core/ui/error_screen.dart';
import 'package:go_share/core/ui/loading_widget.dart';
import 'package:go_share/ui/common_widgets/outlined_material_button.dart';
import 'package:go_share/ui/common_widgets/text_field_headline.dart';
import 'package:go_share/ui/common_widgets/text_field_value_widget.dart';
import 'package:go_share/ui/not_logged_in_welcome/profile/profile_screen_controller.dart';
import 'package:go_share/utils/colors.dart';
import 'package:go_share/utils/dimens.dart';
import 'package:go_share/utils/spacers.dart';
import 'package:google_fonts/google_fonts.dart';

import '../edit_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  
  final _controller = ProfileScreenController();
  
  @override
  void initState() {
    _controller.getGeneralUserProfile();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Obx((){
      
      var response = _controller.profileState.value;
      if(response==null){
        return LoadingWidget();
      }else {
        if (response.data == null) {
          return ErrorScreen();
        }else return ListView(
          padding: EdgeInsets.all(dp20),
          children: [
            VSpacer20(),
            VSpacer20(),
            Row(
              children: [
                CircleAvatar(
                  radius: dp30,
                  backgroundImage: NetworkImage(
                    "https://images.unsplash.com/photo-1563306406-e66174fa3787",
                  ),
                ),
                HSpacer20(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Violet Norman",
                      style: GoogleFonts.manrope(
                        color: darkText,
                        fontWeight: FontWeight.bold,
                        fontSize: dp16,
                      ),
                    ),
                    Text(
                      "bayer_martin@yahoo.com",
                      style: GoogleFonts.manrope(),
                    ),
                  ],
                ),
              ],
            ),
            VSpacer40(),
            Container(
              height: 1,
              width: double.maxFinite,
              color: light_grey,
            ),
            VSpacer40(),
            TextFieldHeadline(headline: "Phone Number"),
            VSpacer10(),
            TextFieldValueWidget(headline: '+907079097213'),
            VSpacer20(),
            TextFieldHeadline(headline: "Address"),
            VSpacer10(),
            TextFieldValueWidget(headline: 'Block 372 Bukit Batok Street 31 #01-372, 650372 Singapore'),
            VSpacer20(),
            TextFieldHeadline(headline: "NRIC"),
            VSpacer10(),
            TextFieldValueWidget(headline: 'N/A'),
            VSpacer20(),
            TextFieldHeadline(headline: "Date of Birth"),
            VSpacer10(),
            TextFieldValueWidget(headline: '19 May, 1971'),
            VSpacer20(),
            TextFieldHeadline(headline: "Caretaker Info"),
            VSpacer10(),
            Row(
              children: [
                CircleAvatar(
                  radius: dp30,
                  backgroundImage: NetworkImage(
                    "https://images.unsplash.com/photo-1591258739299-5b65d5cbb235",
                  ),
                ),
                HSpacer20(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "John Doe",
                      style: GoogleFonts.manrope(
                        color: darkText,
                        fontWeight: FontWeight.bold,
                        fontSize: dp16,
                      ),
                    ),
                    Text(
                      "+907079097213",
                      style: GoogleFonts.manrope(),
                    ),
                  ],
                ),
              ],
            ),
            VSpacer20(),
            OutlinedMaterialButton(onClick: (){
              Get.to(EditProfileScreen());
            }, text: "Update My Profile"),
          ],
        );
      }
    });
  }
}
