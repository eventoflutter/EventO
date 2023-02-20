// ignore_for_file: camel_case_types, file_names, must_be_immutable

import 'package:final_year_project/src/Pages/createEventPages/page1.dart';
import 'package:final_year_project/src/Pages/createEventPages/page2.dart';
import 'package:final_year_project/src/Widget/Buttons/pageNavButton.dart';
import 'package:final_year_project/src/Widget/Controller/createEventController.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class createEvent extends StatefulWidget {
  const createEvent({super.key});

  @override
  State<createEvent> createState() => _createEventState();
}

class _createEventState extends State<createEvent> {
  final controller = Get.put(create_Event_Controller());

  @override
  Widget build(BuildContext context) {
  var pages = [
            create_event_page_1(controller: controller,),
            create_event_page_2(controller: controller,),
            create_event_page_1(controller: controller,),
          ];
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
              liquidController: controller.lqController,
              enableLoop: false,
              onPageChangeCallback: controller.onPageChanged,
              pages: pages,
            ),
          Obx(() {
            bool page = (controller.currentPage.value) != 0;
            return (page)
                ? pageNavBtn(
                    controller: controller,
                    btnicon: Icons.navigate_before_rounded,
                    left: 40,
                    text: "bckbtn",
                    press: () {
                      controller.prevPage();
                    },
                  )
                : Container();
          }),
          Obx(() {
            bool page = (controller.currentPage.value) != 2;
            return (page)
                ? pageNavBtn(
                    controller: controller,
                    btnicon: Icons.navigate_next_rounded,
                    right: 40,
                    text: "nxtbtn",
                    press: () {
                      controller.nextPage();
                    },
                  )
                : Container();
          }),
          Positioned(
            bottom: 60,
            child: Obx(() {
              return Center(
                child: AnimatedSmoothIndicator(
                  activeIndex: controller.currentPage.value,
                  count: 3,
                  effect: const WormEffect(
                      dotHeight: 8, activeDotColor: Colors.blueAccent),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}



