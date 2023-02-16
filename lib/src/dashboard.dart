// ignore_for_file: library_private_types_in_public_api

//import 'package:final_year_project/src/Widget/Controller/signupcontroller.dart';
import 'package:final_year_project/src/constants/image_constants.dart';

import 'package:final_year_project/src/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:get/get.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(0),
        height: size.height,
        width: size.width,
        color: Colors.white,
        child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.white,
              
              leading: const Icon(
                Icons.menu,
                color: Colors.black54,
              ),
              title: const Center(
                  child: Image(
                image: AssetImage(logoBlue),
                height: 70,
                fit: BoxFit.cover,
              )),
              actions: [
                IconButton(
                    onPressed: () {
                      //authRepository.instance.logout();
                       Get.to(() => const Profile());
                    },
                    icon: const Icon(
                      Icons.person_outline_outlined,
                      color: Colors.black54,
                    )),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              
              children: [
                Text(
                  "Welcome!,",
                  style: Theme.of(context).textTheme.headlineSmall?.apply(color: const Color.fromARGB(255, 108, 108, 108)),
                  textAlign: TextAlign.start,
                ),
                Text(
                  "Dashboard",
                  style: Theme.of(context).textTheme.displaySmall?.apply(color: const Color.fromARGB(255, 82, 82, 82)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
