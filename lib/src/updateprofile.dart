
// ignore_for_file: camel_case_types


import 'package:final_year_project/src/Widget/Buttons/gradientButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import 'constants/image_constants.dart';

class updateprofile extends StatelessWidget {
  const updateprofile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: ()=> Get.back(), icon: const Icon(LineAwesomeIcons.angle_left)),
        title: Text("Edit Profile", style: Theme.of(context).textTheme.headlineSmall),
        
      ),
      body: SingleChildScrollView(
         child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Stack(
                children: [
                  const SizedBox(
                    width: 160,
                    height: 160,
                    child: ClipRRect(child: Image(image: AssetImage(logo2))),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: const Color.fromARGB(255, 104, 172, 241),
                        ),
                        child: const Icon(
                          LineAwesomeIcons.camera,
                          size: 18,
                          color: Color.fromARGB(255, 15, 14, 14),
                        )),
                  )
                ],
              ),
            const SizedBox(height: 50,),
            Form(child: Column(
              children: [
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person_outline_outlined),
                  labelText: "Username",
                  hintText: "Username",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50))
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              TextFormField(
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
              const SizedBox(height: 20,
              ),
              GradientButton(context: context, textto: "Edit Profile", radius: 50, press: (){}),
              ],
            ))
            ],
          ),
         )
      )
    );
  }
}