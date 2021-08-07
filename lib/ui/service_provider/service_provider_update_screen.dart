import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nilam/ui/common_widgets/text_field_headline.dart';
import 'package:nilam/ui/common_widgets/text_field_value_widget.dart';
import 'package:nilam/ui/edit_profile/edit_profile_screen.dart';
import 'package:nilam/ui/service_provider/widgets/update_button.dart';
import 'package:nilam/utils/colors.dart';
import 'package:nilam/utils/dimens.dart';
import 'package:nilam/utils/spacers.dart';

class ServiceProviderUpdateScreen extends StatefulWidget {
  const ServiceProviderUpdateScreen({Key? key}) : super(key: key);

  @override
  _ServiceProviderUpdateScreenState createState() =>
      _ServiceProviderUpdateScreenState();
}

class _ServiceProviderUpdateScreenState
    extends State<ServiceProviderUpdateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(dp20),
          children: [
            _getLeading(),
            VSpacer40(),
            Divider(),
            VSpacer40(),
            TextFieldHeadline(headline: 'Phone Number'),
            VSpacer5(),
            TextFieldValueWidget(headline: '+907079097213'),
            VSpacer20(),
            TextFieldHeadline(headline: 'Address'),
            VSpacer5(),
            TextFieldValueWidget(
                headline:
                    'Block 372 Bukit Batok Street 31\n#01-372, 550372 Singapore'),
            VSpacer20(),
            TextFieldHeadline(headline: 'Contact Person name'),
            VSpacer5(),
            TextFieldValueWidget(headline: 'Jhon Doe'),
            VSpacer20(),
            TextFieldHeadline(headline: 'Contact Person Position'),
            VSpacer5(),
            TextFieldValueWidget(headline: 'Marketing Manager'),
            VSpacer20(),
            TextFieldHeadline(headline: 'Contact Person Phone'),
            VSpacer5(),
            TextFieldValueWidget(headline: '+869877392423'),
            VSpacer20(),
            TextFieldHeadline(headline: 'NRIC'),
            VSpacer5(),
            TextFieldValueWidget(headline: '877392423'),
            VSpacer20(),
            TextFieldHeadline(headline: 'Business identification number'),
            VSpacer5(),
            TextFieldValueWidget(headline: '21321314'),
            VSpacer40(),
            UpdateButton(text: 'Update My Profile', onClicked: () {
              Get.to(EditProfileScreen());
            }),
            VSpacer60(),
          ],
        ),
      ),
    );
  }

  _getLeading() => Row(
        children: [
          CircleAvatar(
            backgroundColor: grey,
            radius: dp35,
          ),
          SizedBox(width: dp15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFieldValueWidget(headline: 'Macdonald'),
              VSpacer5(),
              TextFieldHeadline(headline: 'Hello@macdonald.com'),
            ],
          ),
        ],
      );
}
