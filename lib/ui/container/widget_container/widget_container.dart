import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:go_share/ui/book_a_bus/info_screen.dart';
import 'package:go_share/ui/container/UIConstants/Colors.dart';
import 'package:go_share/ui/container/UIConstants/GSWidgetStyles.dart';
import 'package:go_share/ui/container/UIConstants/Strings.dart';
import 'package:go_share/ui/container/about_us/about_us.dart';
import 'package:go_share/ui/container/contact_us/contact_us.dart';
import 'package:go_share/ui/container/faq/faq.dart';
import 'package:go_share/ui/container/home/home.dart';
import 'package:go_share/ui/container/lost_and_found/lost_and_found.dart';
import 'package:go_share/ui/container/our_service/our_service.dart';
import 'package:go_share/ui/container/privacy_and_concern/privacy_and_concern.dart';
import 'package:go_share/ui/container/terms_and_conditions/terms_and_conditions.dart';
import 'package:go_share/ui/driver_login/driver_login_screen.dart';
import 'package:go_share/ui/navigation_container/widgets/menu_items.dart';
import 'package:go_share/ui/not_logged_in_welcome/welcome_screen.dart';
import 'package:go_share/ui/section4/widgets/menu_page_button.dart';
import 'package:go_share/utils/colors.dart';
import 'package:go_share/utils/constants.dart';
import 'package:go_share/utils/dimens.dart';
import 'package:go_share/utils/spacers.dart';
import 'package:google_fonts/google_fonts.dart';

class WidgetContainerView extends StatefulWidget {
  const WidgetContainerView({Key? key}) : super(key: key);

  @override
  _WidgetContainerViewState createState() => _WidgetContainerViewState();
}

class _WidgetContainerViewState extends State<WidgetContainerView> {
  late Widget body;
  late int selectedBottomBarIndex;
  var hp;

  @override
  void initState() {
    super.initState();

    body = HomeView();
    selectedBottomBarIndex = 0;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    hp = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: GSColors.green_secondary,
        child: Image.asset(
          "images/ic_bus.png",
          fit: BoxFit.contain,
          height: 32.0,
        ),
        onPressed: () {
          Get.to(
              InfoScreen(),
          );
        },
      ),
      body: body,
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0.0,
        currentIndex: selectedBottomBarIndex <= 1 ? selectedBottomBarIndex : 1,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        selectedItemColor: GSColors.gray_secondary,
        unselectedItemColor: GSColors.gray_secondary,
        selectedLabelStyle: GSTextStyles.make14xw600Style(
          color: GSColors.gray_secondary,
        ),
        unselectedLabelStyle: GSTextStyles.make14xw600Style(
          color: GSColors.gray_secondary,
        ),
        items: [
          getBottomBarItem(
            'images/ic_home.png',
            GSStrings.container_home,
            0,
          ),
          getBottomBarItem(
            "",
            GSStrings.container_book_a_bus,
            1,
          ),
          getBottomBarItem(
            'images/ic_menu.png',
            GSStrings.container_menu,
            2,
          ),
        ],
        onTap: (index) {
          if (index == 2)
            showMenuBottomSheet(hp, context);
          else
            _changeBottomBarIndex(index);
        },
      ),
    );
  }

  BottomNavigationBarItem getBottomBarItem(
    String imagePath,
    String title,
    int position,
  ) {
    return BottomNavigationBarItem(
      icon: imagePath.trim().isNotEmpty
          ? Image.asset(
              imagePath,
              fit: BoxFit.fitHeight,
              height: 32.0,
            )
          : SizedBox(height: 33.0),
      label: title,
    );
  }

  void _changeBottomBarIndex(int index) {
    if (index >= 3) Get.back();

    setState(() {
      selectedBottomBarIndex = index;

      switch (index) {
        case 0:
          body = HomeView();
          break;

        case 1:
          body = AboutUsView();
          break;

        case 3:
          body = AboutUsView();
          break;

        case 4:
          body = OurServiceView();
          break;

        case 5:
          body = FaqView();
          break;

        case 6:
          body = LostAndFoundView();
          break;

        case 7:
          body = TermsAndConditionsView();
          break;

        case 8:
          body = PrivacyAndConcernView();
          break;

        case 9:
          body = ContactUsView();
          break;

        default:
          break;
      }
    });
  }

  showMenuBottomSheet(double height, BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(dp20),
          topRight: Radius.circular(dp20),
        ),
      ),
      context: context,
      builder: (context) {
        return Wrap(
          children: [
            Container(
              height: height - 100,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(dp20),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: dp30,
                          backgroundImage: NetworkImage(
                            "https://images.unsplash.com/photo-1563306406-e66174fa3787",
                          ),
                        ),
                        HSpacer20(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "No user logged in",
                              style: GoogleFonts.manrope(
                                color: darkText,
                                fontWeight: FontWeight.bold,
                                fontSize: dp16,
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                Get.back();
                                Get.to(
                                  NotLoggedInWelcome(),
                                );
                              },
                              child: Text(
                                "Tap to login",
                                style: GoogleFonts.manrope(),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        MenuItem(
                          isSelected: 3 == selectedBottomBarIndex,
                          index: 3,
                          title: "About Us",
                          icon: AssetConstants.ic_profile_svg,
                          onClick: (index) {
                            _changeBottomBarIndex(3);
                          },
                        ),
                        MenuItem(
                          isSelected: 4 == selectedBottomBarIndex,
                          index: 4,
                          title: "Our Services",
                          icon: AssetConstants.ic_vehicle_list_svg,
                          onClick: (index) {
                            _changeBottomBarIndex(4);
                          },
                        ),
                        MenuItem(
                          isSelected: 5 == selectedBottomBarIndex,
                          index: 5,
                          title: "FAQ",
                          icon: AssetConstants.ic_free_busy_list_svg,
                          onClick: (index) {
                            _changeBottomBarIndex(5);
                          },
                        ),
                        MenuItem(
                          isSelected: 6 == selectedBottomBarIndex,
                          index: 6,
                          title: "Lost & Found",
                          icon: AssetConstants.lostandFoundIcon,
                          onClick: (index) {
                            _changeBottomBarIndex(6);
                          },
                        ),
                        MenuItem(
                          isSelected: 7 == selectedBottomBarIndex,
                          index: 7,
                          title: "Terms & Condition",
                          icon: AssetConstants.ic_notification_svg,
                          onClick: (index) {
                            _changeBottomBarIndex(7);
                          },
                        ),
                        MenuItem(
                          isSelected: 8 == selectedBottomBarIndex,
                          index: 8,
                          title: "Privacy & Concern",
                          icon: AssetConstants.ic_settings_svg,
                          onClick: (index) {
                            _changeBottomBarIndex(8);
                          },
                        ),
                        MenuItem(
                          isSelected: 9 == selectedBottomBarIndex,
                          index: 9,
                          title: "Contact Us",
                          icon: AssetConstants.ic_sign_out_svg,
                          onClick: (index) {
                            _changeBottomBarIndex(9);
                          },
                        ),
                        MenuItem(
                          isSelected: 9 == selectedBottomBarIndex,
                          index: 9,
                          title: "Driver Login",
                          icon: AssetConstants.ic_profile_svg,
                          onClick: (index) {
                            Get.to(
                                DriverLoginScreen(),
                            );
                          },
                        ),
                        MenuButtonOutlineStock(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
