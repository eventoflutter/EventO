// ignore_for_file: camel_case_types, must_be_immutable, file_names


// Page Navigation Button (Back & Next)

import 'package:final_year_project/src/Widget/Controller/createEventController.dart';
import 'package:flutter/material.dart';

class pageNavBtn extends StatelessWidget {
  pageNavBtn({
    super.key,
    required this.controller,
    required this.btnicon,
    required this.press,
    this.left,
    this.right,
    this.text = '',
  });

  final create_Event_Controller controller;
  final IconData btnicon;
  final VoidCallback press;
  double? left;
  double? right;
  String text;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 60,
      left: left,
      right: right,
      child: FloatingActionButton(
        onPressed: press,
        heroTag: text,
        backgroundColor: Colors.white,
        child: Icon(
          btnicon,
          color: Colors.black,
          size: 40,
        ),
      ),
    );
  }
}
