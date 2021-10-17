import 'package:get/get.dart';
import 'package:go_share/data/models/booking/booking_request.dart';
import 'package:go_share/data/models/booking/booking_response.dart';
import 'package:go_share/data/models/booking/child_list_response.dart';
import 'package:go_share/data/models/google_map/geocoding_response.dart';
import 'package:go_share/data/models/one_map/one_map_response.dart';
import 'package:go_share/data/repository/service_partner_repository.dart';
import 'package:logger/logger.dart';

class BookingController extends GetxController{

  final Repository repository;

  BookingController(this.repository);

  var childListResponse = Rx<ChildrenListResponse?>(null);
  var pickupAddressResponse = Rx<GeoCodingResponse?>(null);

  late OneMapResponse pickUpResponse;
  late OneMapResponse dropOffResponse;

  var pickupAddress = "".obs;
  var pickupPostalCode = "".obs;
  var dropOffAddress = "".obs;
  var dropOffPostalCode = "".obs;
  var logger = Logger();

  // getPickupAddressFromPO(String postalCode) async{
  //   var response = await repository.getGeoCodingResponse(postalCode);
  //   logger.d(response.status);
  //   if(response.results.isNotEmpty){
  //     var results = response.results;
  //     if(results[0].addressComponents.isNotEmpty){
  //       var addressComponents = results[0].addressComponents;
  //       for(var address in addressComponents){
  //         print(address.longName);
  //         if(address.types.contains("neighborhood")){
  //           pickupAddress.value = address.longName;
  //           return;
  //         }
  //       }
  //       pickupAddress.value = "Not found";
  //     }else {
  //       logger.d("Address component is empty");
  //       pickupAddress.value = "Not found";
  //     }
  //   }else {
  //     logger.d("result component is empty");
  //     pickupAddress.value = "Not found";
  //   }
  // }

  getPickupAddressFromPO(String postalCode) async{
    var response = await repository.getAddressFromCoordinates(postalCode);
    logger.d(response.found);
    pickUpResponse = response;
    if(response.found!=0){
      if(response.results.isNotEmpty) {
        var results = response.results;
        pickupAddress.value = results[0].address;
        pickupPostalCode.value = results[0].postal;
      }
    }else {
      logger.d("result component is empty");
      pickupAddress.value = "Not found";
    }
  }

  getDropOffAddressFromPO(String postalCode) async{
    var response = await repository.getAddressFromCoordinates(postalCode);
    logger.d(response.found);
    dropOffResponse = response;
    if(response.found==1){
      if(response.results.isNotEmpty) {
        var results = response.results;
        dropOffAddress.value = results[0].address;
        dropOffPostalCode.value = results[0].postal;
      }
    }else {
      logger.d("result component is empty");
      dropOffAddress.value = "Not found";
    }
  }

  // getDropOffAddressFromPO(String postalCode) async{
  //   var response = await repository.getGeoCodingResponse(postalCode);
  //   logger.d(response.status);
  //   if(response.results.isNotEmpty){
  //     var results = response.results;
  //     if(results[0].addressComponents.isNotEmpty){
  //       var addressComponents = results[0].addressComponents;
  //       for(var address in addressComponents){
  //         print(address.longName);
  //         if(address.types.contains("neighborhood")){
  //           dropOffAddress.value = address.longName;
  //           return;
  //         }
  //       }
  //       dropOffAddress.value = "Not found";
  //     }else {
  //       logger.d("Address component is empty");
  //       dropOffAddress.value = "Not found";
  //     }
  //   }else {
  //     logger.d("result component is empty");
  //     dropOffAddress.value = "Not found";
  //   }
  // }

  Future<GeoCodingResponse> getPostCodeFromAddress(String address) async{
    return await repository.getPostCodeFromAddress(address);
  }

  Future<BookingResponse> placeBooking(BookingRequest request) async{
    return await repository.placeBooking(request);
  }

  getChildList() async{
    if(await repository.isGeneralUserLoggedIn()) {
      var response = await repository.getChildList();
      childListResponse.value = response;
    }else{
      childListResponse.value = ChildrenListResponse(
        success: true,
        msg: "Not logged in",
      );
    }
  }

}