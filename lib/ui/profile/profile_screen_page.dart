import 'package:flutter/material.dart';
import 'package:go_share/ui/service_provider/widgets/update_button.dart';
import 'package:go_share/utils/colors.dart';
import 'package:go_share/utils/constants.dart';
import 'package:go_share/utils/dimens.dart';
import 'package:go_share/utils/spacers.dart';

class ProfileScreenPage extends StatefulWidget {
  const ProfileScreenPage({Key? key}) : super(key: key);

  @override
  _ProfileScreenPageState createState() => _ProfileScreenPageState();
}

class _ProfileScreenPageState extends State<ProfileScreenPage> {
  var hp, wp;

  @override
  Widget build(BuildContext context) {
    hp = MediaQuery.of(context).size.height;
    wp = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        height: hp,
        width: wp,
        color: white,
        padding: EdgeInsets.symmetric(horizontal: dp15, vertical: dp15),
        child: Column(
          children: [
            VSpacer60(),
            VSpacer60(),
            CircleAvatar(
              radius: dp60,
              backgroundColor: accent,
            ),
            SizedBox(height: dp40),
            Text(
              'Violet Norman',
              style: TextStyle(
                  color: black, fontWeight: FontWeight.bold, fontSize: dp20),
            ),
            SizedBox(height: dp10),
            Text(
              'bayer_martin@yahoo.com',
              style: TextStyle(fontSize: dp18),
            ),
            SizedBox(height: dp40),
            Text('Bus No'),
            SizedBox(height: dp10),
            Text(
              '7079097213',
              style: TextStyle(
                  color: black, fontWeight: FontWeight.bold, fontSize: dp18),
            ),
            SizedBox(height: dp40),
            Text('Attendence Name'),
            SizedBox(height: dp10),
            Text(
              'Violet Norman',
              style: TextStyle(
                  color: black, fontWeight: FontWeight.bold, fontSize: dp18),
            ),
            SizedBox(height: dp40),
            Row(
              children: [
                Expanded(child: UpdateButton(text: 'Change Password', onClicked: () {})),
              ],
            )
          ],
        ),
      ),
    );
  }
}
