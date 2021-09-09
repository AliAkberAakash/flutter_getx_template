import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_share/ui/add_vehicle/add_vehicle.dart';
import 'package:go_share/ui/container/home/home.dart';
import 'package:go_share/ui/driver_login/driver_login_screen.dart';
import 'package:go_share/ui/navigation_container/widgets/bottom_bar_item.dart';
import 'package:go_share/ui/navigation_container/widgets/menu_items.dart';
import 'package:go_share/ui/registration_request/registration_request_screen.dart';
import 'package:go_share/ui/reset_vehicle_login/reset_vehicle_list.dart';
import 'package:go_share/ui/section1/service_provider/service_provider_update_screen.dart';
import 'package:go_share/ui/section4/notification/notification_screen.dart';
import 'package:go_share/ui/vehicle_free_busy_list/vehicle_free_busy_screen.dart';
import 'package:go_share/utils/colors.dart';
import 'package:go_share/utils/constants.dart';
import 'package:go_share/utils/dimens.dart';
import 'package:go_share/utils/spacers.dart';
import 'package:google_fonts/google_fonts.dart';

class NavigationContainer extends StatefulWidget {
  const NavigationContainer({Key? key}) : super(key: key);

  @override
  _NavigationContainerState createState() => _NavigationContainerState();
}

class _NavigationContainerState extends State<NavigationContainer> {
  int _selectedItem = 3;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Scaffold(
          body: _getBody(),
          floatingActionButton: FloatingActionButton(
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [gradientDark, gradientLight],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight
                  )
              ),
              child: Center(
                child: SvgPicture.asset(
                  AssetConstants.ic_bus_svg,
                ),
              ),
            ),
            onPressed: () {
              changePage(1);
            },
            backgroundColor: accent,
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            child: Container(
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  BottomBarItem(
                    iconString: AssetConstants.ic_home_svg,
                    isSelected: _selectedItem == 0,
                    title: "Home",
                    index: 0,
                    onTap: _onBottomBarTap,
                  ),
                  BottomBarItem(
                    iconString: "",
                    isSelected: _selectedItem == 1,
                    title: "Add a Bus",
                    index: 1,
                    onTap: (int position){

                    },
                  ),
                  BottomBarItem(
                    iconString: AssetConstants.ic_menu_svg,
                    isSelected: _selectedItem == 2,
                    title: "Menu",
                    index: 2,
                    onTap: (int position) {
                      _showMenu(constraints.maxHeight);
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _onBottomBarTap(int index) {
    setState(() {
      _selectedItem = index;
    });
  }

  _showMenu(double height) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
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
                              "Violet Norman",
                              style: GoogleFonts.manrope(
                                color: darkText,
                                fontWeight: FontWeight.bold,
                                fontSize: dp16,
                              ),
                            ),
                            Text(
                              "bayer_martin@yahoo.com",
                              style: GoogleFonts.manrope(),
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
                          isSelected: 3 == _selectedItem,
                          index: 3,
                          title: "My profile",
                          icon: AssetConstants.ic_profile_svg,
                          onClick: (index) {
                            changePage(index);
                          },
                        ),
                        MenuItem(
                          isSelected: 4 == _selectedItem,
                          index: 4,
                          title: "My vehicle list",
                          icon: AssetConstants.ic_vehicle_list_svg,
                          onClick: (index) {
                            changePage(index);
                          },
                        ),
                        MenuItem(
                          isSelected: 5 == _selectedItem,
                          index: 5,
                          title: "Vehicle free busy list",
                          icon: AssetConstants.ic_free_busy_list_svg,
                          onClick: (index) {
                            changePage(index);
                          },
                        ),
                        MenuItem(
                          isSelected: 6 == _selectedItem,
                          index: 6,
                          title: "Notification",
                          icon: AssetConstants.ic_notification_svg,
                          onClick: (index) {
                            changePage(index);
                          },
                        ),
                        MenuItem(
                          isSelected: 7 == _selectedItem,
                          index: 7,
                          title: "Reset vehicle login",
                          icon: AssetConstants.ic_settings_svg,
                          onClick: (index) {
                            changePage(index);
                          },
                        ),
                        MenuItem(
                          isSelected: 9 == _selectedItem,
                          index: 9,
                          title: "Driver Login",
                          icon: AssetConstants.ic_profile_svg,
                          onClick: (index) {
                            Get.to(
                              DriverLoginScreen(),
                            );
                          },
                        ),
                        MenuItem(
                          isSelected: 8 == _selectedItem,
                          index: 8,
                          title: "Sign out",
                          icon: AssetConstants.ic_sign_out_svg,
                          onClick: (index) {
                            Get.back();
                            Get.back();
                            Get.back();
                            Get.back();
                          },
                        ),
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

  changePage(int index) {

    if (index != _selectedItem) {

      if(index != 0 && index != 1)
        Get.back();

      setState(() {
        _selectedItem = index;
      });
    }else{
      Get.back();
    }
  }

  Widget _getBody() {
    switch (_selectedItem) {
      case 0:
        return HomeView();
      case 1:
        return AddVehicleScreen();
      case 2:
        return ServiceProviderUpdateScreen();
      case 3:
        return ServiceProviderUpdateScreen();
      case 4:
        return RegistrationRequestScreen();
      case 5:
        return VehicleFreeBusyList();
      case 6:
        return NotificationScreen();
      case 7:
        return ResetVehicleList();
      default:
        return Container();
    }
  }
}
