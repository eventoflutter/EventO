// ignore_for_file: camel_case_types, file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';

class create_Event_Controller extends GetxController {
  static create_Event_Controller get instance => Get.find();

  //Page 1
  final eventName = TextEditingController();
  final desc = TextEditingController();
  final startTime = TextEditingController().obs;
  final location = TextEditingController();
  late DateTime date_time;

  // Page 2
  final RxBool? qrEnable = false.obs;
  final RxInt scans = 1.obs;

  incre() => scans.value++;

  decre() {
    if (scans > 1) {
      scans.value--;
    }
  }

  // Page 3
  



  // Liquid Swipe Controller

  final lqController = LiquidController();
  RxInt currentPage = 0.obs;

  onPageChanged(int activePageIndex) {
    currentPage.value = activePageIndex;
  }

  prevPage() {
    int prevPage = lqController.currentPage - 1;
    lqController.animateToPage(page: prevPage);
  }
  nextPage() {
    int nextPage = lqController.currentPage + 1;
    lqController.animateToPage(page: nextPage);
  }
}
