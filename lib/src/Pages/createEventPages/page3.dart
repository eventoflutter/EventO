// ignore_for_file: library_private_types_in_public_api, camel_case_types, non_constant_identifier_names

import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:final_year_project/src/Widget/Buttons/carouselbtn.dart';
import 'package:final_year_project/src/Widget/Card_Template/template_1.dart';
import 'package:final_year_project/src/Widget/Controller/createEventController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class create_event_page_3 extends StatelessWidget {
  const create_event_page_3({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final create_Event_Controller controller;


  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final List<dynamic> templates = [
      {
        'Id': 'Template_1',
        'template': Template_1(
          height: 555, 
          width: (9/16)* 555, 
          date: controller.date_time,
          invitedBy: controller.invitedBy.value.text,
          eventName: controller.eventName.value.text,
          address: controller.location.value.text,
          isQR: controller.qrEnable!.value,
          scans: controller.scans.value,
        ),
        'background': Template_1(
          height: 800, 
          width: (9/16)* 800, 
          date: controller.date_time,
          invitedBy: controller.invitedBy.value.text,
          eventName: controller.eventName.value.text,
          address: controller.location.value.text,
          isQR: controller.qrEnable!.value,
          scans: controller.scans.value,
        ),
      },
      {
        'Id': 'Template_2',
        'template': Template_1(
          height: 555, 
          width: (9/16)* 555, 
          date: controller.date_time,
          invitedBy: controller.invitedBy.value.text,
          eventName: controller.eventName.value.text,
          address: controller.location.value.text,
          isQR: controller.qrEnable!.value,
          scans: controller.scans.value,
        ),
        'background': Template_1(
          height: 800, 
          width: (9/16)* 800, 
          date: controller.date_time,
          invitedBy: controller.invitedBy.value.text,
          eventName: controller.eventName.value.text,
          address: controller.location.value.text,
          isQR: controller.qrEnable!.value,
          scans: controller.scans.value,
        ),
      },
      {
        'Id': 'Template_3',
        'template': Template_1(
          height: 555, 
          width: (9/16)* 555, 
          date: controller.date_time,
          invitedBy: controller.invitedBy.value.text,
          eventName: controller.eventName.value.text,
          address: controller.location.value.text,
          isQR: controller.qrEnable!.value,
          scans: controller.scans.value,
        ),
        'background': Template_1(
          height: 800, 
          width: (9/16)* 800, 
          date: controller.date_time,
          invitedBy: controller.invitedBy.value.text,
          eventName: controller.eventName.value.text,
          address: controller.location.value.text,
          isQR: controller.qrEnable!.value,
          scans: controller.scans.value,
        ),
      },
      {
        'Id': 'Template_4',
        'template': Template_1(
          height: 555, 
          width: (9/16)* 555, 
          date: controller.date_time,
          invitedBy: controller.invitedBy.value.text,
          eventName: controller.eventName.value.text,
          address: controller.location.value.text,
          isQR: controller.qrEnable!.value,
          scans: controller.scans.value,
        ),
        'background': Template_1(
          height: 800, 
          width: (9/16)* 800, 
          date: controller.date_time,
          invitedBy: controller.invitedBy.value.text,
          eventName: controller.eventName.value.text,
          address: controller.location.value.text,
          isQR: controller.qrEnable!.value,
          scans: controller.scans.value,
        ),
      }
    ];

    controller.sel_ind.value = -1;

    return Scaffold(
      body: Column(
        children: [
          Obx(() {
            return SizedBox(
              height: height * 0.75,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Image.asset(
                  //   templates[controller.current_temp.value]['image'],
                  //   fit: BoxFit.fitHeight,
                  //   colorBlendMode: BlendMode.colorDodge,
                  //   filterQuality: FilterQuality.high,
                  //   height: height * 0.75,
                  // ),
                  Positioned(
                    left: 0,
                    top: 0,
                    width: width,
                    child: templates[controller.current_temp.value]['background'],
                  ),
                  Positioned.fill(
                    child: ImageFiltered(
                      imageFilter: ImageFilter.blur(
                        sigmaX: 20,
                        sigmaY: 20,
                      )
                      ),
                  ),
                  SizedBox(
                    height: height * 0.75,
                    width: width,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              Theme.of(context).scaffoldBackgroundColor,
                              Theme.of(context).scaffoldBackgroundColor,
                              Colors.transparent,
                              Colors.transparent,
                              Colors.transparent,
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter),
                      ),
                      child: Container(
                        margin: const EdgeInsets.only(
                          top: 70,
                        ),
                        child: CarouselSlider(
                            carouselController: controller.carouselController,
                            options: CarouselOptions(
                                height: 450.0,
                                aspectRatio: 16 / 9,
                                viewportFraction: 0.75,
                                enlargeCenterPage: true,
                                pageSnapping: true,
                                autoPlay: (controller.sel_ind.value == -1)
                                    ? true
                                    : false,
                                autoPlayInterval: const Duration(seconds: 4),
                                enlargeStrategy:
                                    CenterPageEnlargeStrategy.scale,
                                scrollPhysics:
                                    const AlwaysScrollableScrollPhysics(),
                                onPageChanged: (index, reason) {
                                  controller.current_temp.value = index;
                                }),
                            items: templates.map((element) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return GestureDetector(
                                    onTap: () {
                                      if (controller.current_temp.value !=
                                          controller.sel_ind.value) {
                                        controller.sel_ind.value =
                                            controller.current_temp.value;
                                        controller.templateId = element['Id'];
                                      } else {
                                        controller.sel_ind.value = -1;
                                        controller.templateId = "";
                                      }
                                      if (controller.selectedIndex == element) {
                                        controller.selectedIndex = {};
                                      } else {
                                        controller.selectedIndex = element;
                                      }
                                    },
                                    child: AnimatedContainer(
                                      duration: const Duration(milliseconds: 300),
                                      width: MediaQuery.of(context).size.width,
                                      clipBehavior: Clip.hardEdge,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        border: controller.selectedIndex == element
                                          ? Border.all(
                                              color: Colors.blue.shade500,
                                              width: 3
                                            )
                                          : Border.all(
                                              color: Colors.transparent,
                                              width: 3
                                            ),
                                        boxShadow: controller.selectedIndex == element
                                          ? [
                                              BoxShadow(
                                                color: Colors.blue.shade100,
                                                blurRadius: 30,
                                                offset: const Offset(0, 10)
                                              )
                                            ]
                                          : [
                                              BoxShadow(
                                                color: Colors.grey.withOpacity(0.8),
                                                blurRadius: 20,
                                                offset: const Offset(0, 5)
                                              )
                                            ]
                                        ),
                                      child: 
                                      Stack(
                                        alignment: Alignment.center,
                                        fit: StackFit.expand,
                                        children: 
                                        [
                                          SingleChildScrollView(
                                            child: element["template"],
                                          ),
                                          controller.selectedIndex == element
                                            ? const Positioned(
                                                top: 20,
                                                right: 20,
                                                child: Icon(
                                                  Icons.check_circle,
                                                  color: Color.fromARGB( 255, 101, 255, 107),
                                                  size: 40,
                                                  shadows: [
                                                    Shadow( 
                                                      color: Colors.black,
                                                      offset: Offset( 1, 2),
                                                      blurRadius: 15
                                                    )
                                                  ],
                                                ))
                                            : Container(),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            }).toList()),
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 5,
                      child: AnimatedSmoothIndicator(
                        activeIndex: controller.current_temp.value,
                        count: templates.length,
                        effect: const JumpingDotEffect(
                            dotWidth: 8,
                            dotHeight: 8,
                            verticalOffset: 5,
                            jumpScale: 1.6,
                            activeDotColor: Color.fromARGB(255, 66, 66, 66)),
                        // const WormEffect(dotHeight: 8, activeDotColor: Colors.blueAccent),
                      )),
                  Positioned(
                    left: 20,
                    child: carouselbtn(
                      btnicon: Icons.navigate_before_rounded,
                      text: "bckbtncarousel",
                      press: () {
                        controller.carouselController.previousPage();
                      },
                    ),
                  ),
                  Positioned(
                    right: 20,
                    child: carouselbtn(
                      btnicon: Icons.navigate_next_rounded,
                      text: "nxtbtncarousel",
                      press: () {
                        controller.carouselController.nextPage();
                      },
                    ),
                  ),
                ],
              ),
            );
          }),
          Text(
            "Select Template",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ],
      ),
    );
  }
}
