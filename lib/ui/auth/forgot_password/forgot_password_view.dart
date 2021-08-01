import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_share/constants.dart';
import 'package:go_share/ui/auth/forgot_password/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
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
