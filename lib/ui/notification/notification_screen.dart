import 'package:flutter/material.dart';
import 'package:go_share/ui/container/UIConstants/Colors.dart';
import 'package:go_share/ui/container/UIConstants/GSWidgetStyles.dart';
import 'package:go_share/ui/container/UIConstants/Strings.dart';
import 'package:go_share/utils/colors.dart';
import 'package:go_share/utils/dimens.dart';
import 'package:go_share/utils/spacers.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationScreenPage extends StatefulWidget {
  const NotificationScreenPage({Key? key}) : super(key: key);

  @override
  _NotificationScreenPageState createState() => _NotificationScreenPageState();
}

class _NotificationScreenPageState extends State<NotificationScreenPage> {
  var hp, wp;
  List<bool> isClicked = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  @override
  Widget build(BuildContext context) {
    hp = MediaQuery.of(context).size.height;
    wp = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: dp20),
        child: Column(
          children: [
            VSpacer20(),
            TitleWidget(),
            Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          isClicked[index] = !isClicked[index];
                        });
                      },
                      child: Container(
                        height: dp80,
                        width: wp,
                        color: isClicked[index] ? gradientDark : light_grey_white,
                        padding: EdgeInsets.symmetric(horizontal: dp10),
                        margin: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Violet Norman',
                                  style: TextStyle(
                                      color: isClicked[index] ? white : black,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Block 372 Bukit Batok Street 31.',
                                  style: TextStyle(
                                      color: isClicked[index] ? white : grey,
                                      fontSize: dp12),
                                )
                              ],
                            ),
                            CircleAvatar(
                              radius: dp20,
                              backgroundColor: isClicked[index] ? primaryDark : greyBorder,
                              child: Icon(
                                Icons.check,
                                color: isClicked[index] ? white : black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }


}
class TitleWidget extends StatelessWidget {
  const TitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: dp10,
            vertical: dp10,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "#VA45647",
                textAlign: TextAlign.start,
                style: GSTextStyles.make28xw700Style(
                  color: GSColors.gray_primary,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Start time",
                          textAlign: TextAlign.start,
                          style: GoogleFonts.manrope(
                              color: GSColors.gray_secondary,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(
                          "10:00am",
                          textAlign: TextAlign.start,
                          style: GSTextStyles.make16xw400Style(
                            color: GSColors.gray_secondary,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "End time",
                          textAlign: TextAlign.start,
                          style: GoogleFonts.manrope(
                            color: GSColors.gray_secondary,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(
                          "11:00am",
                          textAlign: TextAlign.start,
                          style: GSTextStyles.make16xw400Style(
                            color: GSColors.gray_secondary,
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}

