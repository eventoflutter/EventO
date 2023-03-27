// ignore_for_file: camel_case_types, file_names, must_be_immutable

import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:final_year_project/src/Pages/createEventPages/page1.dart';
import 'package:final_year_project/src/Pages/createEventPages/page2.dart';
import 'package:final_year_project/src/Pages/createEventPages/page3.dart';
import 'package:final_year_project/src/Pages/createEventPages/page4.dart';
import 'package:final_year_project/src/Pages/createEventPages/page5.dart';
import 'package:final_year_project/src/Widget/Buttons/pageNavButton.dart';
import 'package:final_year_project/src/Widget/Controller/createEventController.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:liquid_swipe/liquid_swipe.dart';

class createEvent extends StatefulWidget {
  const createEvent({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final create_Event_Controller controller;

  @override
  State<createEvent> createState() => _createEventState();
}

class _createEventState extends State<createEvent> {
  final controller = Get.put(create_Event_Controller());

  @override
  Widget build(BuildContext context) {
    var pages = [
      create_event_page_1(
        controller: controller,
      ),
      create_event_page_2(
        controller: controller,
      ),
      create_event_page_3(
        controller: controller,
      ),
      create_event_page_4(controller: controller),
    ];
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            alignment: Alignment.center,
            children: [
              PageView(
                controller: controller.pageController.value,
                allowImplicitScrolling: true,
                physics: const AlwaysScrollableScrollPhysics(),
                onPageChanged: controller.onPageChanged,
                children: pages,
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
                        color: Colors.white.withOpacity(0.6),
                      )
                    : Container();
              }),
              Obx(() {
                bool page = (controller.currentPage.value) != pages.length - 1;
                return (page)
                    ? pageNavBtn(
                        controller: controller,
                        btnicon: Icons.navigate_next_rounded,
                        right: 40,
                        text: "nxtbtn",
                        press: () {
                          // (controller.currentPage.value) != 1
                          controller.nextPage();
                          // : Get.to();
                        },
                        color: const Color.fromARGB(255, 104, 159, 255),
                      )
                    : pageNavBtn(
                        controller: controller,
                        btnicon: Icons.navigate_next_rounded,
                        right: 40,
                        text: "nxtbtn",
                        press: () async {
                          // ignore: use_build_context_synchronously
                          if (await confirm(
                            context,
                            title: const Text("Do you want to create Event?"),
                          )) {
                            Get.to(
                                () => create_event_page_5(controller: controller),
                                transition: Transition.leftToRightWithFade,
                                curve: Curves.ease);
                          }
                        },
                        color: const Color.fromARGB(255, 104, 159, 255),
                      );
              }),
              Positioned(
                bottom: 60,
                child: Obx(() {
                  return Center(
                    child: AnimatedSmoothIndicator(
                      activeIndex: controller.currentPage.value,
                      count: pages.length,
                      effect: const ExpandingDotsEffect(
                          expansionFactor: 2,
                          dotHeight: 8,
                          activeDotColor: Colors.blueAccent),
                      // const WormEffect(dotHeight: 8, activeDotColor: Colors.blueAccent),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
