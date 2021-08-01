import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_share/constants.dart';
import 'package:go_share/ui/auth/login/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(32.0),
        decoration: const BoxDecoration(
          color: colorPrimary,
        ),
      ),
    );
  }
}
