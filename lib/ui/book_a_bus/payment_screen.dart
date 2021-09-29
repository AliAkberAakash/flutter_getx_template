import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_share/data/models/booking/address_request.dart';
import 'package:go_share/data/models/booking/info_request.dart';
import 'package:go_share/ui/book_a_bus/invoice_screen.dart';
import 'package:go_share/ui/common_widgets/grey_button.dart';
import 'package:go_share/ui/common_widgets/large_headline_widget.dart';
import 'package:go_share/ui/common_widgets/outlined_material_button.dart';
import 'package:go_share/ui/common_widgets/positive_button.dart';
import 'package:go_share/ui/common_widgets/text_field_headline.dart';
import 'package:go_share/ui/common_widgets/text_field_value_widget.dart';
import 'package:go_share/ui/container/UIConstants/Colors.dart';
import 'package:go_share/utils/colors.dart';
import 'package:go_share/utils/constants.dart';
import 'package:go_share/utils/date_time_utils.dart';
import 'package:go_share/utils/dimens.dart';
import 'package:go_share/utils/spacers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';

class PaymentScreen extends StatefulWidget {

  final AddressRequest addressRequest;
  final InfoRequest infoRequest;

  PaymentScreen({
    Key? key,
    required this.addressRequest,
    required this.infoRequest,
  }) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState(addressRequest, infoRequest);
}

class _PaymentScreenState extends State<PaymentScreen> {

  final AddressRequest addressRequest;
  final InfoRequest infoRequest;

  var selectedPayment = "p";
  late ExpandableController expandableController;

  var isExpanded = false;

  _PaymentScreenState(this.addressRequest, this.infoRequest);

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
                    "S\$47.00",
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
                    setState(() {
                      selectedPayment = value!;
                    });
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
                    setState(() {
                      selectedPayment = value!;
                    });
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
                    onClick: (){
                      Get.back();
                    },
                    title: "Back",
                  ),
                ),
                HSpacer10(),
                Expanded(
                  child: PositiveButton(
                    text: "Submit",
                    onClicked: () {
                      showSuccessSheet(context);
                    },
                  ),
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
    return Padding(
      padding: EdgeInsets.only(left: dp10),
      child: Column(
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
          TextFieldHeadline(headline: "Total Distance"),
          VSpacer10(),
          TextFieldValueWidget(headline: '30 Km'),
          VSpacer20(),
          TextFieldHeadline(headline: "Cost per Kilometer"),
          VSpacer10(),
          TextFieldValueWidget(headline: '\$14/km'),
          VSpacer20(),
          TextFieldHeadline(headline: "Total Travel Number"),
          VSpacer10(),
          TextFieldValueWidget(headline: '12'),
          VSpacer20(),
          _getChildPart(),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFieldHeadline(headline: "Start Date"),
                  VSpacer10(),
                  TextFieldValueWidget(headline: infoRequest.startDate),
                ],
              ),
              HSpacer40(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFieldHeadline(headline: "Time"),
                  VSpacer10(),
                  TextFieldValueWidget(headline: infoRequest.pickupTime),
                ],
              )
            ],
          ),
          VSpacer20(),
          TextFieldHeadline(headline: "End Date"),
          VSpacer10(),
          TextFieldValueWidget(headline: infoRequest.endDate),
          VSpacer20(),
          TextFieldHeadline(headline: "Pickup Location"),
          VSpacer10(),
          TextFieldValueWidget(headline: addressRequest.pickupLocation),
          VSpacer20(),
          TextFieldHeadline(headline: "Postal Code"),
          VSpacer10(),
          TextFieldValueWidget(headline: addressRequest.pickupPostalCode),
          VSpacer20(),
          TextFieldHeadline(headline: "Pickup Remark"),
          VSpacer10(),
          TextFieldValueWidget(headline: addressRequest.pickupRemarks),
          VSpacer20(),
          TextFieldHeadline(headline: "Drop-Off Location"),
          VSpacer10(),
          TextFieldValueWidget(headline: addressRequest.dropOffLocation),
          VSpacer20(),
          TextFieldHeadline(headline: "Postal Code"),
          VSpacer10(),
          TextFieldValueWidget(headline: addressRequest.dropOffPostalCode),
          VSpacer20(),
          TextFieldHeadline(headline: "Drop-Off Remark"),
          VSpacer10(),
          TextFieldValueWidget(headline: addressRequest.dropOffRemarks),
          VSpacer20(),

        ],
      ),
    );
  }

  Widget _getChildPart(){

    var childList = infoRequest.childNames;

    Logger().d(childList.length);

    return Column(
      children: [
        for(var child in childList)
          _getChildWidget(child)
      ],
    );
  }

  Widget _getChildWidget(String name){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFieldHeadline(headline: "Child Name"),
        VSpacer10(),
        TextFieldValueWidget(headline: name),
        VSpacer20(),
      ],
    );
  }

  void showSuccessSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (builder) {
          return new Container(
            height: 450.0,
            color: Color(0xFF737373), //could change this to Color(0xFF737373),
            //so you don't have to change MaterialApp canvasColor
            child: new Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(20.0),
                        topRight: const Radius.circular(20.0))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SvgPicture.asset(
                      AssetConstants.successfulIcon,
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            "Thank you",
                            style: GoogleFonts.manrope(
                              color: GSColors.green_secondary,
                              fontSize: dp25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            "You booking has been submitted. An admin will approved it soon",
                            style: GoogleFonts.manrope(
                              color: GSColors.text_secondary,
                              fontSize: dp14,
                              fontWeight: FontWeight.normal,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: dp30),
                      child: Row(
                        children: [
                          Expanded(
                            child: PositiveButton(
                              text: "My Booking List",
                              onClicked: (){
                                Get.back();
                                Get.back();
                                Get.back();
                                Get.back();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: dp30),
                      child: Row(
                        children: [
                          Expanded(
                            child: OutlinedMaterialButton(
                              onClick: (){
                                Get.back();
                                Get.to(
                                  InvoiceScreen(),
                                );
                              },
                              text: "View Invoice",
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )),
          );
        });
  }


}
