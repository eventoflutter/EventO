// ignore_for_file: file_names, camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_year_project/src/Widget/Controller/createEventController.dart';
import 'package:final_year_project/src/models/eventModel.dart';
import 'package:get/get.dart';

class registerEvent extends GetxController {
  final _db = FirebaseFirestore.instance;

  Future<String> register(create_Event_Controller controller) async {
    Event event = Event(
        admin: controller.current_user.id,
        eventName: controller.eventName.value.text,
        description: controller.desc.value.text,
        startTime: controller.date_time.millisecondsSinceEpoch.toString(),
        location: controller.location.value.text,
        qrEnable: controller.qrEnable!.value,
        noOfScans: controller.scans.value,
        templateId: controller.templateId,
        sendOnWhatsApp: controller.sendOnWhatsApp.value,
        sendOnEmail: controller.sendOnEmail.value,
        dataFile: controller.dataFileSelected.value,
        dataFileName: controller.dataFile.value.name,
        registrationForm: controller.registrationForm.value,
        formName: controller.formFeilds.isName.value,
        formWhatsApp: controller.formFeilds.isPhone.value,
        formEmail: controller.formFeilds.isEmail.value,
        formAddress: controller.formFeilds.isAddress.value,
        invitedBy: controller.invitedBy.value.text,
      );

    String eventId = "";

    var data = event.toJson();

    data["StartTime"] = Timestamp.fromMillisecondsSinceEpoch(controller.date_time.millisecondsSinceEpoch);

    await _db
        .collection("Events")
        .add(data)
        .then((DocumentReference doc) {
      eventId = doc.id;
    });

    await _db.collection("Users").doc(controller.current_user.id).update({
      "EventsCreated": FieldValue.arrayUnion([eventId]),
    });

    return eventId;
  }
}
