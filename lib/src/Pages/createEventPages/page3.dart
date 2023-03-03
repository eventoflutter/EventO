// ignore_for_file: library_private_types_in_public_api, camel_case_types, non_constant_identifier_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:final_year_project/src/Widget/Buttons/carouselbtn.dart';
import 'package:final_year_project/src/Widget/Controller/createEventController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class create_event_page_3 extends StatelessWidget {
  create_event_page_3({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final create_Event_Controller controller;

  final List<dynamic> _products = [
    {
      'title': 'Adidas Originals \nby Alexander Wang',
      'image': 'assets/images/card_demo_1.jpg',
      'description': 'Limited collection'
    },
    {
      'title': 'Adidas Originals \nby Alexander Wang',
      'image': 'assets/images/card_demo_2.jpg',
      'description': 'Limited collection'
    },
    {
      'title': 'Adidas Originals \nby Alexander Wang',
      'image': 'assets/images/card_demo_3.jpg',
      'description': 'Limited collection'
    },
    {
      'title': 'Adidas Originals \nby Alexander Wang',
      'image': 'assets/images/card_demo_4.jpg',
      'description': 'Limited collection'
    }
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

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
                  Image.asset(
                    _products[controller.current_temp.value]['image'],
                    fit: BoxFit.fitHeight,
                    colorBlendMode: BlendMode.colorDodge,
                    filterQuality: FilterQuality.high,
                    height: height * 0.75,
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
                                viewportFraction: 0.70,
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
                            items: _products.map((movie) {
                              return Builder(
                                builder: (BuildContext context) {
                                  return GestureDetector(
                                    onTap: () {
                                      if (controller.current_temp.value !=
                                          controller.sel_ind.value) {
                                        controller.sel_ind.value =
                                            controller.current_temp.value;
                                      } else {
                                        controller.sel_ind.value = -1;
                                      }
                                      if (controller.selectedIndex == movie) {
                                        controller.selectedIndex = {};
                                      } else {
                                        controller.selectedIndex = movie;
                                      }
                                    },
                                    child: AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          border: controller.selectedIndex ==
                                                  movie
                                              ? Border.all(
                                                  color: Colors.blue.shade500,
                                                  width: 3)
                                              : null,
                                          boxShadow: controller.selectedIndex ==
                                                  movie
                                              ? [
                                                  BoxShadow(
                                                      color:
                                                          Colors.blue.shade100,
                                                      blurRadius: 30,
                                                      offset:
                                                          const Offset(0, 10))
                                                ]
                                              : [
                                                  BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.2),
                                                      blurRadius: 20,
                                                      offset:
                                                          const Offset(0, 5))
                                                ]),
                                      child: SingleChildScrollView(
                                        physics: const BouncingScrollPhysics(),
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 320,
                                              width: double.maxFinite,
                                              margin: const EdgeInsets.only(
                                                  top: 6, left: 6, right: 6),
                                              clipBehavior: Clip.hardEdge,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Stack(
                                                alignment: Alignment.center,
                                                children: [
                                                  Image.asset(
                                                    movie['image'],
                                                    fit: BoxFit.cover,
                                                    height: 320,
                                                    width: double.maxFinite,
                                                  ),
                                                  controller.selectedIndex ==
                                                          movie
                                                      ? const Positioned(
                                                          top: 20,
                                                          right: 20,
                                                          child: Icon(
                                                            Icons.check_circle,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    101,
                                                                    255,
                                                                    107),
                                                            size: 40,
                                                            shadows: [
                                                              Shadow(
                                                                  color: Colors
                                                                      .black,
                                                                  offset:
                                                                      Offset(
                                                                          1, 2),
                                                                  blurRadius:
                                                                      15)
                                                            ],
                                                          ))
                                                      : Container(),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Text(
                                              controller.startTime.value.text,
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Text(
                                              movie['description'],
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.grey.shade600),
                                            ),
                                          ],
                                        ),
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
                        count: _products.length,
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
