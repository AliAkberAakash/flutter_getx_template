import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:go_share/ui/common_widgets/post_code_field.dart';
import 'package:go_share/ui/common_widgets/text_field_value_widget.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:get/get.dart';
import 'package:go_share/ui/book_a_bus/booking_controller.dart';
import 'package:go_share/ui/common_widgets/common_text_field.dart';
import 'package:go_share/ui/common_widgets/grey_button.dart';
import 'package:go_share/ui/common_widgets/large_headline_widget.dart';
import 'package:go_share/ui/common_widgets/positive_button.dart';
import 'package:go_share/ui/common_widgets/text_field_headline.dart';
import 'package:go_share/utils/colors.dart';
import 'package:go_share/utils/dimens.dart';
import 'package:go_share/utils/spacers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';

import 'payment_screen.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  _AddressScreenState createState() => _AddressScreenState();
}

const kGoogleApiKey = "AIzaSyBXu9gZE7h8rsOysVadX-XJ5WbvBwOKEqc";

class _AddressScreenState extends State<AddressScreen> {

  final homeScaffoldKey = GlobalKey<ScaffoldState>();
  final searchScaffoldKey = GlobalKey<ScaffoldState>();

  final _controller = BookingController(Get.find());
  final logger = Logger();

  final pickupPostCodeController = TextEditingController();
  final pickupAddressController = TextEditingController();
  String? pickupPostCodeErrorText;

  final dropOffPostCodeController = TextEditingController();
  final dropOffAddressController = TextEditingController();
  String? dropOffPostCodeErrorText;

  @override
  void initState() {

    pickupPostCodeController.addListener(() {
      var text = pickupPostCodeController.text;
      if(text.length==6){
        var postCode = int.parse(pickupPostCodeController.text);
        setState(() {
          if(postCode>=600000 && postCode<=689999){
            pickupPostCodeErrorText=null;
          }else{
            pickupPostCodeErrorText = "Invalid Post Code";
          }
        });
      }

    });

    dropOffPostCodeController.addListener(() {
      var text =dropOffPostCodeController.text;
      if(text.length==6){
        var postCode = int.parse(dropOffPostCodeController.text);
        setState(() {
          if(postCode>=600000 && postCode<=689999){
            dropOffPostCodeErrorText=null;
          }else{
            dropOffPostCodeErrorText = "Invalid Post Code";
          }
        });
      }

    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(dp20),
        child: ListView(
          physics: BouncingScrollPhysics(),
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
                          color: grey,
                        ),
                      ),
                      VSpacer10(),
                      Container(
                        height: dp5,
                        color: light_grey,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            VSpacer20(),
            InkWell(
              onTap: (){
                getPickupLocation();
              },
              child: TextFieldHeadline(headline: "Pickup Location*"),
            ),
            VSpacer20(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: PostCodeField(
                    errorText: pickupPostCodeErrorText,
                    type: TextInputType.number,
                    controller: pickupPostCodeController,
                    hint: "Postal Code",
                  ),
                ),
                HSpacer20(),
                Container(
                  width: 180,
                  child: TextFieldValueWidget(
                    headline: "Road Name",
                  ),
                )
              ],
            ),
            VSpacer20(),
            CommonTextField(
              onTap: (){
                getPickupLocation();
              },
              controller: pickupAddressController,
              hint: "Location",
            ),
            VSpacer20(),
            TextFieldHeadline(headline: "Pickup Remarks"),
            VSpacer20(),
            CommonTextField(
              controller: TextEditingController(),
            ),
            VSpacer40(),
            TextFieldHeadline(headline: "Drop Off Location*"),
            VSpacer20(),
            Row(
              children: [
                Flexible(
                  child: PostCodeField(
                    type: TextInputType.number,
                    errorText: dropOffPostCodeErrorText,
                    controller: dropOffPostCodeController,
                    hint: "Postal Code",
                  ),
                ),
                HSpacer20(),
                Container(
                  width: 180,
                  child: TextFieldValueWidget(
                    headline: "Road Name",
                  ),
                )
              ],
            ),
            VSpacer20(),
            CommonTextField(
              onTap: (){
                getDropOffLocation();
              },
              controller: dropOffAddressController,
              hint: "Location",
            ),
            VSpacer20(),
            TextFieldHeadline(headline: "Drop Off Remarks"),
            VSpacer20(),
            CommonTextField(
              controller: TextEditingController(),
            ),
            VSpacer20(),
            TextFieldHeadline(headline: "Write your comments"),
            VSpacer20(),
            TextFormField(
              maxLines: 3,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(dp10),
                  borderSide: BorderSide(color: grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(dp10),
                  borderSide: BorderSide(color: accent),
                ),
              ),
              cursorColor: grey,
            ),
            VSpacer20(),
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
                    text: "Next",
                    onClicked: () {
                      getPickupAddress();
                      //Get.to(PaymentScreen());
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


  getPickupLocation() async{
    Prediction? p = await PlacesAutocomplete.show(
        context: context,
        offset: 0,
        radius: 10000,
        types: [],
        strictbounds: false,
        apiKey: kGoogleApiKey,
        mode: Mode.fullscreen, // Mode.overlay
        language: "sg",
        components: [Component(Component.country, "sg")]);
    if(p!.matchedSubstrings.isNotEmpty){
      MatchedSubstring s = p.matchedSubstrings[0];
      setState(() {
        pickupAddressController.text=p.structuredFormatting!.mainText ;
      });
    }
    logger.d(p.structuredFormatting);
  }

  getDropOffLocation() async{
    Prediction? p = await PlacesAutocomplete.show(
        context: context,
        offset: 0,
        radius: 10000,
        types: [],
        strictbounds: false,
        apiKey: kGoogleApiKey,
        mode: Mode.fullscreen, // Mode.overlay
        language: "sg",
        region: "west",
        components: [
          Component(Component.country, "sg"),
        ]);
    if(p!.matchedSubstrings.isNotEmpty){
      MatchedSubstring s = p.matchedSubstrings[0];
      setState(() {
        dropOffAddressController.text=p.structuredFormatting!.mainText ;
      });
    }
    logger.d(p.structuredFormatting);
  }

  void onError(PlacesAutocompleteResponse response) {
    logger.d(response.errorMessage);
  }

  getPickupAddress() async{
    var response = await _controller.getAddressFromPO(pickupPostCodeController.text.trim());

    //if(response.status=="OK"){
      setState(() {
        pickupAddressController.text = response.results[0].formattedAddress;
      });
    //}

  }

}
