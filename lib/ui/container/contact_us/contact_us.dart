import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_share/base/widget/custom_filled_button.dart';
import 'package:go_share/base/widget/custom_text_form_field.dart';
import 'package:go_share/ui/container/UIConstants/Colors.dart';
import 'package:go_share/ui/container/UIConstants/GSWidgetStyles.dart';
import 'package:go_share/ui/container/UIConstants/Strings.dart';

class ContactUsView extends StatefulWidget {
  const ContactUsView({Key? key}) : super(key: key);

  @override
  _ContactUsViewState createState() => _ContactUsViewState();
}

class _ContactUsViewState extends State<ContactUsView> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleWidget(),
            Expanded(
              child: FormListWidget(),
            ),
            CustomFilledButton(
              margin: const EdgeInsets.only(
                left: 30.0,
                right: 30.0,
                top: 32.0,
                bottom: 16.0,
              ),
              borderRadius: 8.0,
              backgroundColor: GSColors.green_secondary,
              textColor: Colors.white,
              title: GSStrings.submit,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 275.0,
      width: double.maxFinite,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("images/ic_background_two.png"),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 32.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                GSStrings.contact_us_title,
                textAlign: TextAlign.start,
                style: GSTextStyles.make40xw900Style(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  GSStrings.contact_us_subtitle,
                  textAlign: TextAlign.start,
                  style: GSTextStyles.make18xw400Style(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FormListWidget extends StatefulWidget {
  const FormListWidget({Key? key}) : super(key: key);

  @override
  _FormListWidgetState createState() => _FormListWidgetState();
}

class _FormListWidgetState extends State<FormListWidget> {
  late TextEditingController fullNameController;
  late TextEditingController phoneNumberController;
  late TextEditingController emailController;
  late TextEditingController addressController;
  late TextEditingController websiteUrlController;
  late TextEditingController feedbackController;

  @override
  void initState() {
    super.initState();

    fullNameController = TextEditingController();
    phoneNumberController = TextEditingController();
    emailController = TextEditingController();
    addressController = TextEditingController();
    websiteUrlController = TextEditingController();
    feedbackController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();

    fullNameController.dispose();
    phoneNumberController.dispose();
    emailController.dispose();
    addressController.dispose();
    websiteUrlController.dispose();
    feedbackController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(
                left: 30.0,
                right: 30.0,
                top: 20.0,
              ),
              width: double.maxFinite,
              child: Text(
                GSStrings.contact_us_company_information,
                style: GSTextStyles.make28xw800Style(
                  color: GSColors.text_bold,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            CustomTextFormField(
              formController: fullNameController,
              inputType: TextInputType.name,
              hint: GSStrings.contact_us_full_name,
            ),
            CustomTextFormField(
              formController: phoneNumberController,
              inputType: TextInputType.phone,
              hint: GSStrings.contact_us_phone_number,
            ),
            CustomTextFormField(
              formController: emailController,
              inputType: TextInputType.emailAddress,
              hint: GSStrings.contact_us_email_address,
            ),
            CustomTextFormField(
              formController: addressController,
              inputType: TextInputType.streetAddress,
              hint: GSStrings.contact_us_address,
              isRequiredField: false,
            ),
            CustomTextFormField(
              formController: websiteUrlController,
              inputType: TextInputType.url,
              hint: GSStrings.contact_us_website_url,
              isRequiredField: false,
            ),
            CustomTextFormField(
              formController: feedbackController,
              inputType: TextInputType.text,
              hint: GSStrings.contact_us_your_feedback,
              isFieldExpanded: true,
            ),
          ],
        ),
      ),
    );
  }
}
