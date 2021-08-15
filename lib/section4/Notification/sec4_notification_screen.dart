import 'package:flutter/material.dart';
import 'package:go_share/section4/Widgets/notification_item.dart';
import 'package:go_share/ui/container/UIConstants/Colors.dart';

class Sec4NotificationScreen extends StatelessWidget {
  const Sec4NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, i) {
          return Sec4NotificationItem();
        },
      ),
    );
  }
}
