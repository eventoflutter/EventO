import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel{
  String id = "";
  final String username;
  final String name;
  final String email;
  final String phonenumber;
  final String password;

  UserModel({
    required this.username,
    required this.email,
    required this.name,
    required this.phonenumber,
    required this.password
  });

  toJson(){
    return {
      "Uid" : id,
      "Username" : username,
      "Name" : name,
      "Email" : email,
      "Phone" : phonenumber,
      "Password" : password,
      "EventsCreated" : []
    };
  }

  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){

    final data = document.data()!;

    UserModel usermodel = UserModel(
      username: data['Username'], 
      email: data['Email'], 
      name: data['Name'], 
      phonenumber: data['Phone'], 
      password: data['Password']
    );

    usermodel.id = data['Uid'];

    return usermodel;
  }


}