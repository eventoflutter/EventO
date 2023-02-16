// ignore_for_file: file_names

import 'package:final_year_project/src/Widget/forgotpassword/forgotpassword.dart';
import 'package:flutter/material.dart';
import 'package:final_year_project/src/signup.dart';
// import 'package:google_fonts/google_fonts.dart';

import 'Widget/Buttons/backbutton.dart';
import 'Widget/Buttons/googlebutton.dart';
import 'Widget/Titles/bluetitle.dart';
import 'Widget/bezierContainer.dart';
import 'Widget/divider/divider.dart';
import 'Widget/forms/loginform.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  Widget _createAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const SignUpPage()));
      },
      child: Container(
        // margin: const EdgeInsets.symmetric(vertical: 20),
        padding: const EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'Don\'t have an account ?',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Register',
              style: TextStyle(
                  color: Color.fromARGB(255, 43, 125, 247),
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
 
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
          body: SizedBox(
        height: height,
        child: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Positioned(
                top: -MediaQuery.of(context).size.height * .15,
                right: -MediaQuery.of(context).size.width * .4,
                child: const BezierContainer(),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: height * 0.22),
                    bluetitle(context: context),
                    const SizedBox(height: 20),
                    const loginform(),
                    const forgotpassword(),
                    const divider(),
                    const googlebutton(),
                    SizedBox(height: height * .022),
                    _createAccountLabel(),
                  ],
                ),
              ),
              Positioned(top: 20, left: 0, child: backbutton(context: context)),
            ],
          ),
        ),
      )
      ),
    );
  }
}



