// ignore_for_file: camel_case_types, file_names, non_constant_identifier_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:final_year_project/src/models/usermodel.dart';
import 'package:final_year_project/src/repos/currentUser.dart';
import 'package:final_year_project/src/repos/registerEvent.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:liquid_swipe/PageHelpers/LiquidController.dart';

class create_Event_Controller extends GetxController {
  static create_Event_Controller get instance => Get.find();

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
  TextEditingController invitedBy =
      TextEditingController.fromValue(TextEditingValue(text: invitor_name));
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
  String templateId = "";

  final CarouselController carouselController = CarouselController();

  // Page 4

  RxBool sendOnWhatsApp = true.obs;
  RxBool sendOnEmail = false.obs;

  RxBool dataFileSelected = false.obs;

  Rx<PlatformFile> dataFile = PlatformFile(name: "", size: 0).obs;

  RxBool registrationForm = false.obs;

  registrationFormData formFeilds = registrationFormData();

  // Current User

  Future<String> getUser() async {
    final user_instance = Get.put(currentUser());

    current_user = await user_instance.create();

    return "Done";
  }

  // Final Create Event
  Future<String> createEvent(create_Event_Controller controller) async {
    final registerObj = Get.put(registerEvent());
    String eventId = await registerObj.register(controller);

    return eventId;
  }
}

class registrationFormData {
  RxBool isName = false.obs;
  RxBool isEmail = false.obs;
  RxBool isPhone = true.obs;
  RxBool isAddress = false.obs;
}
