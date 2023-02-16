// ignore_for_file: camel_case_types

import 'package:final_year_project/src/Widget/Controller/logincontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Buttons/gradientButton.dart';

class loginform extends StatelessWidget {
  const loginform({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(logincontroller());

    final formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children:  [
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
            GradientButton(context: context, textto: 'Login', radius: 50, press: () {
              if (formKey.currentState!.validate()) {
                logincontroller.instance.login(controller);
              }
            },),
        ],
        ),
      ),
    );
  }
}

