import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_share/core/ui/error_screen.dart';
import 'package:go_share/core/ui/loading_widget.dart';
import 'package:go_share/data/models/booking/child_list_response.dart';
import 'package:go_share/data/models/booking/info_request.dart';
import 'package:go_share/ui/book_a_bus/address_screen.dart';
import 'package:go_share/ui/book_a_bus/booking_controller.dart';
import 'package:go_share/ui/common_widgets/auto_complete_text.dart';
import 'package:go_share/ui/common_widgets/large_headline_widget.dart';
import 'package:go_share/ui/common_widgets/positive_button.dart';
import 'package:go_share/ui/common_widgets/text_field_headline.dart';
import 'package:go_share/util/lib/toast.dart';
import 'package:go_share/utils/colors.dart';
import 'package:go_share/utils/date_time_utils.dart';
import 'package:go_share/utils/dimens.dart';
import 'package:go_share/utils/spacers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {

  final bookingController = BookingController(Get.find());

  int seat=0;
  String timeFormat="AM";
  List<Widget> childWidgetList = [];
  List<TextEditingController> childControllerList = [];
  DateTime? startDate;
  DateTime? endDate;
  TimeOfDay? pickedTime;
  String? dropOffTime;
  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();
  TextEditingController selectedTimeController = TextEditingController();

  List<String> newChild = [];
  List<int> existingChild = [];

  @override
  void initState() {
    bookingController.getChildList();
    // var controller = new TextEditingController();
    // childControllerList.add(controller);
    // childWidgetList.add(
    //   _childWidget(childControllerList[0], [""])
    // );
    super.initState();
  }

  _childWidget(TextEditingController controller, List<String> suggestions){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        VSpacer20(),
        TextFieldHeadline(headline: "Child Name*"),
        VSpacer20(),
        AutoCompleteTextField(
          controller: controller,
          hint: "Child Name",
          suggestions: suggestions,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx((){

        var currentState = bookingController.childListResponse.value;

        if(currentState==null){
          return LoadingWidget();
        }else{
          if(currentState.success) {

            List<String> suggestion = currentState.data!=null ? currentState.data!.map((e) => e.name).toList()
            : [];

            return Container(
              padding: EdgeInsets.all(dp20),
              child: ListView(
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
                  Row(
                    children: [
                      Expanded(
                        child: TextFieldHeadline(headline: "Seat"),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                dp5,
                              ),
                            ),
                            border: Border.all(color: light_grey)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  if (seat > 1) seat--;
                                  if (childWidgetList.length > 1) {
                                    childWidgetList.removeLast();
                                    childControllerList.removeLast();
                                  }
                                });
                              },
                              icon: Icon(
                                Icons.remove,
                                color: accent,
                              ),
                            ),
                            Container(
                              width: 1,
                              height: 50,
                              color: light_grey,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: dp20),
                              child: Text(
                                seat.toString(),
                              ),
                            ),
                            Container(
                              width: 1,
                              height: 50,
                              color: light_grey,
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  seat++;
                                  var controller = TextEditingController();
                                  childControllerList.add(controller);
                                  childWidgetList.add(_childWidget(
                                      childControllerList.last, suggestion));
                                });
                              },
                              icon: Icon(
                                Icons.add,
                                color: accent,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: childWidgetList,
                  ),
                  VSpacer20(),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFieldHeadline(headline: "Start Date*"),
                            VSpacer20(),
                            _datePicker(startTimeController, "Start date", 1),
                          ],
                        ),
                      ),
                      HSpacer20(),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFieldHeadline(headline: "End Date*"),
                            VSpacer20(),
                            _datePicker(endTimeController, "End Date", 2),
                          ],
                        ),
                      ),
                    ],
                  ),
                  VSpacer20(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFieldHeadline(headline: "Pickup Time*"),
                            VSpacer20(),
                            _timePicker(selectedTimeController),
                          ],
                        ),
                      ),
                      /*HSpacer20(),
                Container(
                  padding: EdgeInsets.only(left: dp10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: grey
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(dp10),
                    ),
                  ),
                  child: DropdownButton<String>(
                    style: GoogleFonts.manrope(
                      color: darkText,
                      fontWeight: FontWeight.bold,
                    ),
                    value: timeFormat,
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                    ),
                    underline: Container(),
                    items: <String>['AM', 'PM'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: GoogleFonts.manrope(
                            color: darkText,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        timeFormat=value!;
                      });
                    },
                  ),
                ),*/
                    ],
                  ),
                  VSpacer20(),
                  PositiveButton(
                    text: "Next",
                    onClicked: () {
                      newChild.clear();
                      existingChild.clear();
                      for (var controller in childControllerList)
                      {
                        Datum? child = currentState.data!.firstWhere(
                                (element) => element.name==controller.text,
                            orElse: (){
                          return Datum(
                            id: -1,
                            userId: -1,
                            name: controller.text,
                            createdAt: DateTime.now(),
                            updatedAt: DateTime.now(),
                          );
                        });
                        if(child.id==-1){
                          if(child.name.isNotEmpty)
                            newChild.add(controller.text);
                        }else existingChild.add(child.id);
                      }

                      if(validate()){

                        var infoRequest = InfoRequest(
                          childNames: newChild,
                          childId: existingChild,
                          startDate: formatDate(startDate!),
                          endDate: formatDate(endDate!),
                          pickupTime: selectedTimeController.text,
                          dropOffTime: dropOffTime ?? "00:00:00",
                        );

                        print(infoRequest.toJson());

                        Get.to(
                          AddressScreen(
                            infoRequest: infoRequest,
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            );
          } else return ErrorScreen();
        }

      }),
    );
  }

  bool validate(){

    print(newChild.length);
    print(existingChild.length);

    // if(newChild.isEmpty && existingChild.isEmpty){
    //   ToastUtil.show("Please select at least one child");
    //   return false;
    // }

    if(startDate == null || endDate == null){
        ToastUtil.show("Please select start date");
        return false;
    }

    if(pickedTime == null){
      ToastUtil.show("Please select pickup time");
      return false;
    }

    return true;
  }

  DateTime selectedDate = DateTime.now();
  TimeOfDay? selectedTime = TimeOfDay.now();

  Future<void> _selectDate(BuildContext context, int type) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        builder: (ctx, child){
          return Theme(
            data: ThemeData.light().copyWith(
              colorScheme: ColorScheme.light(primary: accent),
            ),
            child: child!,
          );
        },
        firstDate: DateTime(1950),
        lastDate: DateTime(2201)
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        if(type==1) {
          startDate = picked;
          endDate = picked;
          startTimeController.text=speakDate(picked);
          endTimeController.text=speakDate(picked);
        } else {
          endDate = picked;
          endTimeController.text=speakDate(picked);
        }
        selectedDate = picked;
      });
  }

  DateTime formatDate(DateTime date){
    var outputFormat = DateFormat('yyyy-MM-dd');
    return DateTime.parse(outputFormat.format(date));
  }

  _datePicker(TextEditingController controller, String hint, int type){
    return TextField(
      onTap: (){
        _selectDate(context, type);
      },
      readOnly: true,
      controller: controller,
      style: TextStyle(
        color: darkText,
        fontSize: dp18,
        fontWeight: FontWeight.bold,
      ),
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        suffixIcon: Icon(
          Icons.date_range,
          color: accent,
        ),
        contentPadding: EdgeInsets.only(left: 10),
        hintText: hint,
        hintStyle: GoogleFonts.manrope(
            color: light_grey,
            fontSize: 14
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(dp10),
          borderSide: BorderSide(color: grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(dp10),
          borderSide: BorderSide(color: accent),
        ),
      ),
      cursorColor: accent,
    );
  }

  _timePicker(TextEditingController controller){

    return TextField(
      onTap: (){
        _selectTime();
      },
      readOnly: true,
      controller: controller,
      style: TextStyle(
        color: darkText,
        fontSize: dp18,
        fontWeight: FontWeight.bold,
      ),
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        suffixIcon: Icon(
          Icons.access_time_outlined,
          color: accent,
        ),
        contentPadding: EdgeInsets.only(left: 10),
        hintText: "Select time",
        hintStyle: GoogleFonts.manrope(
            color: light_grey,
            fontSize: 14
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(dp10),
          borderSide: BorderSide(color: grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(dp10),
          borderSide: BorderSide(color: accent),
        ),
      ),
      cursorColor: accent,
    );


  }

  _selectTime() async{
    selectedTime = await showTimePicker(
      builder: (ctx, child){
      return Theme(
        data: ThemeData.light().copyWith(
          colorScheme: ColorScheme.light(primary: accent),
          // buttonTheme: ButtonThemeData(
          //     textTheme: acce
          // ),
        ),
        child: child!,
      );
      },
      initialTime: TimeOfDay.now(),
      context: context,
    );
    pickedTime = selectedTime;
    NumberFormat formatter = new NumberFormat("00");
    selectedTimeController.text =  "${formatter.format(selectedTime?.hour)}:${formatter.format(selectedTime?.minute)}:00";
    dropOffTime =  "${formatter.format((selectedTime?.hour)??0+1)}:${formatter.format(selectedTime?.minute)}:01";
  }

}
