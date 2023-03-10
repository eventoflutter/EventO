// ignore_for_file: camel_case_types, file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_year_project/src/models/usermodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class currentUser extends GetxController {
  // currentUser() {
  //   create();
  // }
  Future<UserModel> create() async {
    final db = FirebaseFirestore.instance;

    final auth = FirebaseAuth.instance;
    final Rx<User?> firebaseUser = Rx<User?>(auth.currentUser);

    if (firebaseUser.value != null) {
      final snapshot = await db
          .collection("Users")
          .where("Uid", isEqualTo: firebaseUser.value?.uid)
          .get();

      return snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
    } else {
      return UserModel(
          username: "username",
          email: "email",
          name: "name",
          phonenumber: "phonenumber",
          password: "password"
          );
    }
  }
}
