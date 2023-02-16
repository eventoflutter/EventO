// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:final_year_project/src/Widget/Buttons/gradientButton.dart';
import 'package:final_year_project/src/constants/text_constants.dart';
import 'package:final_year_project/src/models/usermodel.dart';
import 'package:final_year_project/src/repos/authrepo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class Otpscreen extends StatelessWidget {
  const Otpscreen({
    Key? key,
    required this.usermodel,
    // required this.mobile,
    // required this.email,
  }) : super(key: key);

  final UserModel usermodel;
  // final String mobile;
  // final String email;
  
  @override
  Widget build(BuildContext context) {
    var authrepo = Get.put(authRepository());
    var otp;
    String data = Get.arguments[0]['data'];
    String type = Get.arguments[0]['type'];
    return SafeArea(
      child: WillPopScope(
        onWillPop: () { return Future.value(false); },
        child: Scaffold(
          body: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // const SizedBox(height: 40,),
                const Icon(
                  Icons.message_outlined,
                  size: 80,
                  color: Color.fromARGB(255, 108, 108, 108),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  'Verification',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 108, 108, 108),
                  ),
                ),
                // Container(
                //   alignment: Alignment.centerLeft,
                //   margin: const EdgeInsets.only(bottom: 20),
                //   width: 120,
                //   height: 4,
                //   decoration: const BoxDecoration(
                //     borderRadius: BorderRadius.all(Radius.circular(3)),
                //     color: Colors.blue,
                //   ),
                // ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "$verifysubtitle: $data",
                  style: Theme.of(context).textTheme.titleSmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 40,
                ),
                OtpTextField(
                  numberOfFields: 6,
                  autoFocus: true,
                  keyboardType: TextInputType.number,
                  borderColor: Colors.blue,
                  focusedBorderColor: Colors.blue,
                  onSubmit: ((value) {
                    otp = value;
                    type == 'login' ? authrepo.verifyLogin(otp, usermodel): authrepo.verifyOTP(otp, usermodel);
                  }),
                  filled: true,
                ),
                const SizedBox(
                  height: 40,
                ),
                GradientButton(
                  context: context,
                  textto: 'Verify',
                  radius: 10,
                  press: () {
                    type == 'login' ? authrepo.verifyLogin(otp, usermodel): authrepo.verifyOTP(otp, usermodel);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
