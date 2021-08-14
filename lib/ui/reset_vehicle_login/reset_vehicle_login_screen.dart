import 'package:flutter/material.dart';
import 'package:go_share/ui/common_widgets/large_headline_widget.dart';
import 'package:go_share/ui/common_widgets/text_field_headline.dart';
import 'package:go_share/ui/service_provider/widgets/common_text_field.dart';
import 'package:go_share/ui/service_provider/widgets/positive_button.dart';
import 'package:go_share/utils/dimens.dart';
import 'package:go_share/utils/spacers.dart';

class ResetVehicleLoginScreen extends StatefulWidget {
  const ResetVehicleLoginScreen({Key? key}) : super(key: key);

  @override
  _ResetVehicleLoginScreenState createState() =>
      _ResetVehicleLoginScreenState();
}

class _ResetVehicleLoginScreenState extends State<ResetVehicleLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (ctx, constraints) {
          return Container(
            padding: EdgeInsets.all(dp20),
            child: ListView(
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
                CommonTextField(
                  controller: TextEditingController(),
                  hint: "Service Partner password",
                ),
                VSpacer20(),
                CommonTextField(
                  controller: TextEditingController(),
                  hint: "New password",
                ),
                VSpacer20(),
                CommonTextField(
                  controller: TextEditingController(),
                  hint: "Confirm new password",
                ),
                VSpacer60(),
                PositiveButton(text: "Submit", onClicked: () {})
              ],
            ),
          );
        },
      ),
    );
  }
}
