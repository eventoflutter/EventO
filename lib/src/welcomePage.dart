// ignore_for_file: file_names

import 'package:final_year_project/src/constants/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:final_year_project/src/loginPage.dart';
import 'package:final_year_project/src/signup.dart';
// import 'package:google_fonts/google_fonts.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  // ignore: library_private_types_in_public_api
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  Widget _submitButton() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const LoginPage()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Color.fromARGB(255, 84, 149, 247),
                  offset: Offset(2, 4),
                  blurRadius: 8,
                  spreadRadius: 2)
            ],
            color: Colors.white),
        child: const Text(
          'Login',
          style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 43, 125, 247)),
        ),
      ),
    );
  }

  Widget _signUpButton() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const SignUpPage()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(50)),
          border: Border.all(color: Colors.white, width: 2),
        ),
        child: const Text(
          'Register now',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  Widget _label() {
    return Container(
        margin: const EdgeInsets.only(top: 40, bottom: 20),
        child: Column(
          children: const <Widget>[
            Text(
              'Quick login with Touch ID',
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
            SizedBox(
              height: 20,
            ),
            Icon(Icons.fingerprint, size: 90, color: Colors.white),
            SizedBox(
              height: 20,
            ),
            Text(
              'Touch ID',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        ));
  }

  Widget _title() {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: 100,
      width: size.width * 0.8,
      child: const Image(image: AssetImage(logoWhite), fit: BoxFit.cover,),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:SingleChildScrollView(
          child:Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.grey.shade200,
                        offset: const Offset(2, 4),
                        blurRadius: 5,
                        spreadRadius: 2)
                  ],
                  gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color.fromARGB(255, 72, 185, 251), Color.fromARGB(255, 43, 125, 247)])),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _title(),
                  const SizedBox(
                    height: 80,
                  ),
                  _submitButton(),
                   Container(
                    height: 70,
                    padding: const EdgeInsets.symmetric(vertical: 22),
                    child: const Text(
                      'OR',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20, 
                      ),
                    ),
                  ),
                  _signUpButton(),
                  const SizedBox(
                    height: 20,
                  ),
                  _label()
                ],
              ),
            ),
        ),
      ),
    );
  }
}
