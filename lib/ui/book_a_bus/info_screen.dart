import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_share/ui/book_a_bus/address_screen.dart';
import 'package:go_share/ui/common_widgets/large_headline_widget.dart';
import 'package:go_share/ui/common_widgets/text_field_headline.dart';
import 'package:go_share/ui/service_provider/widgets/common_text_field.dart';
import 'package:go_share/ui/service_provider/widgets/positive_button.dart';
import 'package:go_share/utils/colors.dart';
import 'package:go_share/utils/dimens.dart';
import 'package:go_share/utils/spacers.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({Key? key}) : super(key: key);

  @override
  _InfoScreenState createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {

  int seat=1;
  String timeFormat="AM";
  List<Widget> childWidgetList = [];

  @override
  void initState() {
    childWidgetList.add(
      _childWidget()
    );
    super.initState();
  }

  _childWidget(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        VSpacer20(),
        TextFieldHeadline(headline: "Child Name*"),
        VSpacer20(),
        CommonTextField(
          controller: TextEditingController(),
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
                            if(childWidgetList.length>1)
                              childWidgetList.removeLast();
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
                            childWidgetList.add(_childWidget());
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
                      _datePicker(TextEditingController(), "Start date"),
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
                      _datePicker(TextEditingController(), "End Date"),
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
                      CommonTextField(
                        controller: TextEditingController(),
                        hint: "Pickup time",
                      ),
                    ],
                  ),
                ),
                HSpacer20(),
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
                ),
              ],
            ),
            VSpacer20(),
            PositiveButton(
              text: "Next",
              onClicked: () {
                Get.to(
                  AddressScreen(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
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
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101)
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  _datePicker(TextEditingController controller, String hint){
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
            _selectDate(context);
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

}
