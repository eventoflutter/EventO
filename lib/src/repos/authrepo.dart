// ignore_for_file: camel_case_types, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_year_project/src/Widget/otpwidgets/otpscreen.dart';
import 'package:final_year_project/src/dashboard.dart';
import 'package:final_year_project/src/models/usermodel.dart';
// import 'package:final_year_project/src/repos/signupexception.dart';
import 'package:final_year_project/src/welcomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class authRepository extends GetxController{

  static authRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  final _auth = FirebaseAuth.instance;
  late Rx<User?> firebaseUser;
  var verId = ''.obs;
  var logId = ''.obs;
 

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, (User? user) {
      user != null ? Get.offAll(() => const Dashboard()) : Get.offAll(() => const WelcomePage());
    });
  }

  Future<void> phoneAuth(controller) async {

     int? resendToken;

    String username = controller.username.text.trim();
    String email = controller.email.text.trim();
    String number = "+91${controller.phoneno.text.trim()}";
    String password = controller.password.text.trim();

    UserModel usermodel = UserModel(username: username, email: email, name: "", phonenumber: number, password: password);

    //print("number: $number");
    await _auth.verifyPhoneNumber(
      phoneNumber: number,
      timeout: const Duration(seconds : 20),
      verificationCompleted: (credentials) async {
        var creds = await _auth.signInWithCredential(credentials);

        if(creds.user != null){
          usermodel.id = creds.user?.uid;
          registerUser(usermodel);
        }
        else{
          Get.back();
        }
        
      }, 
      verificationFailed: (e) {
        if(e.code == 'invalid-phone-number'){
          Get.snackbar('Error', 'Invalid number provided.');
        }else{
          Get.snackbar('Error', e.code);
        }
      }, 
      codeSent: (verificationId, resendToken) {
        verId.value = verificationId;
        Get.to(() => Otpscreen(usermodel: usermodel),arguments: [{'data' : number, 'type': 'signup'}]);
        resendToken = resendToken;
      }, 
      codeAutoRetrievalTimeout: (verificationId) {
        verId.value = verificationId;
      },
      forceResendingToken: resendToken,
    );
  }

  Future<void> verifyOTP(String otp, UserModel usermodel) async {
    var credentials = await _auth.signInWithCredential(PhoneAuthProvider.credential(verificationId: verId.value, smsCode: otp));

    // return credentials.user != null ? true : false;

    if(credentials.user != null){
      usermodel.id = credentials.user?.uid;

      registerUser(usermodel);
    }else{
      Get.back();
    }
    
  }

  Future<void> verifyLogin(String otp, UserModel usermodel) async {
    var credentials = await _auth.signInWithCredential(PhoneAuthProvider.credential(verificationId: logId.value, smsCode: otp));

    // return credentials.user != null ? true : false;

    if(credentials.user != null){
      usermodel.id = credentials.user?.uid;

      registerUser(usermodel);
    }else{
      Get.back();
    }
    
  }

  Future<void> logout() async => await _auth.signOut();

  void registerUser(UserModel usermodel) async {

      await _db.collection("Users").add(usermodel.toJson()).whenComplete(() {
        Get.offAll(const Dashboard());
        Get.snackbar("Success", "Account has been created", 
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.green,
          backgroundColor: Colors.green.withOpacity(0.1),
        );
      });

  }

  Future<void> login(controller) async {

     int? resendToken;

    String email = controller.email.text.trim();
    String password = controller.password.text.trim();

    final snapshot = await _db.collection("Users").where("Email", isEqualTo: email).get();

    if(snapshot.docs.isEmpty){
      Get.snackbar("Error", "No such account exists!!",
        colorText: Colors.redAccent,
        backgroundColor: Colors.redAccent.withOpacity(0.1),
        snackPosition: SnackPosition.TOP,
      );
    }else{

      final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;

      if(password == userData.password){
        await _auth.verifyPhoneNumber(
          phoneNumber: userData.phonenumber,
          timeout: const Duration(seconds : 20),
          verificationCompleted: (credentials) async {
            var creds = await _auth.signInWithCredential(credentials);

            if(creds.user != null){
              Get.snackbar("Success", "${userData.username} LoggedIn!!!", 
                snackPosition: SnackPosition.BOTTOM,
                colorText: Colors.green,
                backgroundColor: Colors.green.withOpacity(0.1),
              );
            }
            else{
              Get.back();
            }            
          }, 
          verificationFailed: (e) {
            if(e.code == 'invalid-phone-number'){
              Get.snackbar('Error', 'Invalid number provided.');
            }else{
              Get.snackbar('Error', e.code);
            }
          },  
          codeSent: (verificationId, resendToken) {
            logId.value = verificationId;
            Get.to(() => Otpscreen(usermodel: userData),arguments: [{'data' : userData.phonenumber, 'type' : "login"}]);
            resendToken = resendToken;
          }, 
          codeAutoRetrievalTimeout: (verificationId) {
            logId.value = verificationId;
          },
          forceResendingToken: resendToken,
        );
      }
    }
  }




}