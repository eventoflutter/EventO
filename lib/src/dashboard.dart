// ignore_for_file: library_private_types_in_public_api

import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:final_year_project/src/Pages/eventlist.dart';
import 'package:final_year_project/src/Widget/Controller/createEventController.dart';
import 'package:final_year_project/src/Widget/Event/createEvent.dart';
// import 'package:final_year_project/src/Menus/MenuTabBar.dart';
import 'package:final_year_project/src/constants/image_constants.dart';
import 'package:final_year_project/src/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with TickerProviderStateMixin {
  final _pageController = PageController(initialPage: 2);

  int maxCount = 5;

  final controller = Get.put(create_Event_Controller());

  /// widget list
  final List<Widget> bottomBarPages = [
    const Page1(),
    const Page2(),
    const eventlist(),
    const Page4(),
    const Page5(),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return SafeArea(
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  bottomOpacity: 0,
                  shadowColor: const Color.fromARGB(21, 0, 0, 0),
                  leading: const Icon(
                    Icons.menu,
                    color: Colors.black54,
                  ),
                  title: const Center(
                      child: Image(
                    image: AssetImage(logoBlue),
                    height: 70,
                    fit: BoxFit.cover,
                  )),
                  actions: [
                    IconButton(
                        onPressed: () {
                          //authRepository.instance.logout();
                          Get.to(() => Profile(
                                controller: controller,
                              ));
                        },
                        icon: const Icon(
                          Icons.person_outline_outlined,
                          color: Colors.black54,
                        )),
                  ],
                ),
                body: PageView(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: List.generate(
                      bottomBarPages.length, (index) => bottomBarPages[index]),
                ),
                extendBody: true,
                bottomNavigationBar: (bottomBarPages.length <= maxCount)
                    ? AnimatedNotchBottomBar(
                        pageController: _pageController,
                        showBlurBottomBar: true,
                        blurFilterX: 8,
                        blurFilterY: 14,
                        blurOpacity: 0.8,
                        color: Colors.white,
                        showLabel: false,
                        notchColor: Colors.white,
                        bottomBarItems: [
                          const BottomBarItem(
                            inActiveItem: Icon(
                              Icons.home_filled,
                              color: Colors.blueGrey,
                            ),
                            activeItem: Icon(
                              Icons.home_filled,
                              color: Colors.blueAccent,
                            ),
                            itemLabel: 'Page 1',
                          ),
                          const BottomBarItem(
                            inActiveItem: Icon(
                              Icons.star,
                              color: Colors.blueGrey,
                            ),
                            activeItem: Icon(
                              Icons.star,
                              color: Colors.blueAccent,
                            ),
                            itemLabel: 'Page 2',
                          ),
                          // ignore: prefer_const_constructors
                          BottomBarItem(
                            inActiveItem: const Icon(
                              Icons.add,
                              color: Colors.blueGrey,
                            ),
                            activeItem: Container(
                              alignment: Alignment.center,
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: -16,
                                    left: -16,
                                    child: IconButton(
                                      onPressed: () {
                                        Get.to(
                                            () => createEvent(
                                                  controller: controller,
                                                ),
                                            transition:
                                                Transition.cupertinoDialog,
                                            curve: Curves.ease,
                                            duration: const Duration(
                                                milliseconds: 1200),
                                            popGesture: true);
                                        // Navigator.push(context, ConcentricPageRoute(builder: (ctx) {return const createEvent();}));
                                      },
                                      iconSize: 40,
                                      icon: const Icon(
                                        Icons.add_rounded,
                                        color: Colors.blueAccent,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            itemLabel: 'Page 3',
                          ),
                          const BottomBarItem(
                            inActiveItem: Icon(
                              Icons.settings,
                              color: Colors.blueGrey,
                            ),
                            activeItem: Icon(
                              Icons.settings,
                              color: Colors.pink,
                            ),
                            itemLabel: 'Page 4',
                          ),
                          const BottomBarItem(
                            inActiveItem: Icon(
                              Icons.person,
                              color: Colors.blueGrey,
                            ),
                            activeItem: Icon(
                              Icons.person,
                              color: Colors.yellow,
                            ),
                            itemLabel: 'Page 5',
                          ),
                        ],
                        onTap: (index) {
                          /// control your animation using page controller
                          _pageController.animateToPage(
                            index,
                            duration: const Duration(milliseconds: 700),
                            curve: Curves.easeOutBack,
                          );
                        },
                      )
                    : null,
              ),
            );
          }
        }

        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      },
      future: controller.getUser(),
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        // color: const Color(0xffb5d6d6),
        color: Colors.white,
        child: const Center(child: Text('Page 1')));
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        // color: const Color(0xFFABD0A1),
        color: Colors.white,
        child: const Center(child: Text('Page 2')));
  }
}

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        // color: const Color(0xFFA3A1D0),
        color: Colors.white,
        child: const Center(child: Text('Page 3')));
  }
}

class Page4 extends StatelessWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        // color: const Color(0xFFD0A1A1),
        color: Colors.white,
        child: const Center(child: Text('Page 4')));
  }
}

class Page5 extends StatelessWidget {
  const Page5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        // color: const Color(0xFFD0BCA1),
        color: Colors.white,
        child: const Center(child: Text('Page 4')));
  }
}
