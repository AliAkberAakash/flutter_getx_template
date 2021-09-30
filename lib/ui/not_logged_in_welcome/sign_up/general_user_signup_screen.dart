import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_share/base/widget/GSButtonWidget.dart';
import 'package:go_share/base/widget/GSTextField.dart';
import 'package:go_share/data/models/general_user/general_user_signup_request.dart';
import 'package:go_share/ui/common_widgets/common_loading_dialog.dart';
import 'package:go_share/ui/container/UIConstants/GSWidgetStyles.dart';
import 'package:go_share/ui/container/UIConstants/Strings.dart';
import 'package:go_share/ui/container/UIConstants/UISizeConstants.dart';
import 'package:go_share/ui/not_logged_in_welcome/sign_in/sign_in_screen.dart';
import 'package:go_share/ui/section4/widgets/text_fields.dart';
import 'package:go_share/util/lib/toast.dart';
import 'package:go_share/utils/colors.dart';
import 'package:go_share/utils/constants.dart';
import 'package:go_share/utils/dimens.dart';
import 'package:go_share/utils/spacers.dart';

import 'general_user_signup_controller.dart';

class GeneralUserSignupScreen extends StatefulWidget {
  @override
  _GeneralUserSignupScreenState createState() =>
      _GeneralUserSignupScreenState();
}

// State
class _GeneralUserSignupScreenState extends State<GeneralUserSignupScreen> {
  bool isChecked = false;
  var mainWidth;
  var maxLines = 3;

  final _controller = GeneralUserSignupController();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
  TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: GSColors.green_primary,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: GSSizes.size126h,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(AssetConstants.signup_bg_image),
                      fit: BoxFit.cover)),
              child: Center(
                child: Text(
                  GSStrings.create_new_account,
                  textAlign: TextAlign.start,
                  style: GSTextStyles.make28xw600Style(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: GSSizeConstants.padding105),
              child: Container(
                width: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      GSTextField(
                        controller: nameController,
                        hints: GSStrings.full_name,
                      ),
                      SizedBox(
                        height: GSSizeConstants.padding12,
                      ),
                      GSTextField(
                        controller: phoneNumberController,
                        hints: GSStrings.phone_number,
                      ),
                      SizedBox(
                        height: GSSizeConstants.padding12,
                      ),
                      GSTextField(
                        controller: emailController,
                        hints: GSStrings.email_address,
                      ),
                      SizedBox(
                        height: GSSizeConstants.padding12,
                      ),
                      GSTextField(
                        controller: addressController,
                        hints: GSStrings.address,
                      ),
                      SizedBox(
                        height: GSSizeConstants.padding12,
                      ),
                      SizedBox(
                        width: GSSizes.size316x56.width,
                        height: GSSizes.size316x56.height,
                        child: Sec2PasswordTextField(
                          controller: passwordController,
                        ),
                      ),
                      SizedBox(
                        height: GSSizeConstants.padding12,
                      ),
                      SizedBox(
                        width: GSSizes.size316x56.width,
                        height: GSSizes.size316x56.height,
                        child: Sec2PasswordTextField(
                          controller: confirmPasswordController,
                          hint: GSStrings.reType_password,
                        ),
                      ),
                      VSpacer20(),
                      SizedBox(
                        width: GSSizes.size316x56.width,
                        height: GSSizes.size316x56.height,
                        child: _agreeToTerms(),
                      ),
                      VSpacer20(),
                      GSButton(
                        onClick: (){
                          showLoader();
                          if (validatePassword()) {
                            if(validate()){
                              var request = GeneralUserSignupRequest(
                                  name: nameController.text,
                                  email: emailController.text,
                                  phone: phoneNumberController.text,
                                  password: passwordController.text,
                                  address: addressController.text);
                              signup(request);
                            }else{
                              ToastUtil.show("Please fill all fields");
                            }
                          } else {
                            Get.back();
                            ToastUtil.show("Passwords do not match");
                          }
                        },
                        text: GSStrings.sign_up,
                      ),
                      SizedBox(
                        height: GSSizeConstants.padding7,
                      ),
                      GSTextButton(
                        onClick: () {
                          Get.back();
                          Get.to(NSignInScreen());
                        },
                        text: GSStrings.already_have_an_account_sIgn_in,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool validatePassword() {
    return passwordController.text == confirmPasswordController.text;
  }

  bool validate(){
    return nameController.text.trim().isNotEmpty
        && emailController.text.trim().isNotEmpty
        && phoneNumberController.text.trim().isNotEmpty
        && addressController.text.trim().isNotEmpty
        && passwordController.text.trim().isNotEmpty;
  }

  void signup(GeneralUserSignupRequest request) async {
    var response = await _controller.signupGeneralUser(request);
    if (response.data==null) {
      Get.back();
      Get.back();
    } else {
      ToastUtil.show(response.msg);
      Get.back();
    }
  }

  _agreeToTerms() => Row(
    children: [
      Checkbox(
          fillColor: MaterialStateProperty.all(accent),
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value!;
            });
          }),
      Text(
        'I agree to terms & conditions',
        style: TextStyle(fontSize: dp15, color: grey),
      ),
    ],
  );
}
