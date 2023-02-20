// ignore_for_file: camel_case_types, file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class create_Event_Controller extends GetxController {
  static create_Event_Controller get instance => Get.find();

  final eventName = TextEditingController();
  final desc = TextEditingController();
  final startTime = TextEditingController();
  final location = TextEditingController();
  late DateTime date_time;
}
