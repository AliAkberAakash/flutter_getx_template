import 'package:get/get.dart';
import 'package:go_share/data/models/booking/booking_details_response.dart';
import 'package:go_share/data/models/booking/booking_response.dart';
import 'package:go_share/data/repository/service_partner_repository.dart';

class MyBookingController extends GetxController{

  final Repository repository = Get.find();
  var bookingDetails = Rx<BookingDetailsResponse?>(null);
  var invoiceResponse = Rx<BookingResponse?>(null);

  getBookingDetails(int id) async{
    bookingDetails.value = await repository.getBookingDetails(id);
  }

  getInvoice(int id) async{
    invoiceResponse.value = await repository.getInvoiceResponse(id);
  }

}