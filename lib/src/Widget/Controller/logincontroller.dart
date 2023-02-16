// ignore_for_file: camel_case_types

import 'package:final_year_project/src/repos/authrepo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class logincontroller extends GetxController{
  static logincontroller get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();

  void login(controller){
    authRepository.instance.login(controller);
  }
}