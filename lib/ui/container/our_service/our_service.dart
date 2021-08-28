import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_share/base/widget/custom_app_promotion_widget.dart';
import 'package:go_share/base/widget/custom_bus_time_widget.dart';
import 'package:go_share/ui/container/UIConstants/Colors.dart';
import 'package:go_share/ui/container/UIConstants/Fonts.dart';
import 'package:go_share/ui/container/UIConstants/GSWidgetStyles.dart';
import 'package:go_share/ui/container/UIConstants/Strings.dart';

class OurServiceView extends StatefulWidget {
  const OurServiceView({Key? key}) : super(key: key);

  @override
  _OurServiceViewState createState() => _OurServiceViewState();
}

class _OurServiceViewState extends State<OurServiceView> {

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
              child: BodyWidget(),
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
                GSStrings.our_service_title,
                textAlign: TextAlign.start,
                style: GSTextStyles.make40xw900Style(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  GSStrings.our_service_subtitle,
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

class BodyWidget extends StatefulWidget {
  const BodyWidget({Key? key}) : super(key: key);

  @override
  _BodyWidgetState createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {

  int status = 0;

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
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                children: [
                  SessionWidget(
                    index: 0,
                    imagePath: "images/ic_morning.png",
                    title: GSStrings.morning,
                    isSelected: status == 0,
                    onClick: (index){
                      setState(() {
                        status = index;
                      });
                    },
                  ),
                  SizedBox(width: 16.0),
                  SessionWidget(
                    index: 1,
                    imagePath: "images/ic_evening.png",
                    title: GSStrings.evening,
                    isSelected: status == 1,
                    onClick: (index){
                      setState(() {
                        status = index;
                      });
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: CustomBusTimeWidget(
                backgroundImagePath: "images/ic_demo_bus_hour_one.png",
                title: "Off Peak Hour",
                subtitle: "Before 6.45 AM - After 8.15 AM",
                moneyOne: "\$12",
                moneyTwo: "\$15",
                moneyThree: "\$18",
                distanceOne: "3 Km (Max)",
                distanceTwo: "3 km - 8km",
                distanceThree: "8km +",
              ),
            ),
            CustomBusTimeWidget(
              backgroundImagePath: "images/ic_demo_bus_hour_two.png",
            ),
            CustomAppPromotionWidget(),
          ],
        ),
      ),
    );
  }
}

class SessionWidget extends StatelessWidget {
  final String title, imagePath;
  final bool isSelected;
  final int index;
  final Function(int index) onClick;

  const SessionWidget({
    Key? key,
    this.imagePath = "images/ic_morning.png",
    this.title = GSStrings.morning,
    required this.isSelected,
    required this.index,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onClick(index);
      },
      child: Container(
        width: 112.0,
        height: 32.0,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            const Radius.circular(4.0),
          ),
          color: isSelected ? GSColors.green_secondary : GSColors.gray_normal.withOpacity(0.2),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              this.imagePath,
              height: 18.0,
              fit: BoxFit.contain,
              color: isSelected ? Colors.white :  GSColors.green_secondary,
            ),
            SizedBox(width: 6.0),
            Text(
              this.title,
              textAlign: TextAlign.start,
              style: GSTextStyles.make15xw600Style(
                color: isSelected ? Colors.white :  GSColors.green_secondary,
                fontFamily: GSFonts.appFont,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ],
        ),
      ),
    );
  }
}
