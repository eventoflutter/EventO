import 'package:final_year_project/src/constants/image_constants.dart';
import 'package:final_year_project/src/repos/authrepo.dart';
import 'package:final_year_project/src/updateprofile.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import 'Widget/Profile/Profilesetting.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {}, icon: const Icon(LineAwesomeIcons.angle_left)),
        title: Text("Profile", style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(LineAwesomeIcons.moon)),
        ],
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
                          LineAwesomeIcons.alternate_pencil,
                          size: 18,
                          color: Color.fromARGB(255, 15, 14, 14),
                        )),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text("User Name"),
              const Text("eventooragnizaton@gmail.com"),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () => Get.to(() => const updateprofile()),
                    style:
                        ElevatedButton.styleFrom(shape: const StadiumBorder()),
                    child: const Text("Edit Profile",
                        style:
                            TextStyle(color: Color.fromARGB(255, 10, 10, 11))),
                  )
                  //GradientButton(
                  //     context: context,
                  //     textto: "Edit Profile",
                  //     radius: 50,
                  //     press: () {}),
                  ),
              const SizedBox(
                height: 30,
              ),
              const Divider(
                height: 10,
                thickness: 5,
                color: Colors.grey,
              ),
              const SizedBox(
                height: 10,
              ),
              Profilesetting(
                title: "Setting",
                icon: LineAwesomeIcons.cog,
                endIcon: true,
                press: () {},
              ),
              Profilesetting(
                title: "Billing Detail",
                icon: LineAwesomeIcons.wallet,
                endIcon: true,
                press: () {},
              ),
              Profilesetting(
                title: "User Management",
                icon: LineAwesomeIcons.user_check,
                endIcon: true,
                press: () {},
              ),
              const SizedBox(
                height: 20,
              ),
              Profilesetting(
                title: "Information",
                icon: LineAwesomeIcons.info,
                endIcon: true,
                press: () {},
              ),
              Profilesetting(
                title: "Logout",
                icon: LineAwesomeIcons.alternate_sign_out,
                endIcon: false,
                press: () {
                  authRepository.instance.logout();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
