import 'package:flutter/material.dart';
import 'package:go_share/utils/colors.dart';
import 'package:go_share/utils/dimens.dart';
import 'package:go_share/utils/spacers.dart';

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
            VSpacer60(),
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
                              backgroundColor: isClicked[index] ? accent : greyBorder,
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
