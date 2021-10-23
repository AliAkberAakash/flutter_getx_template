import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:go_share/data/models/booking/address_request.dart';
import 'package:go_share/ui/book_a_bus/address_search_page.dart';
import 'package:go_share/data/models/booking/info_request.dart';
import 'package:go_share/data/models/google_map/geocoding_response.dart';
import 'package:go_share/ui/book_a_bus/widgets/outlined_text.dart';
import 'package:go_share/ui/common_widgets/post_code_field.dart';
import 'package:go_share/util/lib/toast.dart';
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

  final InfoRequest infoRequest;

  const AddressScreen({Key? key, required this.infoRequest}) : super(key: key);

  @override
  _AddressScreenState createState() => _AddressScreenState(infoRequest);
}

const kGoogleApiKey = "AIzaSyBXu9gZE7h8rsOysVadX-XJ5WbvBwOKEqc";

class _AddressScreenState extends State<AddressScreen> {

  final InfoRequest infoRequest;

  final homeScaffoldKey = GlobalKey<ScaffoldState>();
  final searchScaffoldKey = GlobalKey<ScaffoldState>();

  final _controller = BookingController(Get.find());
  final logger = Logger();

  final pickupRemarksController = TextEditingController();
  final pickupPostCodeController = TextEditingController();
  final pickupAddressController = TextEditingController();
  String? pickupPostCodeErrorText;

  final dropOffRemarksController = TextEditingController();
  final dropOffPostCodeController = TextEditingController();
  final dropOffAddressController = TextEditingController();
  String? dropOffPostCodeErrorText;

  final commentsController  = TextEditingController();

  String pickupPostCode = "";
  String dropOffPostCode = "";

  double distance = 0.0;

  _AddressScreenState(this.infoRequest);

  @override
  void initState() {

    // pickupPostCodeController.addListener(
    //   () {
    //     var text = pickupPostCodeController.text;
    //     if(text.length==6){
    //       var postCode = int.parse(pickupPostCodeController.text);
    //       setState(
    //         () {
    //           if(postCode>=600000 && postCode<=689999){
    //             pickupPostCodeErrorText=null;
    //             _controller.getPickupAddressFromPO(postCode.toString());
    //           }else{
    //             pickupPostCodeErrorText = "Invalid Post Code";
    //           }
    //         },
    //       );
    //     }
    //   },
    // );

    // pickupAddressController.addListener(
    //   () {
    //     var text = pickupAddressController.text;
    //     _controller.getPickupAddressFromPO(text);
    //   },
    // );
    //
    // dropOffAddressController.addListener(
    //   () {
    //     var text = pickupAddressController.text;
    //     _controller.getPickupAddressFromPO(text);
    //   },
    // );

    /*dropOffPostCodeController.addListener(() {
      var text =dropOffPostCodeController.text;
      if(text.length==6){
        var postCode = int.parse(dropOffPostCodeController.text);
        setState(() {
          if(postCode>=600000 && postCode<=689999){
            dropOffPostCodeErrorText=null;
            _controller.getDropOffAddressFromPO(postCode.toString());
          }else{
            dropOffPostCodeErrorText = "Invalid Post Code";
          }
        });
      }

    });*/

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
              children: [
                Expanded(
                  child: Obx((){
                    return OutlinedText(
                      text: _controller.pickupAddress.value,
                      onClick: (){
                        Get.to(AddressSearchPage())?.then((value){
                          if(value!=null){
                            _controller.pickupAddress.value = value.address;
                            _controller.pickupPostalCode.value = value.postal;
                          }
                        });
                      },
                      //text: pickupAddressController.text,
                    );
                  }),
                ),
                // HSpacer10(),
                // MaterialButton(
                //   shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.all(
                //         Radius.circular(
                //             dp10
                //         )
                //     ),
                //   ),
                //   height: dp48,
                //   minWidth: dp48,
                //   color: accent,
                //   child: Icon(
                //     Icons.search,
                //     color: white,
                //   ),
                //   onPressed: (){
                //     _controller.getPickupAddressFromPO(pickupAddressController.text);
                //   },
                // )
              ],
            ),
            VSpacer20(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Obx((){

                  //  pickupPostCodeController.text = _controller.pickupPostalCode.value;

                    return OutlinedText(
                      text: _controller.pickupPostalCode.value,
                    );

                    // return PostCodeField(
                    //   errorText: pickupPostCodeErrorText,
                    //   type: TextInputType.number,
                    //   controller: pickupPostCodeController,
                    //   hint: "Postal Code",
                    // );
                  }),
                ),
                HSpacer20(),
                Spacer(),
                // Obx((){
                //   return Container(
                //     width: 180,
                //     child: TextFieldValueWidget(
                //       headline: _controller.pickupAddress.value,
                //     ),
                //   );
                // })
              ],
            ),
            VSpacer20(),
            Row(
              children: [
                Flexible(child: TextFieldHeadline(headline: "Pickup Remarks")),
                HSpacer5(),
                Tooltip(
                  preferBelow: false,
                  waitDuration: Duration(milliseconds: 0),
                  message: "bla bla",
                  child: Text(
                    "(i)",
                    style: GoogleFonts.robotoMono(color: accent, fontSize: dp15),
                  ),
                )
              ],
            ),
            VSpacer20(),
            CommonTextField(
              controller: pickupRemarksController,
            ),
            VSpacer40(),
            TextFieldHeadline(headline: "Drop Off Location*"),
            VSpacer20(),
            Row(
              children: [
                Expanded(
                  child: Obx((){
                    return OutlinedText(
                      text: _controller.dropOffAddress.value,
                      onClick: (){
                        Get.to(AddressSearchPage())?.then((value){
                          if(value!=null){
                            _controller.dropOffAddress.value = value.address;
                            _controller.dropOffPostalCode.value = value.postal;
                          }
                        });
                      },
                      //text: pickupAddressController.text,
                    );
                  }),
                ),
                // HSpacer10(),
                // MaterialButton(
                //   shape: RoundedRectangleBorder(
                //     borderRadius: BorderRadius.all(
                //         Radius.circular(
                //             dp10
                //         )
                //     ),
                //   ),
                //   height: dp48,
                //   minWidth: dp48,
                //   color: accent,
                //   child: Icon(
                //     Icons.search,
                //     color: white,
                //   ),
                //   onPressed: (){
                //     _controller.getDropOffAddressFromPO(dropOffAddressController.text);
                //   },
                // ),
              ],
            ),
            VSpacer20(),
            Row(
              children: [
                Expanded(
                  child: Obx((){

                    //dropOffPostCodeController.text = _controller.dropOffPostalCode.value;

                    return OutlinedText(
                      text: _controller.dropOffPostalCode.value,
                    );

                    // return PostCodeField(
                    //   type: TextInputType.number,
                    //   //errorText: dropOffPostCodeErrorText,
                    //   controller: dropOffPostCodeController,
                    //   hint: "Postal Code",
                    // );
                  }),
                ),
                HSpacer20(),
                Spacer(),
                // Obx((){
                //   return Container(
                //     width: 180,
                //     child: TextFieldValueWidget(
                //       headline: _controller.dropOffAddress.value,
                //     ),
                //   );
                // }),
              ],
            ),
            VSpacer20(),
            Row(
              children: [
                Flexible(child: TextFieldHeadline(headline: "Drop Off Remarks")),
                HSpacer5(),
                Tooltip(
                  preferBelow: false,
                  waitDuration: Duration(milliseconds: 0),
                  message: "bla bla",
                  child: Text(
                    "(i)",
                    style: GoogleFonts.robotoMono(color: accent, fontSize: dp15),
                  ),
                )
              ],
            ),
            VSpacer20(),
            CommonTextField(
              controller: dropOffRemarksController,
            ),
            VSpacer20(),
            TextFieldHeadline(headline: "Write your comments"),
            VSpacer20(),
            TextFormField(
              controller: commentsController,
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
                      if(validate()){

                        var addressRequest = AddressRequest(
                          pickupPostalCode: pickupPostCodeController.text,
                          pickupLocation: pickupAddressController.text,
                          pickupRemarks: pickupRemarksController.text,
                          dropOffPostalCode: dropOffPostCodeController.text,
                          dropOffLocation: dropOffAddressController.text,
                          dropOffRemarks: dropOffRemarksController.text,
                          comments: commentsController.text,
                          distance: distance
                        );

                        Get.to(
                          PaymentScreen(
                            addressRequest: addressRequest,
                            infoRequest: infoRequest,
                            dropOffResponse: _controller.dropOffResponse,
                            pickupResponse: _controller.pickUpResponse,
                          ),
                        );
                      }else{
                        ToastUtil.show("Please fill required fields");
                      }
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

  bool validate(){
    calculateDistance();
    // if(pickupPostCode != pickupPostCodeController.text) {
    //   ToastUtil.show("Post code does not match with pickup address");
    //   return false;
    // }
    //
    // if(dropOffPostCode != dropOffPostCodeController.text){
    //   ToastUtil.show("Post code does not match with drop off address");
    //   return false;
    // }

    return pickupPostCodeController.text.isNotEmpty
        && pickupAddressController.text.isNotEmpty
        && dropOffPostCodeController.text.isNotEmpty
        && dropOffAddressController.text.isNotEmpty;

    return true;
  }

  getPickupLocation() async{
    Prediction? p = await PlacesAutocomplete.show(
      startText: pickupAddressController.text,
      context: context,
      offset: 0,
      radius: 10000,
      types: [],
      strictbounds: false,
      apiKey: kGoogleApiKey,
      mode: Mode.fullscreen, // Mode.overlay
      language: "sg",
      components: [Component(Component.country, "sg")],
    );

    logger.d("${p?.toJson()}");
    logger.d("${p?.structuredFormatting?.toJson()}");
    logger.d("${p?.types}");
    logger.d("${p?.terms}");

    GeoCodingResponse response = await _controller.getPostCodeFromAddress(p?.description ?? "");
    if(response.results.isNotEmpty){
      logger.d(response.results.length);
      logger.d(response.results);
      logger.d(response.results[0].formattedAddress);

      var address = response.results[0].formattedAddress;
      var postCode = address.substring(response.results[0].formattedAddress.length-6);
      logger.d("the post code is $postCode");
      pickupPostCode = postCode;
    }

    if(p != null)
      setState(() {
        pickupAddressController.text=p.description ?? "" ;
      });

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

    GeoCodingResponse response = await _controller.getPostCodeFromAddress(p?.description ?? "");
    if(response.results.isNotEmpty){
      logger.d(response.results.length);
      logger.d(response.results);
      logger.d(response.results[0].formattedAddress);

      var address = response.results[0].formattedAddress;
      var postCode = address.substring(response.results[0].formattedAddress.length-6);
      logger.d("the post code is $postCode");
      dropOffPostCode = postCode;
    }


    if(p!=null){
      setState(() {
        dropOffAddressController.text=p.description ?? "";
      });
    }
  }

  void onError(PlacesAutocompleteResponse response) {
    logger.d(response.errorMessage);
  }

  getPickupAddress() async{
    var response = await _controller.getPickupAddressFromPO(pickupPostCodeController.text.trim());

    //if(response.status=="OK"){
      setState(() {
        pickupAddressController.text = response.results[0].formattedAddress;
      });
    //}

  }


  calculateDistance(){
    if(_controller.pickUpResponse.found == 1 && _controller.dropOffResponse.found == 1){
      try{
        var pickupLat =
        double.parse(_controller.pickUpResponse.results[0].latitude);
        var pickupLng =
        double.parse(_controller.pickUpResponse.results[0].longitude);

        var dropOffLat =
        double.parse(_controller.dropOffResponse.results[0].latitude);
        var dropOffLng = double.parse(
            _controller.dropOffResponse.results[0].longitude);

        distance = calculateDist(
          pickupLat,
          pickupLng,
          dropOffLat,
          dropOffLng,
        );

        logger.d("distance : $distance");

      }catch(e){
        logger.d(e);
      }
    }
  }

  double calculateDist(lat1, lon1, lat2, lon2){
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 - c((lat2 - lat1) * p)/2 +
        c(lat1 * p) * c(lat2 * p) *
            (1 - c((lon2 - lon1) * p))/2;
    return 12742 * asin(sqrt(a));
  }


}
