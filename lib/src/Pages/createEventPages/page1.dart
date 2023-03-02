// ignore_for_file: camel_case_types

import 'package:final_year_project/src/Widget/Buttons/backbutton.dart';
import 'package:final_year_project/src/Widget/Controller/createEventController.dart';
import 'package:final_year_project/src/Widget/TextFeilds/createEventTextFeild.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class create_event_page_1 extends StatelessWidget {
  const create_event_page_1({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final create_Event_Controller controller;

  @override
  Widget build(BuildContext context) {

    final usermodel = controller.current_user;
    String invitorName = usermodel.name != "" ? usermodel.name : usermodel.username;

    controller.invitedBy =  TextEditingController.fromValue(TextEditingValue(text: invitorName));
    
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 199, 232, 255),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(top: 40, left: 0, child: backbutton(context: context)),
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 80),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Create Event",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.apply(
                                color: Colors.white,
                                fontWeightDelta: 600,
                                shadows: const [
                              Shadow(
                                  color: Color.fromARGB(255, 57, 130, 255),
                                  offset: Offset(1, 1),
                                  blurRadius: 10)
                            ]),
                      ),
                      Text(
                        "Create an event in just few steps!!",
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge
                            ?.apply(color: Colors.white, fontWeightDelta: 0),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Form(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      inputField(
                        controller: controller.eventName,
                        label: "Event Name",
                        ic: LineAwesomeIcons.landmark,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      inputField(
                        controller: controller.desc,
                        label: "Description",
                        ic: LineAwesomeIcons.edit,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      inputField(
                          controller: controller.startTime.value,
                          label: "Start Timing",
                          ic: LineAwesomeIcons.calendar_1,
                          enabled: true,
                          press: () async {
                            TimeOfDay? tim;
                            DateTime? dat;

                            await showDialog<DateTime>(
                              context: context,
                              builder: (context) {
                                return DatePickerDialog(
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(2050),
                                  confirmText: "Next",
                                  initialCalendarMode: DatePickerMode.day,
                                );
                              },
                            ).then((value) => dat = value);

                            if (context.mounted) {}

                            await showDialog<TimeOfDay>(
                                context: context,
                                builder: (context) {
                                  return TimePickerDialog(
                                    initialTime: TimeOfDay.now(),
                                    hourLabelText: "Hours",
                                    minuteLabelText: "Minutes",
                                  );
                                }).then((value) => tim = value);

                            if (dat == null || tim == null) {
                              return;
                            }
                            DateTime startDate = DateTime(dat!.year, dat!.month,
                                dat!.day, tim!.hour, tim!.minute);

                            controller.startTime.value.text =
                                DateFormat('d/MMM/y | h:mm a')
                                    .format(startDate);
                            controller.date_time = startDate;
                          }),
                      const SizedBox(
                        height: 20,
                      ),
                      inputField(
                        label: "Location",
                        ic: LineAwesomeIcons.map_marked,
                        controller: controller.location
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      inputField(
                        label: "Invited By",
                        ic: LineAwesomeIcons.hashtag,
                        controller: controller.invitedBy,
                      ),
                    ],
                  ))
                ],
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     controller.nextPage();
      //   },
      //   backgroundColor: Colors.white,
      //   child: const Icon(
      //     Icons.navigate_next_rounded,
      //     color: Colors.black,
      //     size: 40,
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat   ,
    );
  }
}
