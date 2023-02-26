// ignore_for_file: camel_case_types, must_be_immutable, file_names


// Page Navigation Button (Back & Next)

import 'package:flutter/material.dart';

class carouselbtn extends StatelessWidget {
  carouselbtn({
    super.key,
    required this.btnicon,
    required this.press,
    this.text = '',
  });

  final IconData btnicon;
  final VoidCallback press;
  String text;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: press,
      heroTag: text,
      backgroundColor: Colors.white.withOpacity(0.4),
      elevation: 3,
      child: Icon(
        btnicon,
        color: Colors.black,
        size: 40,
      ),
    );
  }
}
