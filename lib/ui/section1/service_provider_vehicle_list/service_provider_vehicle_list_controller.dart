import 'package:get/get.dart';
import 'package:go_share/data/models/vehicles/vehicle_list_response.dart';
import 'package:go_share/data/repository/service_partner_repository.dart';

class ServiceProviderVehicleListController extends GetxController{

  final Repository repository = Get.find();

  var vehicleListResponse = Rx<VehicleListResponse?>(null);

  getVehicleList() async{
    var response = await repository.getVehicleList();
    vehicleListResponse.value = response;
  }


}