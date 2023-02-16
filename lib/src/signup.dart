import 'package:final_year_project/src/Widget/Buttons/backbutton.dart';
import 'package:final_year_project/src/Widget/Buttons/googlebutton.dart';
import 'package:final_year_project/src/Widget/divider/divider.dart';
import 'package:flutter/material.dart';
import 'package:final_year_project/src/Widget/bezierContainer.dart';
import 'package:final_year_project/src/loginPage.dart';

import 'Widget/Titles/bluetitle.dart';
import 'Widget/forms/signupform.dart';
// import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key ?key, this.title}) : super(key: key);

  final String? title;

  @override
  // ignore: library_private_types_in_public_api
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  Widget _loginAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const LoginPage()));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'Already have an account ?',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Login',
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
                      SizedBox(height: height * .22),
                      bluetitle(context: context),
                      const SizedBox(height: 20),
                      const signupform(),
                      // const SizedBox(
                      //   height: 20,
                      // ),
                      const divider(),
                      const googlebutton(),
                      // SizedBox(height: height * .14),
                      _loginAccountLabel(),
                    ],
                  ),
                ),
                Positioned(top: 20, left: 0, child: backbutton(context: context)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

