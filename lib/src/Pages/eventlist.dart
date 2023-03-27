// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:final_year_project/src/models/eventModel.dart';
import 'package:final_year_project/src/models/usermodel.dart';
import 'package:final_year_project/src/repos/events.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class eventlist extends StatelessWidget {
  const eventlist({
    super.key,
    required this.current_user,
  });

  final UserModel current_user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15),
        child: DefaultTabController(
          length: 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 50,
                // color: const Color.fromARGB(255, 229, 229, 229),
                padding: const EdgeInsets.all(3),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromARGB(20, 0, 0, 0),
                        offset: Offset(0, 0),
                        spreadRadius: 2,
                        blurRadius: 10)
                  ],
                ),
                child: TabBar(
                    isScrollable: true,
                    labelColor: Colors.blueAccent,
                    indicatorColor: Colors.blueAccent,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorWeight: 5,
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.white),
                    unselectedLabelColor: Colors.grey,
                    tabs: const [
                      Tab(
                        text: "Ongoing",
                      ),
                      Tab(text: "Upcoming"),
                      Tab(
                        text: "Completed",
                      )
                    ]),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  margin: const EdgeInsets.only(top: 20, bottom: 100),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromARGB(20, 0, 0, 0),
                          offset: Offset(0, 0),
                          spreadRadius: 2,
                          blurRadius: 10)
                    ],
                  ),
                  child: TabBarView(
                    dragStartBehavior: DragStartBehavior.down,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      Page1(current_user: current_user),
                      Page2(current_user: current_user),
                      Page3(current_user: current_user),
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
  Page1({
    Key? key,
    required this.current_user,
  }) : super(key: key);

  final UserModel current_user;
  final eventController = Get.put(getEvents());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            margin:
                const EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 5),
            child: const Text(
              "Ongoing Events",
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.grey),
            )),
        FutureBuilder(
            future: eventController.fetch(current_user.id, "active"),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  List<Event> events = snapshot.data!;

                  if (events.isNotEmpty) {
                    return Expanded(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (c, index) {
                            return OngoingEventCard(event: events[index]);
                          }),
                    );
                  } else {
                    return const Center(
                      child: Text("No Ongoing Events"),
                    );
                  }
                } else {
                  return const Center(child: Text("No data found"));
                }
              } else {
                return const Expanded(
                    child: Center(child: CircularProgressIndicator()));
              }
            }),
      ],
    );
  }
}

class Page2 extends StatelessWidget {
  Page2({
    Key? key,
    required this.current_user,
  }) : super(key: key);

  final UserModel current_user;
  final eventController = Get.put(getEvents());

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            margin:
                const EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 5),
            child: const Text(
              "Upcoming Events",
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.grey),
            )),
        Expanded(
          child: FutureBuilder(
              future: eventController.fetch(current_user.id, "upcoming"),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    List<Event> events = snapshot.data!;

                    if (events.isNotEmpty) {
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (c, index) {
                            return UpcomingEventCard(event: events[index]);
                          });
                    }
                    else{
                      return const Center(child: Text("No Upcoming Events"),);
                    }
                  } else {
                    return const Center(child: Text("No data found"));
                  }
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }),
        ),
      ],
    );
  }
}

class Page3 extends StatelessWidget {
  Page3({
    Key? key,
    required this.current_user,
  }) : super(key: key);

  final UserModel current_user;
  final eventController = Get.put(getEvents());

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            margin:
                const EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 5),
            child: const Text(
              "Completed Events",
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.grey),
            )),
        Expanded(
          child: FutureBuilder(
              future: eventController.fetch(current_user.id, "ended"),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    List<Event> events = snapshot.data!;
                    if (events.isNotEmpty) {
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (c, index) {
                            return EndedEventCard(event: events[index]);
                          });
                    }
                    else{
                      return const Center(child: Text("No Completed Events"),);
                    }
                  } else {
                    return const Center(child: Text("No data found"));
                  }
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }),
        ),
      ],
    );
  }
}

class OngoingEventCard extends StatelessWidget {
  const OngoingEventCard({
    super.key,
    required this.event,
  });

  final Event event;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: const Offset(0, 0),
                  blurRadius: 5,
                  spreadRadius: 0),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    event.eventName,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      children: const [
                        Text(
                          "Scan",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Icon(
                          Icons.qr_code_scanner_outlined,
                          size: 16,
                          color: Colors.blue,
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Divider(
                thickness: 1.5,
                color: Colors.black.withOpacity(0.05),
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Text(
                        "Status: ",
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      Text(
                        "Active",
                        style: TextStyle(color: Colors.green, fontSize: 12),
                      ),
                    ],
                  ),
                  const Text(
                    "Admin",
                    style: TextStyle(fontSize: 12),
                  )
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
          width: double.infinity,
        )
      ],
    );
  }
}

class UpcomingEventCard extends StatelessWidget {
  const UpcomingEventCard({
    super.key,
    required this.event,
  });

  final Event event;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: const Offset(0, 0),
                  blurRadius: 5,
                  spreadRadius: 0),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    event.eventName,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      children: const [
                        Text(
                          "Start",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Icon(
                          Icons.start_rounded,
                          size: 16,
                          color: Colors.blue,
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Divider(
                thickness: 1.5,
                color: Colors.black.withOpacity(0.05),
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Text(
                        "Status: ",
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      Text(
                        "Upcoming",
                        style: TextStyle(
                            color: Colors.yellow.shade600, fontSize: 12),
                      ),
                    ],
                  ),
                  const Text(
                    "Admin",
                    style: TextStyle(fontSize: 12),
                  )
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
          width: double.infinity,
        )
      ],
    );
  }
}

class EndedEventCard extends StatelessWidget {
  const EndedEventCard({
    super.key,
    required this.event,
  });

  final Event event;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: const Offset(0, 0),
                  blurRadius: 5,
                  spreadRadius: 0),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    event.eventName,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      children: const [
                        Text(
                          "Start",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Icon(
                          Icons.start_rounded,
                          size: 16,
                          color: Colors.blue,
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Divider(
                thickness: 1.5,
                color: Colors.black.withOpacity(0.05),
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Text(
                        "Status: ",
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      Text(
                        "Ended",
                        style: TextStyle(
                            color: Colors.redAccent, fontSize: 12),
                      ),
                    ],
                  ),
                  const Text(
                    "Admin",
                    style: TextStyle(fontSize: 12),
                  )
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
          width: double.infinity,
        )
      ],
    );
  }
}
