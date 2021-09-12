import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_share/data/models/driver/driver_password_reset_code_response.dart';
import 'package:go_share/ui/common_widgets/common_loading_dialog.dart';
import 'package:go_share/ui/common_widgets/positive_button.dart';
import 'package:go_share/ui/container/UIConstants/Colors.dart';
import 'package:go_share/ui/section1/driver_reset_password/reset_driver_password_screen.dart';
import 'package:go_share/ui/section1/driver_reset_password/reset_password_request_controller.dart';
import 'package:go_share/util/lib/toast.dart';
import 'package:go_share/utils/colors.dart';
import 'package:go_share/utils/dimens.dart';
import 'package:go_share/utils/spacers.dart';
import 'package:google_fonts/google_fonts.dart';

class ResetPasswordRequestScreen extends StatefulWidget {
  const ResetPasswordRequestScreen({Key? key}) : super(key: key);

  @override
  _ResetPasswordRequestScreenState createState() => _ResetPasswordRequestScreenState();
}

class _ResetPasswordRequestScreenState extends State<ResetPasswordRequestScreen> {
  
  final _controller = ResetPasswordRequestController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(dp20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              VSpacer40(),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  "Request password reset",
                  style: GoogleFonts.manrope(
                    color: accent,
                    fontSize: dp25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  "Request for a password reset code in your email",
                  style: GoogleFonts.manrope(
                    color: GSColors.text_secondary,
                    fontSize: dp14,
                    fontWeight: FontWeight.normal,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              VSpacer20(),
              Row(
                children: [
                  Expanded(
                    child: PositiveButton(
                      text: "Send code",
                      onClicked: () {
                        showLoader();
                        _controller.requestDriverPasswordResetCode().then((DriverPasswordResetCodeResponse response){
                          if(response.success){
                            Get.back();
                            ToastUtil.show("Please check service provider email for password reset code");
                            Get.off(ResetDriverPasswordScreen());
                          }else{
                            Get.back();
                            ToastUtil.show("Failed to send code");
                          }
                        });
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
