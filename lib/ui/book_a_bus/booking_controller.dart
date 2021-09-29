import 'package:get/get.dart';
import 'package:go_share/data/models/google_map/geocoding_response.dart';
import 'package:go_share/data/repository/service_partner_repository.dart';

class BookingController extends GetxController{

  final Repository repository;

  BookingController(this.repository);

  Future<GeoCodingResponse> getAddressFromPO(String postalCode) async{
    return await repository.getGeoCodingResponse(postalCode);
  }

}