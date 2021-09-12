import 'dart:io';

import 'package:get/get.dart';
import 'package:go_share/data/models/vehicles/update_vehicle_details_request.dart';
import 'package:go_share/data/models/vehicles/update_vehicle_details_response.dart';
import 'package:go_share/data/repository/service_partner_repository.dart';

class UpdateVehicleDetailsController extends GetxController{

  final Repository repository = Repository();

  Future<UpdateVehicleDetailsResponse> updateVehicleDetails(UpdateVehicleDetailsRequest request, File? image) async{
    var response = await repository.updateVehicleDetails(request, image);
    return response;
  }


}