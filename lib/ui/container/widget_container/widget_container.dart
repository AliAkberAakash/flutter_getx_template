import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:go_share/ui/container/UIConstants/Colors.dart';
import 'package:go_share/ui/container/UIConstants/GSWidgetStyles.dart';
import 'package:go_share/ui/container/UIConstants/Strings.dart';
import 'package:go_share/ui/container/about_us/about_us.dart';
import 'package:go_share/ui/container/faq/faq.dart';
import 'package:go_share/ui/container/home/home.dart';

class WidgetContainerView extends StatefulWidget {
  const WidgetContainerView({Key? key}) : super(key: key);

  @override
  _WidgetContainerViewState createState() => _WidgetContainerViewState();
}

class _WidgetContainerViewState extends State<WidgetContainerView> {
  late Widget body;
  late int selectedBottomBarIndex;

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
          _changeBottomBarIndex(1);
        },
      ),
      body: body,
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0.0,
        currentIndex: selectedBottomBarIndex,
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
    setState(() {
      selectedBottomBarIndex = index;

      switch (index) {
        case 0:
          body = HomeView();
          break;

        case 1:
          body = AboutUsView();
          break;

        case 2:
          body = FaqView();
          break;

        default:
          break;
      }
    });
  }
}
