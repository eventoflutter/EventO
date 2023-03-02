// ignore_for_file: camel_case_types, file_names, non_constant_identifier_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:final_year_project/src/models/usermodel.dart';
import 'package:final_year_project/src/repos/currentUser.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:liquid_swipe/PageHelpers/LiquidController.dart';

class create_Event_Controller extends GetxController {
  // static create_Event_Controller get instance => Get.find();

  static String invitor_name = "dfgd";

  late UserModel current_user;

  // Page Veiw controller

  final pageController = PageController().obs;
  RxInt currentPage = 0.obs;

  onPageChanged(int activePageIndex) {
    currentPage.value = activePageIndex;
  }

  prevPage() {
    pageController.value.animateToPage(currentPage.value - 1,
        duration: const Duration(milliseconds: 600),
        curve: Curves.fastOutSlowIn);
  }

  nextPage() {
    pageController.value.animateToPage(currentPage.value + 1,
        duration: const Duration(milliseconds: 600),
        curve: Curves.fastOutSlowIn);
  }

  //Page 1

  final eventName = TextEditingController();
  final desc = TextEditingController();
  final startTime = TextEditingController().obs;
  final location = TextEditingController();
  TextEditingController invitedBy = TextEditingController.fromValue(TextEditingValue(text: invitor_name));
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

  RxInt current_temp = 0.obs;
  RxInt sel_ind = 0.obs;
  dynamic selectedIndex = {}.obs;

  final CarouselController carouselController = CarouselController();

  // create_Event_Controller() {
  //   final user_instance = Get.put(currentUser());

  //   final userdata = user_instance.user;

  //   final name = userdata.name != "" ? userdata.name : userdata.username;

  //   invitedBy.value = TextEditingValue(text: name);
  // }

  // set invitor(val) => invitor_name = val;

  // set invitor_edit(val) => invitedBy = val;

  Future<String> getUser() async {
    final user_instance = Get.put(currentUser());

    current_user = await user_instance.create();

    return "Done";
  }

  // Liquid Swipe Controller

  // final lqController = LiquidController().obs;
  // RxInt currentPage = 0.obs;

  // onPageChanged(int activePageIndex) {
  //   currentPage.value = activePageIndex;
  // }

  // prevPage() {
  //   int prevPage = lqController.value.currentPage - 1;
  //   lqController.value.animateToPage(page: prevPage);
  // }
  // nextPage() {
  //   int nextPage = lqController.value.currentPage + 1;
  //   lqController.value.animateToPage(page: nextPage);
  // }
}
