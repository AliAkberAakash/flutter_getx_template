import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_share/base/widget/custom_app_promotion_widget.dart';
import 'package:go_share/base/widget/custom_bus_time_widget.dart';
import 'package:go_share/ui/container/UIConstants/Colors.dart';
import 'package:go_share/ui/container/UIConstants/Fonts.dart';
import 'package:go_share/ui/container/UIConstants/GSWidgetStyles.dart';
import 'package:go_share/ui/container/UIConstants/Strings.dart';

class AboutUsView extends StatefulWidget {
  const AboutUsView({Key? key}) : super(key: key);

  @override
  _AboutUsViewState createState() => _AboutUsViewState();
}

class _AboutUsViewState extends State<AboutUsView> {
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
                GSStrings.about_us_title,
                textAlign: TextAlign.start,
                style: GSTextStyles.make40xw900Style(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  GSStrings.about_us_subtitle,
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

class _BodyWidgetState extends State<BodyWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();

    _scrollController.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      controller: _scrollController,
      physics: BouncingScrollPhysics(),
      headerSliverBuilder: (context, value) {
        return [
          SliverToBoxAdapter(
            child: Container(
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IntroductionWidget(),
                  Container(
                    width: double.maxFinite,
                    margin: const EdgeInsets.only(
                      top: 0.0,
                    ),
                    child: Image.asset(
                      "images/ic_demo_testimonial_one.png",
                      height: 440.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  WhyChooseUsWidget(),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: TabBar(
              physics: BouncingScrollPhysics(),
              isScrollable: false,
              labelColor: GSColors.green_secondary,
              unselectedLabelColor: GSColors.gray_secondary,
              indicatorPadding: const EdgeInsets.symmetric(horizontal: 24.0),
              indicatorColor: GSColors.green_secondary,
              controller: _tabController,
              labelStyle: GSTextStyles.make16xw600Style(
                color: GSColors.green_secondary,
              ),
              unselectedLabelStyle: GSTextStyles.make16xw600Style(
                color: GSColors.gray_secondary,
              ),
              tabs: [
                TabBarCustomTab(title: "Our Mission"),
                TabBarCustomTab(title: "Vision"),
              ],
            ),
          ),
/*          SliverToBoxAdapter(
            child: Container(
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                ],
              ),
            ),
          ),*/
        ];
      },
      body: Container(
        child: TabBarView(
          physics: BouncingScrollPhysics(),
          controller: _tabController,
          children: [
            MissionAndVisionListWidget(),
            MissionAndVisionListWidget(),
          ],
        ),
      ),
    );
  }
}

class MissionAndVisionListWidget extends StatelessWidget {
  const MissionAndVisionListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(bottom: 32.0, top: 32.0),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context, int index) {
        return MissionAndVisionItemWidget();
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: 46.0);
      },
      itemCount: 2,
    );
  }
}

class MissionAndVisionItemWidget extends StatelessWidget {
  const MissionAndVisionItemWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.maxFinite,
            child: Image.asset(
              "images/ic_demo_mission_one.png",
              height: 220.0,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 20.0,
              top: 32.0,
            ),
            child: Text(
              "How we believe we can achieve it",
              style: GSTextStyles.make24xw900Style(),
              textAlign: TextAlign.start,
            ),
          ),
          Text(
            "We are an industry-leading company that values honesty, integrity, and efficiency. Building quality products and caring for the users are what made us stand out since the beginning.",
            style: GSTextStyles.make12xw400Style(
              color: GSColors.text_light,
            ),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}

class TabBarCustomTab extends StatelessWidget {
  final String title;

  const TabBarCustomTab({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Text(
        title,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
    );
  }
}

class IntroductionWidget extends StatelessWidget {
  const IntroductionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("images/ic_background_world_map.png"),
        ),
      ),
      padding: const EdgeInsets.only(
        left: 30.0,
        right: 30.0,
        bottom: 45.0,
        top: 45.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "What We Value",
            style: GSTextStyles.make14xw600Style(
              color: GSColors.green_secondary,
            ),
            textAlign: TextAlign.start,
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 28.0,
              top: 8.0,
            ),
            child: Text(
              "From essential services to earning opportunities. We're an all-in-one platform.",
              style: GSTextStyles.make24xw900Style(),
              textAlign: TextAlign.start,
            ),
          ),
          Text(
            "We are an industry-leading company that values honesty, integrity, and efficiency. Building quality products and caring for the users are what made us stand out since the beginning.",
            style: GSTextStyles.make12xw400Style(
              color: GSColors.text_light,
            ),
            textAlign: TextAlign.justify,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TravelPackWidget(
                  title: "43 M",
                  subtitle: "Active Users",
                ),
                TravelPackWidget(
                  title: "11+",
                  subtitle: "Years of Experience",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class WhyChooseUsWidget extends StatelessWidget {
  const WhyChooseUsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: GSColors.green_light,
      ),
      padding: const EdgeInsets.only(
        left: 30.0,
        right: 30.0,
        bottom: 45.0,
        top: 45.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Why choose us",
            style: GSTextStyles.make14xw600Style(
              color: GSColors.green_secondary,
            ),
            textAlign: TextAlign.start,
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 8.0,
            ),
            child: Text(
              "\“From essential services to earning opportunities. We're an all-in-one platform.\”",
              style: GSTextStyles.make24xw900Style(),
              textAlign: TextAlign.start,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 42.0,
              bottom: 30.0,
            ),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 16.0),
                  width: 64.0,
                  height: 64.0,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: GSColors.green_normal,
                  ),
                  child: Center(
                    child: Image.asset(
                      "images/ic_coffee.png",
                      fit: BoxFit.fitHeight,
                      height: 28.0,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    "A safer everyday, \nfor everyone",
                    style: GSTextStyles.make18xw600Style(
                      color: GSColors.text_bold,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 16.0),
                width: 64.0,
                height: 64.0,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: GSColors.green_normal,
                ),
                child: Center(
                  child: Image.asset(
                    "images/ic_award.png",
                    fit: BoxFit.fitHeight,
                    height: 28.0,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  "Forward by creating \neconomy",
                  style: GSTextStyles.make18xw600Style(
                    color: GSColors.text_bold,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SessionWidget extends StatelessWidget {
  final String title, imagePath;
  final Color textColor, backgroundColor, iconColor;

  const SessionWidget({
    Key? key,
    this.imagePath = "images/ic_morning.png",
    this.title = GSStrings.morning,
    this.textColor = Colors.white,
    this.iconColor = Colors.white,
    this.backgroundColor = GSColors.green_secondary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 112.0,
      height: 32.0,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          const Radius.circular(4.0),
        ),
        color: this.backgroundColor,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            this.imagePath,
            height: 18.0,
            fit: BoxFit.contain,
            color: this.iconColor,
          ),
          SizedBox(width: 6.0),
          Text(
            this.title,
            textAlign: TextAlign.start,
            style: GSTextStyles.make15xw600Style(
              color: this.textColor,
              fontFamily: GSFonts.appFont,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
