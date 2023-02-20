// ignore_for_file: camel_case_types, file_names, must_be_immutable

import 'package:final_year_project/src/Pages/createEventPages/page1.dart';
import 'package:final_year_project/src/Pages/createEventPages/page2.dart';
import 'package:final_year_project/src/Widget/Controller/createEventController.dart';
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
    return Stack(
      children: 
        [
          LiquidSwipe(
            liquidController: controller.lqController,
            enableLoop: false,
            onPageChangeCallback: controller.onPageChanged,
            // enableSideReveal: true,
            pages: [
              create_event_page_1(controller: controller,),
              create_event_page_2(controller: controller,),
              create_event_page_1(controller: controller,),
            ]
          ),
          Positioned(
            bottom: 60,
            right: 40,
            child: FloatingActionButton(
              onPressed: () {
                controller.nextPage();
              },
              backgroundColor: Colors.white,
              child: const Icon(
                Icons.navigate_next_rounded,
                color: Colors.black,
                size: 40,
              ),
            ),
          ),
          Positioned(
            bottom: 60,
            left: 40,
            child: FloatingActionButton(
              onPressed: () {
                controller.prevPage();
              },
              backgroundColor: Colors.white,
              child: const Icon(
                Icons.navigate_before_rounded,
                color: Colors.black,
                size: 40,
              ),
            ),
          )
        ],
      );
  }
}


