import 'package:flutter/material.dart';
import 'package:go_share/ui/common_widgets/large_headline_widget.dart';
import 'package:go_share/ui/common_widgets/text_field_headline.dart';
import 'package:go_share/ui/registration_request/widgets/status_chip.dart';
import 'package:go_share/ui/vehicle_free_busy_list/widgets/vehicle_free_busy_item.dart';
import 'package:go_share/utils/colors.dart';
import 'package:go_share/utils/dimens.dart';
import 'package:go_share/utils/spacers.dart';


class VehicleFreeBusyList extends StatefulWidget {
  const VehicleFreeBusyList();

  @override
  _VehicleFreeBusyListState createState() => _VehicleFreeBusyListState();
}

class _VehicleFreeBusyListState extends State<VehicleFreeBusyList> {
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
                      headline: "Vehicle free/busy list",
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
                            itemCount: 10,
                            itemBuilder: (ctx, idx) {
                              return VehicleFreeBusyItem(
                                  status: ChipStatus.FREE);
                            },
                          ),
                          ListView.builder(
                            itemCount: 10,
                            itemBuilder: (ctx, idx) {
                              return VehicleFreeBusyItem(
                                  status: ChipStatus.FREE);
                            },
                          ),
                          ListView.builder(
                            itemCount: 10,
                            itemBuilder: (ctx, idx) {
                              return VehicleFreeBusyItem(
                                  status: ChipStatus.BUSY);
                            },
                          ),
                        ],
                      ),
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
