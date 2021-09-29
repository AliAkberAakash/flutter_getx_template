import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_share/data/models/booking/info_request.dart';
import 'package:go_share/ui/book_a_bus/address_screen.dart';
import 'package:go_share/ui/common_widgets/common_text_field.dart';
import 'package:go_share/ui/common_widgets/large_headline_widget.dart';
import 'package:go_share/ui/common_widgets/positive_button.dart';
import 'package:go_share/ui/common_widgets/text_field_headline.dart';
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

  int seat=1;
  String timeFormat="AM";
  List<Widget> childWidgetList = [];
  List<TextEditingController> childControllerList = [];
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  TextEditingController startTimeController = TextEditingController();
  TextEditingController endTimeController = TextEditingController();
  TextEditingController selectedTimeController = TextEditingController();

  @override
  void initState() {
    var controller = new TextEditingController();
    childControllerList.add(controller);
    childWidgetList.add(
      _childWidget(childControllerList[0])
    );
    super.initState();
  }

  _childWidget(TextEditingController controller){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        VSpacer20(),
        TextFieldHeadline(headline: "Child Name*"),
        VSpacer20(),
        CommonTextField(
          controller: controller,
          hint: "Child Name",
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                    border: Border.all(
                      color: light_grey
                    )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: (){
                          setState(() {
                            if(seat>1)
                              seat--;
                            if(childWidgetList.length>1) {
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
                        padding: const EdgeInsets.symmetric(horizontal: dp20),
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
                        onPressed: (){
                          setState(() {
                            seat++;
                            var controller = TextEditingController();
                            childControllerList.add(controller);
                            childWidgetList.add(_childWidget(childControllerList.last));
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

                List<String> childNames = [];

                for(var controller in childControllerList)
                  childNames.add(controller.text);

                var infoRequest = InfoRequest(
                  childNames: childNames,
                  startDate: startTimeController.text,
                  endDate: endTimeController.text,
                  pickupTime: selectedTimeController.text,
                );

                Get.to(
                  AddressScreen(infoRequest: infoRequest,),
                );
              },
            ),
          ],
        ),
      ),
    );
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
          startTimeController.text=speakDate(picked);
        } else {
          endTimeController.text=speakDate(picked);
        }
        selectedDate = picked;
      });
  }

  String formatDate(DateTime date){
    var outputFormat = DateFormat('MM.dd.yyyy');
    return outputFormat.format(date);
  }

  _datePicker(TextEditingController controller, String hint, int type){
    return TextField(
      readOnly: true,
      controller: controller,
      style: TextStyle(
        color: darkText,
        fontSize: dp18,
        fontWeight: FontWeight.bold,
      ),
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: (){
            _selectDate(context, type);
          },
          icon: Icon(
            Icons.date_range,
            color: accent,
          ),
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
      readOnly: true,
      controller: controller,
      style: TextStyle(
        color: darkText,
        fontSize: dp18,
        fontWeight: FontWeight.bold,
      ),
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: (){
            _selectTime();
          },
          icon: Icon(
            Icons.access_time_outlined,
            color: accent,
          ),
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
    selectedTimeController.text =  "${selectedTime?.hour}:${selectedTime?.minute}";
  }

}
