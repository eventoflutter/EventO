// ignore_for_file: camel_case_types

import 'package:final_year_project/src/Widget/Controller/signupcontroller.dart';
//import 'package:final_year_project/src/Widget/otpwidgets/otpscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../Buttons/gradientButton.dart';

class signupform extends StatefulWidget {
  const signupform({
    Key? key,
  }) : super(key: key);

  @override
  State<signupform> createState() => _signupformState();
}

class _signupformState extends State<signupform> {
  late bool _passVis;

  @override
  void initState() {
    super.initState();
    _passVis = false;
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());

    final formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            TextFormField(
              controller: controller.username,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person_outline_outlined),
                labelText: "Username",
                hintText: "Username",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50))),
              ),
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: controller.email,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.email_outlined),
                labelText: "E-mail",
                hintText: "E-mail",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50))),
              ),
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: controller.phoneno,
              keyboardType: const TextInputType.numberWithOptions(),
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.call),
                labelText: "Phone No",
                hintText: "Phone No",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50))),
              ),
              textInputAction: TextInputAction.next,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: controller.password,
              obscureText: !_passVis,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.fingerprint),
                labelText: "Password",
                hintText: "Password",
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _passVis = !_passVis;
                    });
                  },
                  icon: Icon(_passVis
                      ? LineAwesomeIcons.eye_1
                      : LineAwesomeIcons.eye_slash_1),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GradientButton(
              context: context,
              textto: 'Register Now',
              radius: 50,
              press: () {
                if (formKey.currentState!.validate()) {
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
