import 'package:flutter/material.dart';
import 'package:go_share/utils/colors.dart';
import 'package:go_share/utils/dimens.dart';

class NotificationScreenPage extends StatefulWidget {
  const NotificationScreenPage({Key? key}) : super(key: key);

  @override
  _NotificationScreenPageState createState() => _NotificationScreenPageState();
}

class _NotificationScreenPageState extends State<NotificationScreenPage> {
  var hp, wp;
  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    hp = MediaQuery.of(context).size.height;
    wp = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Notification'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: dp20),
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, int count) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    isClicked = !isClicked;
                  });
                },
                child: Container(
                  height: dp80,
                  width: wp,
                  color: isClicked ? gradientDark : light_grey_white,
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
                                color: isClicked ? white : black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Block 372 Bukit Batok Street 31.',
                            style: TextStyle(
                                color: isClicked ? white : grey,
                                fontSize: dp12),
                          )
                        ],
                      ),
                      CircleAvatar(
                        radius: dp20,
                        backgroundColor: isClicked ? accent : greyBorder,
                        child: Icon(
                          Icons.check,
                          color: isClicked ? white : black,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
