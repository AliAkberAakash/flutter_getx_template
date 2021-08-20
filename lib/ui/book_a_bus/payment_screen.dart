import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:go_share/ui/common_widgets/grey_button.dart';
import 'package:go_share/ui/common_widgets/large_headline_widget.dart';
import 'package:go_share/ui/common_widgets/text_field_headline.dart';
import 'package:go_share/ui/common_widgets/text_field_value_widget.dart';
import 'package:go_share/ui/service_provider/widgets/positive_button.dart';
import 'package:go_share/utils/colors.dart';
import 'package:go_share/utils/dimens.dart';
import 'package:go_share/utils/spacers.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentScreen extends StatefulWidget {


  PaymentScreen({Key? key}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  var selectedPayment = "p";
  late ExpandableController expandableController;

  var isExpanded = false;

  @override
  void initState() {
    expandableController = ExpandableController(
        initialExpanded: false,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(dp20),
        child: ListView(
          children: [
            VSpacer20(),
            LargeHeadlineWidget(headline: "Book a Bus"),
            VSpacer40(),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "01. Info",
                        style: GoogleFonts.manrope(
                          color: accent,
                        ),
                      ),
                      VSpacer10(),
                      Container(
                        height: dp5,
                        color: accent,
                      ),
                    ],
                  ),
                ),
                HSpacer5(),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "02. Address",
                        style: GoogleFonts.manrope(
                          color: accent,
                        ),
                      ),
                      VSpacer10(),
                      Container(
                        height: dp5,
                        color: accent,
                      ),
                    ],
                  ),
                ),
                HSpacer5(),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "03. Payment",
                        style: GoogleFonts.manrope(
                          color: accent,
                        ),
                      ),
                      VSpacer10(),
                      Container(
                        height: dp5,
                        color: accent,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            VSpacer20(),
            Container(
              padding: EdgeInsets.all(dp10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: grey,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(dp10),
                ),
              ),
              child: Row(
                children: [
                  Text(
                    "Total Amount",
                    style: GoogleFonts.manrope(
                      color: grey
                    ),
                  ),
                  Spacer(),
                  Text(
                    "47\$",
                    style: GoogleFonts.manrope(
                      color: accent,
                      fontSize: dp20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            VSpacer20(),
            TextFieldHeadline(headline: "Payment Method"),
            VSpacer20(),
            Row(
              children: [
                Radio<String>(
                  activeColor: accent,
                  value: "p",
                  groupValue: selectedPayment,
                  onChanged: (String? value){
                    selectedPayment = value!;
                  },
                ),
                HSpacer20(),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(dp10),
                    decoration: BoxDecoration(
                      color: light_grey_white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(dp10),
                      ),
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Credit Card",
                          style: GoogleFonts.manrope(
                            color: darkText,
                          ),
                        ),
                        Spacer(),
                        Image.asset(
                          "images/ic_visa.png",
                          height: dp30,
                          width: dp50,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            VSpacer20(),
            Row(
              children: [
                Radio<String>(
                  activeColor: accent,
                  value: "v",
                  groupValue: selectedPayment,
                  onChanged: (String? value){
                    selectedPayment = value!;
                  },
                ),
                HSpacer20(),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(dp10),
                    decoration: BoxDecoration(
                      color: light_grey_white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(dp10),
                      ),
                    ),
                    child: Row(
                      children: [
                        Text(
                          "Paypal",
                          style: GoogleFonts.manrope(
                            color: darkText,
                          ),
                        ),
                        Spacer(),
                        Image.asset(
                          "images/ic_paypal.png",
                          height: dp30,
                          width: dp50,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            VSpacer40(),
            _expandableHeader(),
            ExpandablePanel(
              controller: expandableController,
              collapsed: Container(),
              expanded: _getDescription(),
            ),
            VSpacer40(),
            Row(
              children: [
                Expanded(
                  child: GreyButton(
                    title: "Back",
                  ),
                ),
                HSpacer10(),
                Expanded(
                  child: PositiveButton(text: "Next", onClicked: () {

                  }),
                ),
              ],
            ),
            VSpacer40(),
            VSpacer40(),
          ],
        ),
      ),
    );

  }

  Widget _expandableHeader(){
    return Container(
      padding: EdgeInsets.all(dp10),
      decoration: BoxDecoration(
        color: light_grey_white,
        borderRadius: BorderRadius.all(
          Radius.circular(dp10),
        ),
      ),
      child: Row(
        children: [
          Text(
            "View Order Info",
            style: GoogleFonts.manrope(
                color: darkText,
                fontSize: 16,
                fontWeight: FontWeight.bold
            ),
          ),
          Spacer(),
          InkWell(
            onTap: (){
              setState(() {
                isExpanded = !isExpanded;
              });
              expandableController.toggle();
            },
            child: Text(
              isExpanded ? "- Less" : "+ Show",
              style: GoogleFonts.manrope(
                color: accent,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _getDescription(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        VSpacer20(),
        TextFieldHeadline(headline: "Order ID"),
        VSpacer10(),
        TextFieldValueWidget(headline: '#9070979234'),
        VSpacer20(),
        TextFieldHeadline(headline: "Total Seat"),
        VSpacer10(),
        TextFieldValueWidget(headline: '5 Seats'),
        VSpacer20(),
        TextFieldHeadline(headline: "Child Name"),
        VSpacer10(),
        TextFieldValueWidget(headline: 'John Doe WIlliam'),
        VSpacer20(),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFieldHeadline(headline: "Start Date"),
                VSpacer10(),
                TextFieldValueWidget(headline: '19th July, 2021'),
              ],
            ),
            HSpacer40(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFieldHeadline(headline: "Time"),
                VSpacer10(),
                TextFieldValueWidget(headline: '10:00 PM'),
              ],
            )
          ],
        ),
        VSpacer20(),
        TextFieldHeadline(headline: "End Date"),
        VSpacer10(),
        TextFieldValueWidget(headline: '28 July, 2021'),
        VSpacer20(),
        TextFieldHeadline(headline: "Pickup Location"),
        VSpacer10(),
        TextFieldValueWidget(headline: 'Block 372 Bukit Batok Street 31 #01-372, 650372 Singapore'),
        VSpacer20(),
        TextFieldHeadline(headline: "Postal Code"),
        VSpacer10(),
        TextFieldValueWidget(headline: '650372 Singapore'),
        VSpacer20(),
        TextFieldHeadline(headline: "Pickup Remark"),
        VSpacer10(),
        TextFieldValueWidget(headline: 'Batok Street 31 #01-372, 650372 Singapore'),
        VSpacer20(),
        TextFieldHeadline(headline: "Drop-Off Location"),
        VSpacer10(),
        TextFieldValueWidget(headline: 'Block 372 Bukit Batok Street 31 #01-372, 650372 Singapore'),
        VSpacer20(),
        TextFieldHeadline(headline: "Postal Code"),
        VSpacer10(),
        TextFieldValueWidget(headline: '650372 Singapore'),
        VSpacer20(),
        TextFieldHeadline(headline: "Drop-Off Remark"),
        VSpacer10(),
        TextFieldValueWidget(headline: 'Batok Street 31 #01-372, 650372 Singapore'),
        VSpacer20(),

      ],
    );
  }
}
