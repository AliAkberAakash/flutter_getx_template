import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_share/ui/container/UIConstants/Colors.dart';
import 'package:go_share/ui/container/UIConstants/GSWidgetStyles.dart';
import 'package:go_share/ui/container/UIConstants/Strings.dart';

class TermsAndConditionsView extends StatefulWidget {
  const TermsAndConditionsView({Key? key}) : super(key: key);

  @override
  _TermsAndConditionsViewState createState() => _TermsAndConditionsViewState();
}

class _TermsAndConditionsViewState extends State<TermsAndConditionsView> {
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
              child: TermsWidget(),
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
                GSStrings.terms_and_conditions_title,
                textAlign: TextAlign.start,
                style: GSTextStyles.make40xw900Style(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  GSStrings.terms_and_conditions_subtitle,
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

class TermsWidget extends StatefulWidget {
  const TermsWidget({Key? key}) : super(key: key);

  @override
  _TermsWidgetState createState() => _TermsWidgetState();
}

class _TermsWidgetState extends State<TermsWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 30.0,
          vertical: 28.0,
        ),
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Country version: Singapore",
              style: GSTextStyles.make14xw600Style(
                color: GSColors.green_secondary,
              ),
              textAlign: TextAlign.start,
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 4.0,
                bottom: 18.0,
              ),
              child: Text(
                "We know it’s tempting to skip these Terms of Service, but it’s important.",
                style: GSTextStyles.make24xw900Style(),
                textAlign: TextAlign.start,
              ),
            ),
            Text(
              "Your charity program has been successfully created. Now you can check and maintain it in your ‘activity’ menu",
              style: GSTextStyles.make12xw400Style(
                color: GSColors.text_light.withOpacity(0.7),
              ),
              textAlign: TextAlign.justify,
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 20.0,
                bottom: 12.0,
              ),
              child: Text(
                "Service provider",
                style: GSTextStyles.make16xw600Style(),
                textAlign: TextAlign.start,
              ),
            ),
            Text(
              "If you’re under the age required to manage your own Google Account, you must have your parent or legal guardian’s permission to use a Google Account. Please have your parent or legal guardian read these terms with you. \n\nIf you’re a parent or legal guardian, and you allow your child to use the services, then these terms apply to you and you’re responsible for your child’s activity on the services. \n\nSome Google services have additional age requirements as described in their service-specific additional terms and policies.",
              style: GSTextStyles.make12xw400Style(
                color: GSColors.text_light.withOpacity(0.7),
              ),
              textAlign: TextAlign.justify,
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 20.0,
                bottom: 12.0,
              ),
              child: Text(
                "Age requirements",
                style: GSTextStyles.make16xw600Style(),
                textAlign: TextAlign.start,
              ),
            ),
            Text(
              "If you’re under the age required to manage your own Google Account, you must have your parent or legal guardian’s permission to use a Google Account. Please have your parent or legal guardian read these terms with you. \n\nIf you’re a parent or legal guardian, and you allow your child to use the services, then these terms apply to you and you’re responsible for your child’s activity on the services. \n\nSome Google services have additional age requirements as described in their service-specific additional terms and policies.",
              style: GSTextStyles.make12xw400Style(
                color: GSColors.text_light.withOpacity(0.7),
              ),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
