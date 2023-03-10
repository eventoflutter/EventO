// ignore_for_file: file_names
import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  final String admin;
  final String eventName;
  final String description;
  final String startTime;
  final String location;
  final bool qrEnable;
  final int noOfScans;
  final String templateId;
  final bool sendOnWhatsApp;
  final bool sendOnEmail;
  final bool dataFile;
  final String dataFileName;
  final bool registrationForm;
  final bool formName;
  final bool formWhatsApp;
  final bool formEmail;
  final bool formAddress;

  Event({
    required this.admin,
    required this.eventName,
    required this.description,
    required this.startTime,
    required this.location,
    required this.qrEnable,
    required this.noOfScans,
    required this.templateId,
    required this.sendOnWhatsApp,
    required this.sendOnEmail,
    required this.dataFile,
    required this.dataFileName,
    required this.registrationForm,
    required this.formName,
    required this.formWhatsApp,
    required this.formEmail,
    required this.formAddress,
  });

  toJson() {
    return {
      "Admin": admin,
      "EventName": eventName,
      "Description": description,
      "StartTime": startTime,
      "Location": location,
      "IsQr": qrEnable,
      "Scans": noOfScans,
      "TemplateId": templateId,
      "SendOnWhatsApp": sendOnWhatsApp,
      "SendOnEmail": sendOnEmail,
      "IsDataFile": dataFile,
      "FileName": dataFileName,
      "IsForm": registrationForm,
      "FormName": formName,
      "FormMobile": formWhatsApp,
      "FormEmail": formEmail,
      "FormAddress": formAddress,
    };
  }

  factory Event.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;

    Event event = Event(
        admin: data["Admin"],
        eventName: data["EventName"],
        description: data["Description"],
        startTime: data["StartTime"],
        location: data["Location"],
        qrEnable: data["IsQr"],
        noOfScans: data["Scans"],
        templateId: data["TemplateId"],
        sendOnWhatsApp: data["SendOnWhatsApp"],
        sendOnEmail: data["SendOnEmail"],
        dataFile: data["IsDataFile"],
        dataFileName: data["FileName"],
        registrationForm: data["IsForm"],
        formName: data["FormName"],
        formWhatsApp: data["FormMobile"],
        formEmail: data["FormEmail"],
        formAddress: data["FormAddress"]
      );

    return event;
  }
}
