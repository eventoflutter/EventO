// ignore_for_file: camel_case_types

import 'package:final_year_project/src/Widget/forgotpassword/btnwidget.dart';
import 'package:final_year_project/src/Widget/forgotpassword/forgotpassmail.dart';
import 'package:final_year_project/src/Widget/forgotpassword/forgotpassphone.dart';
import 'package:final_year_project/src/constants/text_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class forgotpassword extends StatelessWidget {
  const forgotpassword({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 0),
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            builder: (context) => Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              // margin: const EdgeInsets.only(top: 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      width: 30,
                      height: 3,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(3)),
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Text(tforgotpasswordtitle,
                      style: Theme.of(context).textTheme.headlineMedium),
                  Text(tforgotpasswordsubtitle,
                      style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(
                    height: 30,
                  ),
                  verifyoption(
                    btnIcon: Icons.email_outlined,
                    title: 'E-mail',
                    subtitle: 'Reset via E-mail Verification.',
                    tap: () {
                      Navigator.pop(context);
                      Get.to(() => const forgotpasswordmail());
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  verifyoption(
                      btnIcon: Icons.mobile_friendly_outlined,
                      title: 'Phone No',
                      subtitle: 'Reset via Phone Verification.',
                      tap: () {
                        Navigator.pop(context);
                        Get.to(() => const forgotpassphone());
                      }),
                ],
              ),
            ),
          );
        },
        child: const Text('Forgot Password ?',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
      ),
    );
  }
}
