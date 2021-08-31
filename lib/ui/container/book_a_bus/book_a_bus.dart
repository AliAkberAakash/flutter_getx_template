import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:go_share/base/widget/custom_filled_button.dart';
import 'package:go_share/ui/container/UIConstants/Colors.dart';
import 'package:go_share/ui/container/UIConstants/GSWidgetStyles.dart';
import 'package:go_share/ui/container/UIConstants/Strings.dart';
import 'package:go_share/ui/container/contact_us/contact_us.dart';

class BookABusView extends StatefulWidget {
  const BookABusView({Key? key}) : super(key: key);

  @override
  _BookABusViewState createState() => _BookABusViewState();
}

class _BookABusViewState extends State<BookABusView> {
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
              child: FaqListWidget(),
            ),
            CustomFilledButton(
              margin: const EdgeInsets.only(
                left: 30.0,
                right: 30.0,
                top: 32.0,
                bottom: 16.0,
              ),
              borderRadius: 8.0,
              borderColor: GSColors.green_secondary,
              backgroundColor: Colors.transparent,
              textColor: GSColors.green_secondary,
              title: GSStrings.book_a_bus_contact_with_us,
              onTap: () {
                Get.to(
                  ContactUsView()
                );
              },
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
      height: 240.0,
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
              Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  borderRadius: const BorderRadius.all(
                    const Radius.circular(4.0),
                  ),
                  child: Ink(
                    padding: const EdgeInsets.only(
                      top: 8.0,
                      bottom: 8.0,
                      right: 8.0,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          GSStrings.back,
                          textAlign: TextAlign.start,
                          style: GSTextStyles.make18xw400Style(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 16.0,
                  top: 8.0,
                ),
                child: Text(
                  GSStrings.book_a_bus_title,
                  textAlign: TextAlign.start,
                  style: GSTextStyles.make40xw900Style(),
                ),
              ),
              Text(
                GSStrings.book_a_bus_subtitle,
                textAlign: TextAlign.start,
                style: GSTextStyles.make18xw400Style(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FaqListWidget extends StatelessWidget {
  const FaqListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context, int index) {
        return FaqItemWidget(index: index);
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: 40.0);
      },
      itemCount: 20,
    );
  }
}

class FaqItemWidget extends StatelessWidget {
  final int index;

  const FaqItemWidget({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 28.0,
                margin: const EdgeInsets.only(right: 4.0),
                child: Text(
                  "${index + 1}.",
                  style: GSTextStyles.make18xw600Style(
                    color: GSColors.text_bold,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        "What does FAQs mean in English?",
                        style: GSTextStyles.make18xw600Style(
                          color: GSColors.text_bold,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Text(
                      "Your charity program has been successfully created. Now you can check and maintain it in your ‘activity’ menu",
                      style: GSTextStyles.make12xw400Style(
                        color: GSColors.text_secondary,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
