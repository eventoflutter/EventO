// ignore_for_file: camel_case_types, file_names, must_be_immutable

import 'package:final_year_project/src/Widget/Buttons/backbutton.dart';
import 'package:final_year_project/src/Widget/Controller/createEventController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:intl/intl.dart';

class createEvent extends StatefulWidget {
  const createEvent({super.key});

  @override
  State<createEvent> createState() => _createEventState();
}

class _createEventState extends State<createEvent> {

  final controller = Get.put(create_Event_Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 44, 188, 255),
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
                        style: Theme.of(context).textTheme.headlineMedium?.apply(
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
                        controller: controller.startTime,
                        label: "Start Timing",
                        ic: LineAwesomeIcons.calendar_1,
                        enabled: true,
                        press: () async 
                        {
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
                          DateTime startDate = DateTime(dat!.year, dat!.month, dat!.day, tim!.hour, tim!.minute);
          
                          setState(() {
                            controller.startTime.text = DateFormat('d/MMM/y | h:mm a').format(startDate);
                            controller.date_time = startDate;
                          });
          
                        }
                        ),
                      const SizedBox(
                        height: 20,
                      ),
                      inputField(
                        label: "Location", 
                        ic: LineAwesomeIcons.map_marked, 
                        controller: controller.location
                      )
                    ],
                  ))
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.navigate_next_rounded,
          color: Colors.black,
          size: 40,
        ),
      ),
    );
  }
}

class inputField extends StatelessWidget {
  inputField({
    Key? key,
    required this.label,
    required this.ic,
    required this.controller,
    this.press,
    this.enabled = false,
  }) : super(key: key);

  final String label;
  final IconData ic;
  VoidCallback? press = () {};
  bool enabled;
  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onTap: press,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        prefixIcon: Icon(ic, color: Colors.black, shadows: [
          Shadow(
              color: Colors.black.withOpacity(0.1),
              offset: const Offset(1, 1),
              blurRadius: 10),
        ],
        size: 26,
        ),
        labelText: label,
        labelStyle: const TextStyle(color: Colors.black),
        hintText: label,
        hintStyle: const TextStyle(color: Colors.black),

        // border: OutlineInputBorder(
        //     borderRadius: BorderRadius.all(Radius.circular(50)),
        //     borderSide: BorderSide(color: Colors.white)
        // ),
        enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            borderSide: BorderSide(color: Colors.black)),
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            borderSide: BorderSide(color: Colors.black)),
      ),
      style: const TextStyle(color: Colors.black),
      cursorColor: const Color.fromARGB(255, 38, 38, 38),
      readOnly: enabled,
      textInputAction: TextInputAction.next,
    );
  }
}
