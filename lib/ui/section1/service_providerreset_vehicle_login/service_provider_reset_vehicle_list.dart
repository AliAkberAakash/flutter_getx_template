import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:go_share/core/ui/error_screen.dart';
import 'package:go_share/core/ui/loading_widget.dart';
import 'package:go_share/ui/common_widgets/large_headline_widget.dart';
import 'package:go_share/ui/common_widgets/text_field_headline.dart';
import 'package:go_share/ui/section1/service_provider_vehicle_free_busy_list/widgets/vehicle_free_busy_item.dart';
import 'package:go_share/ui/section1/service_providerreset_vehicle_login/widgets/reset_vehicle_item.dart';
import 'package:go_share/ui/section1/service_provider_vehicle_list/widgets/status_chip.dart';
import 'package:go_share/utils/colors.dart';
import 'package:go_share/utils/dimens.dart';
import 'package:go_share/utils/spacers.dart';

import 'service_provider_reset_vehicle_login_controller.dart';

class ResetVehicleList extends StatefulWidget {
  const ResetVehicleList({Key? key}) : super(key: key);

  @override
  _ResetVehicleListState createState() => _ResetVehicleListState();
}

class _ResetVehicleListState extends State<ResetVehicleList> {

  final _controller = ServiceProviderResetVehicleController();

  @override
  void initState() {
    super.initState();
    _controller.getVehicleList();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: SafeArea(
          child: LayoutBuilder(
            builder: (ctx, constraints) {
              return Padding(
                padding: EdgeInsets.all(dp20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LargeHeadlineWidget(
                      headline: "Reset vehicle login",
                    ),
                    VSpacer10(),
                    SizedBox(
                      width: constraints.maxWidth * 0.6,
                      child: TextFieldHeadline(
                        headline: "It’s time to rock n role!"
                            " Let’s get started now.",
                      ),
                    ),
                    VSpacer40(),
                    Expanded(
                      child: Obx((){
                        var response = _controller.vehicleListResponse.value;

                        if(response==null){
                          return LoadingWidget();
                        }else{
                          if(response.data==null){
                            return ErrorScreen();
                          }
                          else{
                            var allVehiclesList = response.data!.vehicles;
                            var busyList = response.data!.vehicles.where((element) => element.availableStatus=="Busy").toList();
                            var freeList = response.data!.vehicles.where((element) => element.availableStatus=="Free").toList();
                            return Column(
                              children: [
                                Container(
                                  child: TabBar(
                                    indicatorColor: accent,
                                    labelColor: accent,
                                    unselectedLabelColor: grey,
                                    tabs: [
                                      Tab(
                                        text: "All",
                                      ),
                                      Tab(
                                        text: "Free",
                                      ),
                                      Tab(
                                        text: "Busy",
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(
                                  color: greyBorder,
                                  height: 2,
                                ),
                                VSpacer20(),
                                Expanded(
                                  child: TabBarView(
                                    children: [
                                      ListView.builder(
                                        itemCount: allVehiclesList.length,
                                        itemBuilder: (ctx, idx) {
                                          return ResetVehicleItem(
                                            vehicle: allVehiclesList[idx],
                                          );
                                        },
                                      ),
                                      ListView.builder(
                                        itemCount: freeList.length,
                                        itemBuilder: (ctx, idx) {
                                          return ResetVehicleItem(
                                            vehicle: freeList[idx],
                                          );
                                        },
                                      ),
                                      ListView.builder(
                                        itemCount: busyList.length,
                                        itemBuilder: (ctx, idx) {
                                          return ResetVehicleItem(
                                            vehicle: busyList[idx],
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                          }
                        }
                      }),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
