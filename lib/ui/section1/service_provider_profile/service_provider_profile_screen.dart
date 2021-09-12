import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_share/core/ui/error_screen.dart';
import 'package:go_share/core/ui/loading_widget.dart';
import 'package:go_share/data/models/service_partner/profile/service_partner_profile_response.dart';
import 'package:go_share/ui/common_widgets/profile_picture_widget.dart';
import 'package:go_share/ui/common_widgets/text_field_headline.dart';
import 'package:go_share/ui/common_widgets/text_field_value_widget.dart';
import 'package:go_share/ui/common_widgets/update_button.dart';
import 'package:go_share/ui/section1/Service_partner_profile_update/service_partner_profile_update_screen.dart';
import 'package:go_share/ui/section1/service_provider_profile/service_provider_profile_controller.dart';
import 'package:go_share/utils/constants.dart';
import 'package:go_share/utils/dimens.dart';
import 'package:go_share/utils/spacers.dart';

class ServiceProviderProfileScreen extends StatefulWidget {
  const ServiceProviderProfileScreen({Key? key}) : super(key: key);

  @override
  _ServiceProviderProfileScreenState createState() =>
      _ServiceProviderProfileScreenState();
}

class _ServiceProviderProfileScreenState
    extends State<ServiceProviderProfileScreen> {

  final ServiceProviderProfileController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx((){
      var response = _controller.profileResponse.value;

      if(response==null){
        return LoadingWidget();
      }else{
        if(response.data==null) {
          return ErrorScreen();
        }
        else {

          var data = response.data;

          return Scaffold(
            body: SafeArea(
              child: ListView(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.all(dp20),
                children: [
                  _getLeading(data),
                  VSpacer40(),
                  Divider(),
                  VSpacer40(),
                  TextFieldHeadline(headline: 'Phone Number'),
                  VSpacer5(),
                  TextFieldValueWidget(headline: data?.phone ?? ""),
                  VSpacer20(),
                  TextFieldHeadline(headline: 'Address'),
                  VSpacer5(),
                  TextFieldValueWidget(headline: data?.address ?? "",),
                  VSpacer20(),
                  TextFieldHeadline(headline: 'Contact Person name'),
                  VSpacer5(),
                  TextFieldValueWidget(headline: data?.contactPersonName ?? ""),
                  VSpacer20(),
                  TextFieldHeadline(headline: 'Contact Person Position'),
                  VSpacer5(),
                  TextFieldValueWidget(headline: data?.contactPersonPosition ?? ""),
                  VSpacer20(),
                  TextFieldHeadline(headline: 'Contact Person Phone'),
                  VSpacer5(),
                  TextFieldValueWidget(headline: data?.contactPersonPhone ?? ""),
                  VSpacer20(),
                  TextFieldHeadline(headline: 'NRIC'),
                  VSpacer5(),
                  TextFieldValueWidget(headline: data?.contactPersonNric ?? ""),
                  VSpacer20(),
                  TextFieldHeadline(headline: 'Business identification number'),
                  VSpacer5(),
                  TextFieldValueWidget(headline: data?.businessIdentificationNumber ?? ""),
                  VSpacer40(),
                  UpdateButton(text: 'Update My Profile', onClicked: () {
                    Get.to(ServicePartnerProfileUpdateScreen(
                      profileResponse: _controller.profileResponse.value!,
                    ));
                  }),
                  VSpacer60(),
                ],
              ),
            ),
          );
        }
      }

    });
  }

  _getLeading(Data? data){
    return Row(
      children: [
        ProfilePictureWidget(imgUrl: NetworkConstants.BASE_URL+"/"+(data?.image ?? "")),
        SizedBox(width: dp15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFieldValueWidget(headline: data?.name ?? ""),
            VSpacer5(),
            TextFieldHeadline(headline: data?.email ?? ""),
          ],
        ),
      ],
    );
  }
}
