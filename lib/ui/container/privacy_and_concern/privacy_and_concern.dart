import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_share/ui/container/UIConstants/Colors.dart';
import 'package:go_share/ui/container/UIConstants/GSWidgetStyles.dart';
import 'package:go_share/ui/container/UIConstants/Strings.dart';

class PrivacyAndConcernView extends StatefulWidget {
  const PrivacyAndConcernView({Key? key}) : super(key: key);

  @override
  _PrivacyAndConcernViewState createState() => _PrivacyAndConcernViewState();
}

class _PrivacyAndConcernViewState extends State<PrivacyAndConcernView> {
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
              child: PrivacyWidget(),
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
                GSStrings.privacy_and_concern_title,
                textAlign: TextAlign.start,
                style: GSTextStyles.make40xw900Style(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  GSStrings.privacy_and_concern_subtitle,
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

class PrivacyWidget extends StatefulWidget {
  const PrivacyWidget({Key? key}) : super(key: key);

  @override
  _PrivacyWidgetState createState() => _PrivacyWidgetState();
}

class _PrivacyWidgetState extends State<PrivacyWidget> {
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
            Padding(
              padding: const EdgeInsets.only(
                bottom: 28.0,
              ),
              child: Text(
                "When you use our services, you’re trusting us with your information.",
                style: GSTextStyles.make24xw900Style(),
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
            Container(
              width: double.maxFinite,
              padding: const EdgeInsets.only(
                top: 40.0,
                bottom: 22.0,
              ),
              child: Image.asset(
                "images/ic_demo_privacy_one.png",
                height: 220.0,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              "If you’re under the age required to manage your own Google Account, you must have your parent or legal guardian’s permission to use a Google Account. Please have your parent or legal guardian read these terms with you. \n\nIf you’re a parent or legal guardian, and you allow your child to use the services, then these terms apply to you and you’re responsible for your child’s activity on the services. \n\nSome Google services have additional age requirements as described in their service-specific additional terms and policies.",
              style: GSTextStyles.make12xw400Style(
                color: GSColors.text_light.withOpacity(0.7),
              ),
              textAlign: TextAlign.justify,
            ),
            Container(
              width: double.maxFinite,
              padding: const EdgeInsets.only(
                top: 40.0,
                bottom: 22.0,
              ),
              child: Image.asset(
                "images/ic_demo_privacy_two.png",
                height: 220.0,
                fit: BoxFit.cover,
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
