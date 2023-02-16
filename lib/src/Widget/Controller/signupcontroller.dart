import 'package:final_year_project/src/repos/authrepo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final username = TextEditingController();
  final email = TextEditingController();
  final phoneno = TextEditingController();
  final password = TextEditingController();

  // void registerUser(String email, String password){
  //   final authRepo  = authRepository();

  //   authRepo.createUserWithEmailAndPassword(email, password);
  // }

  void phoneAuth(controller){

    authRepository.instance.phoneAuth(controller);
  }

}