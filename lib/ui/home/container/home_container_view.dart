import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:go_share/constants.dart';
import 'package:go_share/ui/home/container/home_container_controller.dart';

import '../../../constants.dart';

class HomeContainerView extends GetView<HomeContainerController> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: systemUiOverlayStyleGlobal.copyWith(
        systemNavigationBarColor: Get.theme.primaryColor,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: colorPageBackground,
        extendBodyBehindAppBar: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            size: 40.0,
          ),
          onPressed: () {},
        ),
        bottomNavigationBar: buildBottomBar(),
        body: GetBuilder<HomeContainerController>(
          id: 'body',
          builder: (controller) {
            return controller.body;
          },
        ),
      ),
    );
  }

  Widget buildBottomBar() {
    return GetBuilder<HomeContainerController>(
      id: 'bottom_bar',
      builder: (HomeContainerController viewController) {
        return BottomNavigationBar(
          elevation: 0.0,
          currentIndex: viewController.selectedBottomBarIndex,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          showSelectedLabels: true,
          items: [
            getBottomBarItem(
              viewController,
              'images/ic_home.png',
              'home'.tr,
              0,
            ),
            getBottomBarItem(
              viewController,
              'images/ic_my_auction.png',
              'my_auction'.tr,
              1,
            ),
            getBottomBarItem(
              viewController,
              'images/ic_notifications.png',
              'notifications'.tr,
              2,
              hasBatch: true,
            ),
            getBottomBarItem(
              viewController,
              'images/ic_profile.png',
              'profile'.tr,
              3,
            ),
          ],
          onTap: (index) {
            viewController.changeBottomBarIndex(index);
          },
        );
      },
    );
  }

  BottomNavigationBarItem getBottomBarItem(
    HomeContainerController viewController,
    String imagePath,
    String title,
    int position, {
    bool hasBatch = false,
  }) {
    final theme = Get.theme.bottomNavigationBarTheme;
    return BottomNavigationBarItem(
      icon: imagePath.trim().isNotEmpty
          ? Stack(
              alignment: Alignment.topRight,
              children: [
                (position == viewController.selectedBottomBarIndex
                    ? Image.asset(
                        imagePath,
                        fit: BoxFit.fitHeight,
                        height: 32.0,
                        color: theme.selectedItemColor,
                      )
                    : Image.asset(
                        imagePath,
                        fit: BoxFit.fitHeight,
                        height: 32.0,
                        color: theme.unselectedItemColor,
                      )),
                if (hasBatch && viewController.notificationCount > 0)
                  Container(
                    width: 20.0,
                    height: 20.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: colorLightOrange1,
                      border: Border.fromBorderSide(
                        BorderSide(
                          width: 2.0,
                          color: theme.backgroundColor!,
                        ),
                      ),
                    ),
                    child: Center(
                      child: Obx(
                        () => Text(
                          "${viewController.notificationCount.value}",
                          style: Get.theme.textTheme.caption!.copyWith(
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
              ],
            )
          : SizedBox(height: 32.0),
      label: title,
    );
  }
}
