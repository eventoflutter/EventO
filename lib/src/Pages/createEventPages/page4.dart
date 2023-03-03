// ignore_for_file: camel_case_types, prefer_const_constructors_in_immutables

import 'package:file_picker/file_picker.dart';
import 'package:final_year_project/src/Widget/Controller/createEventController.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class create_event_page_4 extends StatelessWidget {
  create_event_page_4({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final create_Event_Controller controller;

  @override
  Widget build(BuildContext context) {
    Color scafColor = Theme.of(context).scaffoldBackgroundColor;

    Rx<double> y = 0.0.obs;

    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 120),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            padding:
                const EdgeInsets.only(top: 40, bottom: 20, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Invitations",
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge
                      ?.apply(color: Colors.grey.shade600),
                ),
                Divider(
                  color: Colors.grey.shade400,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Where to send?",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.apply(color: Colors.grey.shade600),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (controller.sendOnWhatsApp.value && !controller.sendOnEmail.value) {
                          Get.snackbar(
                            "Atleast One Feild Mandatory",
                            "Either WhatsApp or Email should be selected",
                            colorText: Colors.redAccent,
                            snackPosition: SnackPosition.BOTTOM,
                            margin: const EdgeInsets.only(bottom: 20),
                            icon: const Icon(
                              Icons.error_outline_rounded,
                              color: Colors.redAccent,
                            ),
                            shouldIconPulse: true,
                            backgroundColor: Colors.redAccent.withOpacity(0.25),
                            barBlur: 10,
                            maxWidth: 0.9 * width,
                          );
                        }else{
                          controller.sendOnWhatsApp.value = !controller.sendOnWhatsApp.value;
                          controller.formFeilds.isPhone.value = controller.sendOnWhatsApp.value;
                        }
                      },
                      child: Obx(() {
                        return customCheckBox(
                          ckName: "WhatsApp",
                          ckicon: LineAwesomeIcons.what_s_app,
                          ckiconColor: Colors.green,
                          isSelected: controller.sendOnWhatsApp.value,
                        );
                      }),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (controller.sendOnEmail.value && !controller.sendOnWhatsApp.value) {
                          Get.snackbar(
                            "Atleast One Feild Mandatory",
                            "Either WhatsApp or Email should be selected",
                            colorText: Colors.redAccent,
                            snackPosition: SnackPosition.BOTTOM,
                            margin: const EdgeInsets.only(bottom: 20),
                            icon: const Icon(
                              Icons.error_outline_rounded,
                              color: Colors.redAccent,
                            ),
                            shouldIconPulse: true,
                            backgroundColor: Colors.redAccent.withOpacity(0.25),
                            barBlur: 10,
                            maxWidth: 0.9 * width,
                            snackStyle: SnackStyle.FLOATING
                          );
                        }else{
                          controller.sendOnEmail.value = !controller.sendOnEmail.value;
                          controller.formFeilds.isEmail.value = controller.sendOnEmail.value;
                        }
                      },
                      child: Obx(() {
                        return customCheckBox(
                          ckName: "E-mail",
                          ckicon: Icons.mail_outlined,
                          ckiconColor: Colors.redAccent,
                          isSelected: controller.sendOnEmail.value,
                        );
                      }),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                // Upload File
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Upload Available Data",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.apply(color: Colors.grey.shade600),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Obx(() {
                      return GestureDetector(
                        onTap: () async {
                          FilePickerResult? result =
                              await FilePicker.platform.pickFiles();

                          if (result != null) {
                            PlatformFile file = result.files.first;

                            controller.dataFile.value = file;

                            controller.dataFileSelected.value = true;
                          } else {
                            // User canceled the picker
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.all(13),
                          decoration: BoxDecoration(
                              color: scafColor,
                              border: controller.dataFileSelected.value
                                  ? Border.all(
                                      color: Colors.blue.shade500, width: 1)
                                  : Border.all(color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(25)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Text(
                                  controller.dataFileSelected.value
                                      ? "File: ${controller.dataFile.value.name}"
                                      : "File: .csv, .xlsx, etc",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall
                                      ?.apply(
                                          fontSizeFactor: 0.7,
                                          color:
                                              controller.dataFileSelected.value
                                                  ? Colors.blue.shade500
                                                  : Colors.grey.shade600),
                                  softWrap: false,
                                  overflow: TextOverflow.fade,
                                ),
                              ),
                              controller.dataFileSelected.value
                                  ? GestureDetector(
                                      onTap: () {
                                        controller.dataFile.value =
                                            PlatformFile(name: "", size: 0);
                                        controller.dataFileSelected.value =
                                            false;
                                      },
                                      child: Container(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: const Icon(
                                            Icons.close,
                                            color: Colors.red,
                                            size: 20,
                                          )))
                                  : Icon(
                                      Icons.file_upload_outlined,
                                      color: controller.dataFileSelected.value
                                          ? Colors.blue.shade500
                                          : Colors.grey.shade600,
                                    ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                // Registration Form
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Registration form",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.apply(color: Colors.grey.shade600),
                        ),
                        Obx(() {
                          return SizedBox(
                            height: 30,
                            child: NeumorphicSwitch(
                              style: NeumorphicSwitchStyle(
                                inactiveThumbColor: scafColor,
                                inactiveTrackColor: scafColor,
                                activeThumbColor: scafColor,
                                activeTrackColor: Colors.blue.shade500,
                              ),
                              value: controller.registrationForm.value,
                              onChanged: (value) {
                                controller.registrationForm.value = value;
                                y.value = value ? 1 : 0;
                              },
                            ),
                          );
                        }),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Obx(() {
                      return SizedBox(
                        child: controller.registrationForm.value
                            ? AnimatedContainer(
                                duration: const Duration(milliseconds: 1000),
                                width: double.maxFinite,
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: scafColor,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        blurRadius: 20,
                                        offset: const Offset(0, 5)),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Select Form Feilds",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall
                                          ?.apply(
                                              color: Colors.grey.shade600,
                                              fontSizeFactor: 0.7),
                                    ),
                                    Divider(
                                      color: Colors.grey.shade400,
                                    ),
                                    SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          selectFormFeild(
                                            controller:
                                                controller.formFeilds.isName,
                                            title: "Name",
                                            toCheck: RxBool(false),
                                          ),
                                          selectFormFeild(
                                            controller:
                                                controller.formFeilds.isPhone,
                                            title: "WhatsApp Number",
                                            toCheck: controller.sendOnWhatsApp,
                                          ),
                                          selectFormFeild(
                                            controller:
                                                controller.formFeilds.isEmail,
                                            title: "E-mail Id",
                                            toCheck: controller.sendOnEmail,
                                          ),
                                          selectFormFeild(
                                            controller:
                                                controller.formFeilds.isAddress,
                                            title: "Address",
                                            toCheck: RxBool(false),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : null,
                      );
                    }),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class selectFormFeild extends StatelessWidget {
  const selectFormFeild(
      {super.key,
      required this.controller,
      required this.title,
      required this.toCheck});

  final String title;
  final RxBool controller;
  final RxBool toCheck;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Obx(() {
      return Container(
        margin: const EdgeInsets.only(bottom: 8),
        child: GestureDetector(
          onTap: () {
            if (toCheck.value && controller.value) {
              Get.snackbar(
                "Mandatory Field",
                "$title is a mandatory feild",
                colorText: Colors.redAccent,
                snackPosition: SnackPosition.BOTTOM,
                margin: const EdgeInsets.only(bottom: 20),
                icon: const Icon(
                  Icons.error_outline_rounded,
                  color: Colors.redAccent,
                ),
                shouldIconPulse: true,
                backgroundColor: Colors.redAccent.withOpacity(0.25),
                barBlur: 10,
                maxWidth: 0.9 * width,
              );
            } else {
              controller.value = !controller.value;
            }
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.025),
                borderRadius: BorderRadius.circular(25),
                border: controller.value
                    ? Border.all(color: Colors.blue.shade500, width: 1)
                    : Border.all(color: Colors.transparent, width: 1)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title,
                    style: Theme.of(context).textTheme.headlineSmall?.apply(
                        fontSizeFactor: 0.65, color: Colors.grey.shade700)),
                controller.value
                    ? const Icon(
                        Icons.check_circle_outline_rounded,
                        color: Colors.green,
                      )
                    : Icon(
                        Icons.circle_outlined,
                        color: Colors.grey.shade600,
                      )
              ],
            ),
          ),
        ),
      );
    });
  }
}

class customCheckBox extends StatelessWidget {
  const customCheckBox({
    super.key,
    required this.ckName,
    required this.ckicon,
    required this.ckiconColor,
    required this.isSelected,
  });

  final String ckName;
  final IconData ckicon;
  final Color ckiconColor;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        border: isSelected
            ? Border.all(color: Colors.blue.shade500, width: 1)
            : Border.all(color: Colors.transparent, width: 1),
        borderRadius: BorderRadius.circular(25),
        boxShadow: isSelected
            ? [
                BoxShadow(
                    color: Colors.blue.shade100,
                    blurRadius: 10,
                    offset: const Offset(0, 5))
              ]
            : [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.08),
                    blurRadius: 20,
                    offset: const Offset(0, 5))
              ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            ckicon,
            color: ckiconColor.withOpacity(1),
            shadows: [
              Shadow(
                  color: ckiconColor.withOpacity(0.7),
                  offset: const Offset(1, 1),
                  blurRadius: 10)
            ],
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            ckName,
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.apply(fontSizeFactor: 0.7, color: Colors.grey.shade600),
          )
        ],
      ),
    );
  }
}
