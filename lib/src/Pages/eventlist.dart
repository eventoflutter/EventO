// ignore_for_file: camel_case_types

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class eventlist extends StatefulWidget {
  const eventlist({super.key});

  @override
  State<eventlist> createState() => _eventlistState();
}

class _eventlistState extends State<eventlist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: DefaultTabController(
          length: 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget> [
              Container(
                height: 50,
                // color: const Color.fromARGB(255, 229, 229, 229),
                padding: const EdgeInsets.all(3),
                decoration:  const BoxDecoration(
                  color:  Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  boxShadow: [BoxShadow(color: Color.fromARGB(20, 0, 0, 0), offset: Offset(0, 0), spreadRadius: 2, blurRadius: 10)],
                ),
                child: TabBar(
                  isScrollable: true,
                  labelColor: Colors.blueAccent,
                  indicatorColor: Colors.blueAccent,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorWeight: 5,
                  indicator: BoxDecoration(borderRadius: BorderRadius.circular(25), color: Colors.white),
                  unselectedLabelColor: Colors.grey,
                  tabs: const [Tab(text: "Ongoing",), Tab(text: "Upcoming"), Tab(text: "Completed",)]
                ),
              ),
              Expanded(
                child: Container(
                  // height: 550,
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.only(top: 20, bottom: 100),
                  decoration:  const BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    boxShadow: [BoxShadow(color: Color.fromARGB(20, 0, 0, 0), offset: Offset(0, 0), spreadRadius: 2, blurRadius: 10)],
                  ),
                  child:  const TabBarView(
                    dragStartBehavior: DragStartBehavior.down,
                    physics: BouncingScrollPhysics(),
                    children: 
                    [
                      Page1(),
                      Page2(),
                      Page3(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 200,
        color: const Color(0xffb5d6d6), 
        // color: Colors.white,
        child: const Center(child: Text('Page 1')));
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 200,
        color: const Color(0xFFABD0A1),
        // color: Colors.white, 
        child: const Center(child: Text('Page 2')));
  }
}

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        // height: 200,
        color: const Color(0xFFA3A1D0), 
        // color: Colors.white,
        child: const Center(child: Text('Page 3')));
  }
}
