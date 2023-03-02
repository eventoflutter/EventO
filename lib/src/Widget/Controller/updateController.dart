// ignore_for_file: camel_case_types, file_names

import 'package:final_year_project/src/models/usermodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class updateController extends GetxController {
  updateController(this.currentUser,){
    upUsername = TextEditingController.fromValue(TextEditingValue(text: currentUser.username));
    upEmail = TextEditingController.fromValue(TextEditingValue(text: currentUser.email));
    upPhone = TextEditingController.fromValue(TextEditingValue(text: currentUser.phonenumber));
    upPassword = TextEditingController.fromValue(TextEditingValue(text: currentUser.password));

  }

  UserModel currentUser;

  TextEditingController? upUsername;
  TextEditingController? upEmail;
  TextEditingController? upPhone;
  TextEditingController? upPassword;

}
