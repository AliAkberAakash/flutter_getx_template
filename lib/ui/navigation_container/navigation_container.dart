import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nilam/ui/navigation_container/widgets/bottom_bar_item.dart';
import 'package:nilam/ui/navigation_container/widgets/menu_items.dart';
import 'package:nilam/utils/colors.dart';
import 'package:nilam/utils/constants.dart';
import 'package:nilam/utils/dimens.dart';
import 'package:nilam/utils/spacers.dart';

class NavigationContainer extends StatefulWidget {
  const NavigationContainer({Key? key}) : super(key: key);

  @override
  _NavigationContainerState createState() => _NavigationContainerState();
}

class _NavigationContainerState extends State<NavigationContainer> {

  int _selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Scaffold(
          floatingActionButton: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FloatingActionButton(
                child: SvgPicture.asset(
                  AssetConstants.ic_bus_svg,
                ),
                onPressed: () {},
                backgroundColor: accent,
              ),
              VSpacer10(),
              Text("Book a Bus"),
            ],
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
            child: Container(
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BottomBarItem(
                    iconString: AssetConstants.ic_home_svg,
                    isSelected: _selectedItem == 0,
                    title: "Home",
                    index: 0,
                    onTap: _onBottomBarTap,
                  ),
                  BottomBarItem(
                    iconString: AssetConstants.ic_menu_svg,
                    isSelected: _selectedItem == 1,
                    title: "Menu",
                    index: 1,
                    onTap:(int position){
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

  void _onBottomBarTap(int index){
    setState(() {
      _selectedItem = index;
    });
  }

  _showMenu(double height) {
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
                            isSelected: false,
                            index: 0,
                            title: "My Profile",
                            icon: AssetConstants.ic_profile
                        ),
                        MenuItem(
                            isSelected: true,
                            index: 0,
                            title: "My Vehicle List",
                            icon: AssetConstants.ic_profile
                        ),
                        MenuItem(
                            isSelected: false,
                            index: 0,
                            title: "Vehicle Free Busy List",
                            icon: AssetConstants.ic_profile
                        ),
                        MenuItem(
                            isSelected: false,
                            index: 0,
                            title: "Notification",
                            icon: AssetConstants.ic_profile
                        ),
                        MenuItem(
                            isSelected: false,
                            index: 0,
                            title: "Reset Vehicle Login",
                            icon: AssetConstants.ic_profile
                        ),
                        MenuItem(
                            isSelected: false,
                            index: 0,
                            title: "Sign out",
                            icon: AssetConstants.ic_profile
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
}
