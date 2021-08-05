import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Scaffold(
          floatingActionButton: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FloatingActionButton(
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
              height: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text("Home"),
                    ),
                  ),
                  InkWell(
                    onTap: () => _showMenu(constraints.maxHeight),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text("Menu"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
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
