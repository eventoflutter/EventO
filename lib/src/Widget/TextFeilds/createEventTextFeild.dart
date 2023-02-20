// ignore_for_file: camel_case_types, file_names, must_be_immutable

import 'package:flutter/material.dart';

class inputField extends StatelessWidget {
  inputField({
    Key? key,
    required this.label,
    required this.ic,
    required this.controller,
    this.press,
    this.enabled = false,
  }) : super(key: key);

  final String label;
  final IconData ic;
  VoidCallback? press = () {};
  bool enabled;
  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onTap: press,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        prefixIcon: Icon(ic, color: Colors.black, shadows: [
          Shadow(
              color: Colors.black.withOpacity(0.1),
              offset: const Offset(1, 1),
              blurRadius: 10),
        ],
        size: 26,
        ),
        labelText: label,
        labelStyle: const TextStyle(color: Colors.black),
        hintText: label,
        hintStyle: const TextStyle(color: Colors.black),

        // border: OutlineInputBorder(
        //     borderRadius: BorderRadius.all(Radius.circular(50)),
        //     borderSide: BorderSide(color: Colors.white)
        // ),
        enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            borderSide: BorderSide(color: Colors.black)),
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            borderSide: BorderSide(color: Colors.black)),
      ),
      style: const TextStyle(color: Colors.black),
      cursorColor: const Color.fromARGB(255, 38, 38, 38),
      readOnly: enabled,
      textInputAction: TextInputAction.next,
    );
  }
}
