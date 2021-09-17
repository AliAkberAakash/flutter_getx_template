import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:go_share/base/widget/custom_filled_button.dart';
import 'package:go_share/ui/container/UIConstants/Colors.dart';
import 'package:go_share/ui/container/UIConstants/Fonts.dart';
import 'package:go_share/ui/container/UIConstants/GSWidgetStyles.dart';
import 'package:go_share/ui/container/UIConstants/Strings.dart';
import 'package:go_share/ui/container/my_booking_details_one/my_booking_details_one.dart';
import 'package:go_share/ui/container/my_booking_details_two/my_booking_details_two.dart';
import 'package:go_share/utils/colors.dart';
import 'package:go_share/utils/dimens.dart';
import 'package:go_share/utils/spacers.dart';
import 'package:google_fonts/google_fonts.dart';

class MyBookingsView extends StatefulWidget {
  const MyBookingsView({Key? key}) : super(key: key);

  @override
  _MyBookingsViewState createState() => _MyBookingsViewState();
}

class _MyBookingsViewState extends State<MyBookingsView> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
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
      width: double.maxFinite,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 32.0,
            vertical: 24.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                GSStrings.my_bookings_title,
                textAlign: TextAlign.start,
                style: GSTextStyles.make28xw700Style(
                  color: GSColors.gray_primary,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  GSStrings.my_bookings_subtitle,
                  textAlign: TextAlign.start,
                  style: GSTextStyles.make16xw400Style(
                    color: GSColors.gray_secondary,
                  ),
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
      length: 4,
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
    return Column(
      children: [
        TabBar(
          physics: BouncingScrollPhysics(),
          isScrollable: false,
          labelColor: GSColors.green_secondary,
          unselectedLabelColor: GSColors.gray_secondary,
          indicatorPadding: const EdgeInsets.symmetric(horizontal: 16.0),
          indicatorColor: GSColors.green_secondary,
          controller: _tabController,
          labelStyle: GSTextStyles.make16xw600Style(
            color: GSColors.green_secondary,
          ),
          unselectedLabelStyle: GSTextStyles.make16xw600Style(
            color: GSColors.gray_secondary,
          ),
          tabs: [
            TabBarCustomTab(title: "All"),
            TabBarCustomTab(title: "Pending"),
            TabBarCustomTab(title: "On Going"),
            TabBarCustomTab(title: "Finished"),
          ],
        ),
        Expanded(
          child: TabBarView(
            physics: BouncingScrollPhysics(),
            controller: _tabController,
            children: [
              BookingListWidget(),
              BookingListWidget(),
              BookingListWidget(),
              BookingListWidget2(),
            ],
          ),
        ),
      ],
    );
  }
}

class BookingListWidget extends StatelessWidget {
  const BookingListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(bottom: 32.0, top: 32.0),
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context, int index) {
        return index == 10? VSpacer20() : BookingItemWidget(type: 0,);
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: 30.0);
      },
      itemCount: 11,
    );
  }
}

class BookingListWidget2 extends StatelessWidget {
  const BookingListWidget2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(bottom: 32.0, top: 32.0),
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context, int index) {
        return index == 10? VSpacer20() : BookingItemWidget(type: 1,);
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: 30.0);
      },
      itemCount: 11,
    );
  }
}

class BookingItemWidget extends StatelessWidget {

  final int type;

  const BookingItemWidget({
    Key? key,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30.0),
      decoration: const BoxDecoration(
        borderRadius: const BorderRadius.all(
          const Radius.circular(6.0),
        ),
        border: const Border.fromBorderSide(
          const BorderSide(
            color: GSColors.gray_normal,
          ),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 20.0,
              left: 20.0,
              right: 20.0,
            ),
            child: BookingItemHeaderWidget(type: type,),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Divider(
              height: 2.0,
              color: GSColors.gray_normal,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 20.0,
              left: 20.0,
              right: 20.0,
            ),
            child: BookingItemBodyWidget(type: type,),
          ),
        ],
      ),
    );
  }
}

class BookingItemBodyWidget extends StatelessWidget {

  final int type;

  const BookingItemBodyWidget({
    Key? key,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 0.0, right: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: GSColors.green_secondary,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 6.0),
                      child: DottedLine(
                        dashLength: 8.0,
                        dashColor: GSColors.gray_primary.withOpacity(0.3),
                        direction: Axis.vertical,
                        lineLength: 60,
                      ),
                    ),
                    Icon(
                      Icons.location_on_outlined,
                      color: GSColors.green_secondary,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleSubtitleWidget(
                      title: "Pickup point",
                      subtitle: "Block 372 Bukit Batok Street 31.",
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24.0),
                      child: TitleSubtitleWidget(
                        title: "Drop-off point",
                        subtitle: "Block 372 Bukit Batok Street 31.",
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TitleSubtitleWidget(
              title: "Start Date",
              subtitle: "19 May, 2021",
            ),
            TitleSubtitleWidget(
              title: "End Date",
              subtitle: "19 May, 2021",
            ),
          ],
        ),
        CustomFilledButton(
          margin: const EdgeInsets.only(
            top: 16.0,
          ),
          fontSize: 14.0,
          padding: const EdgeInsets.all(12.0),
          borderRadius: 8.0,
          borderColor: GSColors.green_secondary,
          backgroundColor: Colors.transparent,
          textColor: GSColors.green_secondary,
          title: "Booking Details",
          onTap: () {
            if(type==0)
              Get.to(MyBookingDetailsOneView());
            else Get.to(MyBookingDetailsTwoView());
          },
        ),
      ],
    );
  }
}

class BookingItemHeaderWidget extends StatelessWidget {

  final int type;

  const BookingItemHeaderWidget({
    Key? key,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Booking ID",
              style: GSTextStyles.make14xw400Style(
                fontFamily: GSFonts.appFont,
                color: GSColors.gray_primary,
              ),
              textAlign: TextAlign.start,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                "#907097",
                style: GSTextStyles.make20xw700Style(
                  color: GSColors.gray_primary,
                ),
                textAlign: TextAlign.start,
              ),
            ),
          ],
        ),
        Container(
          decoration: BoxDecoration(
            color: type == 0 ? GSColors.pending_Color.withOpacity(0.1) : finishedChipColor.withOpacity(0.1),
            borderRadius: const BorderRadius.all(
              const Radius.circular(dp20),
            ),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 8.0,
          ),
          child: Text(
            type == 0 ?"Pending" : "Finished",
            style: GSTextStyles.make13xw700Style(
              color: type == 0 ? GSColors.pending_Color : finishedChipColor,
            ),
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }
}

class TitleSubtitleWidget extends StatelessWidget {
  const TitleSubtitleWidget({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 4.0),
          child: Text(
            this.title,
            textAlign: TextAlign.start,
            style: GSTextStyles.make14xw400Style(
              color: GSColors.gray_secondary,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
        Text(
          this.subtitle,
          textAlign: TextAlign.start,
          style: GSTextStyles.make16xw500Style(
            color: GSColors.text_regular,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
      ],
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
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: GoogleFonts.manrope(
          fontSize: dp14,
        ),
      ),
    );
  }
}
