import 'package:final_year_project/firebase_options.dart';
import 'package:final_year_project/src/repos/authrepo.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'src/welcomePage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(authRepository()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return GetMaterialApp(
      title: 'EventO',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        //  textTheme:GoogleFonts.latoTextTheme(textTheme).copyWith(
        //    bodyText1: GoogleFonts.montserrat(textStyle: textTheme.bodyText1),
        //  ),

        textTheme: GoogleFonts.poppinsTextTheme(textTheme),
      ),
      debugShowCheckedModeBanner: false,
      home: const WelcomePage(),
    );
  }
}
