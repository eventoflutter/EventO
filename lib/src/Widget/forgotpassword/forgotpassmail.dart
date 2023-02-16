// ignore_for_file: camel_case_types
//
import 'package:final_year_project/src/Widget/Buttons/backbutton.dart';
import 'package:final_year_project/src/Widget/Buttons/gradientButton.dart';
import 'package:final_year_project/src/constants/text_constants.dart';
import 'package:flutter/material.dart';

class forgotpasswordmail extends StatelessWidget {
  const forgotpasswordmail({ 
    Key? key,
  }) : super(key : key);


  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 80,
                ),
                Text(
                  'Forgot Password',
                  textAlign: TextAlign.justify,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text(
                  tentermail,
                  // textAlign: TextAlign.justify,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 50,),
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        // controller: TextEditingController(text: emailid),
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.email_outlined),
                          labelText: "E-mail",
                          hintText: "E-mail",
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6))),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GradientButton(
                        context: context, 
                        textto: 'Submit', 
                        radius: 6, 
                        press: () {
                          // Get.to(() => const Otpscreen(type: 'E-mail Id'));
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              top: 20,
              left: 0,
              child: backbutton(
                context: context,
              )),
        ],
      )),
    );
  }
}
