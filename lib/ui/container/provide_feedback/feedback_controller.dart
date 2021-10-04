import 'package:get/get.dart';
import 'package:go_share/data/models/booking/rating_request.dart';
import 'package:go_share/data/models/booking/rating_response.dart';
import 'package:go_share/data/repository/service_partner_repository.dart';

class FeedbackController extends GetxController{

  final Repository repository = Get.find();

  Future<RatingResponse> rateBooking(RatingRequest request) async{
    return await repository.rateBooking(request);
  }

}