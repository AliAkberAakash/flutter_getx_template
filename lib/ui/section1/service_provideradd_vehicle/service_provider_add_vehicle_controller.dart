import 'dart:io';

import 'package:get/get.dart';
import 'package:go_share/data/models/vehicles/add_vehicle_request.dart';
import 'package:go_share/data/models/vehicles/ass_vehicle_response.dart';
import 'package:go_share/data/repository/service_partner_repository.dart';

class ServiceProviderAddVehicleController extends GetxController{

  final Repository repository = Get.find();

  Future<AddVehicleResponse> addVehicle(AddVehicleRequest request, File image) async{
    var response = await repository.addVehicle(request, image);
    return response;
  }

}