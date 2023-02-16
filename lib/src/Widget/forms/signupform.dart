// ignore_for_file: camel_case_types

import 'package:final_year_project/src/Widget/Controller/signupcontroller.dart';
//import 'package:final_year_project/src/Widget/otpwidgets/otpscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Buttons/gradientButton.dart';

class signupform extends StatelessWidget {
  const signupform({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(SignUpController());

    final formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children:  [
              TextFormField(
                controller: controller.username,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person_outline_outlined),
                  labelText: "Username",
                  hintText: "Username",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50))
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: controller.email,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined),
                  labelText: "E-mail",
                  hintText: "E-mail",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50))
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: controller.phoneno,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.call),
                  labelText: "Phone No",
                  hintText: "Phone No",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50))
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: controller.password,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.fingerprint),
                  labelText: "Password",
                  hintText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50))
                  ),
                  suffixIcon: IconButton(
                    onPressed: null,
                    icon: Icon(Icons.remove_red_eye_sharp),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              GradientButton(
                context: context, 
                textto: 'Register Now', 
                radius: 50, 
                press: () {
                  if(formKey.currentState!.validate()){                    
                    // SignUpController.instance.registerUser(controller.email.text.trim(), controller.password.text.trim());
                    SignUpController.instance.phoneAuth(controller);
                    // formKey.currentState.reset();
                  }
                },
              ),
          ],
          ),
        ),
    );
  }
}
