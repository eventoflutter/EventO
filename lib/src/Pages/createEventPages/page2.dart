// ignore_for_file: camel_case_types

import 'package:final_year_project/src/constants/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:final_year_project/src/Widget/Controller/createEventController.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:simple_shadow/simple_shadow.dart';

class create_event_page_2 extends StatelessWidget {
  const create_event_page_2({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final create_Event_Controller controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xfffddcdf),
        body: Container(
          padding: const EdgeInsets.all(20),
          child:
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Center(
              child: SimpleShadow(
                  opacity: 0.2,
                  offset: const Offset(-8, 8),
                  sigma: 4,
                  child: const Image(
                    image: AssetImage(qrCode),
                  )),
            ),
            Text(
              "Want QR Code? ",
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.headlineMedium?.apply(
                  // color: const Color.fromARGB(255, 138, 138, 138),
                  color: const Color(0xFF686868),
                  fontWeightDelta: 500,
                  shadows: [
                    Shadow(
                        color: Colors.black.withOpacity(0.3),
                        offset: const Offset(1, 1),
                        blurRadius: 5)
                  ]),
            ),
            const SizedBox(
              height: 20,
            ),
            Obx(() {
              return Row(
                children: [
                  Expanded(
                    child: RadioListTile<bool>(
                      title: const Text("Yes"),
                      activeColor: Colors.green,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                      value: true,
                      groupValue: controller.qrEnable?.value,
                      onChanged: (value) {
                        controller.qrEnable?.value = value!;
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<bool>(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 0),
                      title: const Text("No"),
                      activeColor: Colors.green,
                      value: false,
                      groupValue: controller.qrEnable?.value,
                      onChanged: (value) {
                        controller.qrEnable?.value = value!;
                      },
                    ),
                  )
                ],
              );
            }),
            // const SizedBox(
            //   height: 20,
            // ),
            Obx(() {
              return Container(
                child: controller.qrEnable!.value
                    ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Divider(
                          height: 40,
                          thickness: 2,
                          color:  Color.fromARGB(67, 104, 104, 104),
                        ),
                        Text(
                          "Number of Scans allowed",
                          textAlign: TextAlign.start,
                          style: Theme.of(context).textTheme.bodyLarge?.apply(
                              color: const Color(0xFF686868),
                              fontWeightDelta: 600,
                              shadows: [
                                Shadow(
                                    color: Colors.black.withOpacity(0.1),
                                    offset: const Offset(1, 1),
                                    blurRadius: 2)
                              ]),
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: 30,
                              width: 30,
                              child: FloatingActionButton(
                                onPressed: () {
                                  controller.decre();
                                },
                                backgroundColor: const Color(0xfffddcdf),
                                child: const Icon(
                                  LineAwesomeIcons.minus_circle,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            const SizedBox(width: 20,),
                            SizedBox(width:20,child: Text('${controller.scans}', textAlign: TextAlign.center,
                            style: const TextStyle(color: Color(0xFF686868),fontSize: 30.0))),
                            const SizedBox(width: 20,),
                            SizedBox(
                              height: 30,
                              width: 30,
                              child: FloatingActionButton(
                                onPressed: () {
                                  controller.incre();
                                },
                                backgroundColor: const Color(0xfffddcdf),
                                child: const Icon(
                                  LineAwesomeIcons.plus_circle,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                    : null,
              );
            }),
          ]),
        ));
  }
}
