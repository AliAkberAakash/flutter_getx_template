import 'package:get/get.dart';
import 'package:go_share/data/models/driver/driver_login_request.dart';
import 'package:go_share/data/models/driver/driver_login_response.dart';
import 'package:go_share/data/repository/service_partner_repository.dart';
import 'package:go_share/ui/common_widgets/common_loading_dialog.dart';
import 'package:go_share/util/lib/toast.dart';
import 'package:go_share/utils/constants.dart';
import 'package:go_share/utils/shared_pref_utils.dart';

class DriverLoginController extends GetxController{

  final Repository repository = Get.find();

  Future<DriverLoginResponse> loginDriver(DriverLoginRequest request) async{
    showLoader();
    var response = await repository.loginDriver(request);
    ToastUtil.show(response.message);
    Get.back();
    return response;
  }

  Future storeToken(String token) async {
    token = "Bearer "+token;
    await SharedPrefUtil.writeString(NetworkConstants.DRIVER_TOKEN, token);
  }
  
  Future<bool> isLoggedIn() async{
    return await repository.isLoggedIn();
  }

}