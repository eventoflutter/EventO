// ignore_for_file: camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_year_project/src/models/eventModel.dart';
import 'package:get/get.dart';

class getEvents extends GetxController {
   Future<List<Event>> fetch(String uid, String type) async {
    final db = FirebaseFirestore.instance;

    final DateTime now = DateTime.now();

    if (type == "upcoming") {
      var snapshot = await db.collection("Events").where("Admin", isEqualTo: uid).where("Status", isEqualTo: "upcoming").where("StartTime", isGreaterThan: now).get();
      return snapshot.docs.map((e) => Event.fromSnapshot(e)).toList();
    }
    else if(type == "active"){
      var snapshot = await db.collection("Events").where("Admin", isEqualTo: uid).where("StartTime", isLessThanOrEqualTo: now).where("Status", isEqualTo: "upcoming").orderBy("StartTime").get();
      return snapshot.docs.map((e) => Event.fromSnapshot(e)).toList();
    }
    else{
      var snapshot = await db.collection("Events").where("Admin", isEqualTo: uid).where("Status", isEqualTo: "ended").get();
      return snapshot.docs.map((e) => Event.fromSnapshot(e)).toList();
    }

  }
}
