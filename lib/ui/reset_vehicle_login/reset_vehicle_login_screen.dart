import 'package:flutter/material.dart';
import 'package:nilam/ui/common_widgets/large_headline_widget.dart';
import 'package:nilam/ui/common_widgets/text_field_headline.dart';
import 'package:nilam/ui/service_provider/widgets/common_text_field.dart';
import 'package:nilam/ui/service_provider/widgets/positive_button.dart';
import 'package:nilam/utils/dimens.dart';
import 'package:nilam/utils/spacers.dart';

class ResetVehicleLoginScreen extends StatefulWidget {
  const ResetVehicleLoginScreen({Key? key}) : super(key: key);

  @override
  _ResetVehicleLoginScreenState createState() => _ResetVehicleLoginScreenState();
}

class _ResetVehicleLoginScreenState extends State<ResetVehicleLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
          builder: (ctx, constraints){
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
                    hint: "Service Partner Password",
                  ),
                  VSpacer20(),
                  CommonTextField(
                    controller: TextEditingController(),
                    hint: "Service Partner Password",
                  ),
                  VSpacer20(),
                  CommonTextField(
                    controller: TextEditingController(),
                    hint: "Service Partner Password",
                  ),
                  VSpacer60(),
                  PositiveButton(text: "Submit", onClicked: (){})
                ],
              ),
            );
          },
      ),
    );
  }
}
