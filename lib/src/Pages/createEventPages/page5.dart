// ignore_for_file: camel_case_types, prefer_const_constructors_in_immutables

import 'package:final_year_project/src/Widget/Controller/createEventController.dart';
import 'package:final_year_project/src/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class create_event_page_5 extends StatelessWidget {
  create_event_page_5({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final create_Event_Controller controller;

  @override
  Widget build(BuildContext context) {
    bool isCopied = false;

    return FutureBuilder(
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            final eventId = snapshot.data as String;

            final formURI =
                Uri.https('theevento.live', 'EventForm', {'eventid': eventId});

            return Scaffold(
              body: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 185,
                      width: 185,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              const Color.fromARGB(255, 169, 251, 217)
                                  .withOpacity(0.3),
                              const Color.fromARGB(255, 9, 230, 112)
                                  .withOpacity(0.3)
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(95)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0),
                            offset: const Offset(20, 200),
                            spreadRadius: 20,
                            blurRadius: 20,
                          )
                        ],
                      ),
                      child: Container(
                        height: 175,
                        width: 175,
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                const Color.fromARGB(255, 169, 251, 217)
                                    .withOpacity(0.6),
                                const Color.fromARGB(255, 9, 230, 112)
                                    .withOpacity(0.6)
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(90)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0),
                              offset: const Offset(20, 200),
                              spreadRadius: 20,
                              blurRadius: 20,
                            )
                          ],
                        ),
                        child: Container(
                          height: 160,
                          width: 160,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                                colors: [
                                  Color.fromARGB(255, 169, 251, 217),
                                  Color.fromARGB(255, 9, 230, 112)
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(80)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0),
                                offset: const Offset(20, 200),
                                spreadRadius: 20,
                                blurRadius: 20,
                              )
                            ],
                          ),
                          child: Icon(
                            Icons.check,
                            color: Theme.of(context).scaffoldBackgroundColor,
                            size: 90,
                            shadows: [
                              Shadow(
                                color: Colors.black.withOpacity(0.25),
                                blurRadius: 35,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 20,
                      width: 160,
                      margin: const EdgeInsets.only(top: 10, bottom: 20),
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.45),
                                offset: const Offset(0, 0),
                                blurRadius: 30)
                          ]),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 50),
                      child: Column(
                        children: [
                          Text(
                            "Event Created",
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          RichText(
                            text: TextSpan(
                                text: "Your Event ",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge
                                    ?.apply(
                                        fontSizeFactor: 0.4,
                                        color: Colors.grey),
                                children: [
                                  TextSpan(
                                    text: controller.eventName.value.text,
                                    style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 9, 230, 112)),
                                  ),
                                  const TextSpan(
                                      text: " has been successfully created.")
                                ]),
                            textAlign: TextAlign.center,
                            softWrap: true,
                          ),
                        ],
                      ),
                    ),
                    if (controller.registrationForm.value)
                      GestureDetector(
                        onTap: () {
                          Clipboard.setData(
                                  ClipboardData(text: formURI.toString()))
                              .then((value) => {
                                    isCopied = true,
                                    Fluttertoast.showToast(
                                        msg: "URL Copied",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor:
                                            Colors.black.withOpacity(0.6),
                                        textColor: Colors.white,
                                        fontSize: 16.0)
                                  });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          margin: const EdgeInsets.only(bottom: 30),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: const Color.fromARGB(255, 246, 246, 246),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Copy Form URL ",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge
                                    ?.apply(
                                        fontSizeFactor: 0.5,
                                        color: const Color.fromARGB(
                                            255, 101, 157, 255)),
                              ),
                              const Icon(
                                Icons.copy_rounded,
                                color: Color.fromARGB(255, 101, 157, 255),
                              )
                            ],
                          ),
                        ),
                      ),
                    GestureDetector(
                      onTap: () {
                          if (controller.registrationForm.value && !isCopied) {
                            Clipboard.setData(
                                    ClipboardData(text: formURI.toString()))
                                .then((value) => {
                                      isCopied = true,
                                      Fluttertoast.showToast(
                                          msg: "URL Copied",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.CENTER,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor:
                                              Colors.black.withOpacity(0.6),
                                          textColor: Colors.white,
                                          fontSize: 16.0)
                                    });
                          }
                          Get.offAll(() => const Dashboard());
                      },
                      child: Container(
                        height: 60,
                        width: 160,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              colors: [
                                Color.fromARGB(255, 169, 251, 217),
                                Color.fromARGB(255, 29, 233, 124)
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomCenter),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(80)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              offset: const Offset(5, 5),
                              spreadRadius: 0,
                              blurRadius: 10,
                            )
                          ],
                        ),
                        child: Text(
                          "Done",
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge
                              ?.apply(
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  fontSizeFactor: 0.45),
                          // shadows: [
                          //   Shadow(
                          //     color: Colors.black.withOpacity(0.25),
                          //     blurRadius: 35,
                          //   )
                          // ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        }

        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      }),
      future: controller.createEvent(controller),
    );
  }
}
