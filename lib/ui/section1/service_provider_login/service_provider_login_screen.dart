import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_share/base/widget/GSButtonWidget.dart';
import 'package:go_share/data/models/service_partner/auth/login/service_partner_login_request.dart';
import 'package:go_share/ui/common_widgets/common_loading_dialog.dart';
import 'package:go_share/ui/container/ForgotPassword/ForgotPassword.dart';
import 'package:go_share/ui/container/UIConstants/Strings.dart';
import 'package:go_share/ui/container/UIConstants/UISizeConstants.dart';
import 'package:go_share/ui/navigation_container/navigation_container.dart';
import 'package:go_share/ui/section4/widgets/text_fields.dart';
import 'package:go_share/util/lib/toast.dart';
import 'package:go_share/utils/colors.dart';
import 'package:go_share/utils/constants.dart';
import 'package:go_share/utils/dimens.dart';
import 'package:go_share/utils/spacers.dart';
import 'package:google_fonts/google_fonts.dart';

import 'service_provider_login_controller.dart';

// UI
class ServiceProviderLoginScreen extends StatefulWidget {
  @override
  _ServiceProviderLoginState createState() => _ServiceProviderLoginState();
} //: UI

// State
class _ServiceProviderLoginState extends State<ServiceProviderLoginScreen> {

  bool value = false;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final _controller = ServiceProviderLoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AssetConstants.ic_welcome,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          SafeArea(
              child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 10),
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                //height: GSSizes.size278h,
                width: double.infinity,
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.2,
                    ),

                    //Get start text
                    Text(
                      GSStrings.welcome_back,
                      textAlign: TextAlign.start,
                      style: GoogleFonts.manrope(
                        color: white,
                        fontSize: dp30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(
                      height: GSSizeConstants.padding10,
                    ),

                    // Description test
                    Container(
                        width: 256,
                        child: Center(
                            child: Text(
                          "It’s time to rock n role! Let’s\nget started now.",
                          style: GoogleFonts.manrope(
                            color: white,
                            fontSize: dp18,
                            fontWeight: FontWeight.normal,
                          ),
                          textAlign: TextAlign.center,
                        ))),
                  ],
                ),
              ),
              SizedBox(
                height: GSSizeConstants.padding55,
              ),
              Sec4TextField(
                controller: emailController,
                hints: GSStrings.email_field_hints,
              ),
              SizedBox(
                height: GSSizeConstants.padding17,
              ),
              Sec4PasswordTextField(
                controller: passwordController,
              ),
              // Container(
              //   padding: EdgeInsets.symmetric(vertical: 30, horizontal: 5),
              //   child: Row(
              //     children: [
              //       CustomCheckBox(
              //         value: value,
              //         shouldShowBorder: true,
              //         borderColor: Colors.white,
              //         uncheckedFillColor: Colors.white60,
              //         checkedFillColor: GSColors.green_normal,
              //         borderRadius: 2,
              //         borderWidth: 1,
              //         checkBoxSize: 15,
              //         uncheckedIconColor: Colors.transparent,
              //         onChanged: (val) {
              //           //do your stuff here
              //           setState(() {
              //             value = val;
              //           });
              //         },
              //       ),
              //       Text(
              //         "Keep me signed in",
              //         style: GoogleFonts.manrope(
              //           color: white,
              //           fontSize: dp18,
              //           fontWeight: FontWeight.normal,
              //         ),
              //       )
              //     ],
              //   ),
              // ),
              VSpacer20(),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: GSButton(
                  text: GSStrings.sign_in,
                  onClick: () {
                    showLoader();
                    if(validate()){
                      var request = ServicePartnerLoginRequest(
                        email: emailController.text.trim(),
                        password: passwordController.text,
                      );
                      login(request);
                    }else{
                      Get.back();
                      ToastUtil.show("Please fill all fields");
                    }
                  },
                ),
              ),
              SizedBox(
                height: GSSizeConstants.padding7,
              ),
              SizedBox(
                height: GSSizeConstants.padding7,
              ),
              Sec4TextButton(
                text1: "Forgot Password?",
                text2: "Reset here",
                onClicked: (){
                  Get.to(ForgotPassword());
                },
              ),
              SizedBox(
                height: GSSizeConstants.padding25,
              ),
            ],
          )),
        ],
      ),
    );
  }

  bool validate(){
    return emailController.text.trim().isNotEmpty &&
        passwordController.text.trim().isNotEmpty;
  }

  void login(ServicePartnerLoginRequest request) async{
    var response = await _controller.loginServiceProvider(request);
    if(response.data != null){
      _controller.storeToken(response.data!.token).then((_){
          Get.back();
          Get.back();
          Get.off(() => NavigationContainer());
      });
    }else{
      Get.back();
    }
    ToastUtil.show(response.message);
  }

}
