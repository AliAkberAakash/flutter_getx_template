import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_share/base/widget/custom_filled_button.dart';
import 'package:go_share/base/widget/custom_text_form_field.dart';
import 'package:go_share/ui/container/UIConstants/Colors.dart';
import 'package:go_share/ui/container/UIConstants/Fonts.dart';
import 'package:go_share/ui/container/UIConstants/GSWidgetStyles.dart';
import 'package:go_share/ui/container/UIConstants/Strings.dart';

class RefundRequestView extends StatefulWidget {
  const RefundRequestView({Key? key}) : super(key: key);

  @override
  _RefundRequestViewState createState() => _RefundRequestViewState();
}

class _RefundRequestViewState extends State<RefundRequestView> {
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
        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: BodyWidget(),
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
  late TextEditingController reasonController;

  @override
  void initState() {
    reasonController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    reasonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleWidget(),
        BookingItemWidget(),
        CustomTextFormField(
          formController: reasonController,
          inputType: TextInputType.text,
          hint: "Why you cancel the ride",
          isFieldExpanded: true,
          isRequiredField: false,
          margin: const EdgeInsets.only(
            left: 30.0,
            right: 30.0,
            top: 20.0,
            bottom: 20.0,
          ),
          expansionHeight: 146.0,
        ),
        CustomFilledButton(
          margin: const EdgeInsets.only(
            left: 30.0,
            right: 30.0,
          ),
          fontSize: 18.0,
          padding: const EdgeInsets.all(16.0),
          borderRadius: 8.0,
          borderColor: Colors.transparent,
          backgroundColor: GSColors.green_secondary,
          textColor: Colors.white,
          title: "Submit Request",
          onTap: () {},
        ),
      ],
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
                GSStrings.refund_request_title,
                textAlign: TextAlign.start,
                style: GSTextStyles.make28xw700Style(
                  color: GSColors.gray_primary,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  GSStrings.refund_request_subtitle,
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

class BookingItemWidget extends StatelessWidget {
  const BookingItemWidget({
    Key? key,
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
          Container(
            width: double.maxFinite,
            padding: const EdgeInsets.only(
              top: 20.0,
              left: 20.0,
              right: 20.0,
            ),
            child: BookingItemHeaderWidget(),
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
            child: BookingItemBodyWidget(),
          ),
        ],
      ),
    );
  }
}

class BookingItemBodyWidget extends StatelessWidget {
  const BookingItemBodyWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              flex: 5,
              child: TitleSubtitleWidget(
                title: "Child Name",
                subtitle: "Violet Norman",
              ),
            ),
            Expanded(
              flex: 2,
              child: TitleSubtitleWidget(
                title: "Booked Seat",
                subtitle: "3 Seats",
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 5,
              child: TitleSubtitleWidget(
                title: "Start Date",
                subtitle: "19 May, 2021",
              ),
            ),
            Expanded(
              flex: 2,
              child: TitleSubtitleWidget(
                title: "End Date",
                subtitle: "19 May, 2021",
              ),
            ),
          ],
        ),
        Container(
          decoration: const BoxDecoration(
            borderRadius: const BorderRadius.all(
              const Radius.circular(8.0),
            ),
            border: const Border.fromBorderSide(
              const BorderSide(
                color: GSColors.green_secondary,
              ),
            ),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 12.0,
            horizontal: 20.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Price",
                style: GSTextStyles.make18xw600Style(
                  color: GSColors.gray_secondary,
                ),
                textAlign: TextAlign.start,
              ),
              Text(
                "\$299.00",
                style: GSTextStyles.make18xw700Style(
                  color: GSColors.gray_primary,
                ),
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class BookingItemHeaderWidget extends StatelessWidget {
  const BookingItemHeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}

class TitleSubtitleWidget extends StatelessWidget {
  const TitleSubtitleWidget({
    Key? key,
    required this.title,
    required this.subtitle,
    this.margin = const EdgeInsets.only(bottom: 16.0),
  }) : super(key: key);

  final String title;
  final String subtitle;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Column(
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
      ),
    );
  }
}
