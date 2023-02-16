// ignore_for_file: file_names, must_be_immutable, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class GradientButton extends StatefulWidget {
  GradientButton({
    Key? key,
    required this.context,
    required this.textto,
    required this.radius,
    required this.press,
  }) : super(key: key);

  final BuildContext context;
  final String textto;
  final double radius;
  final VoidCallback press;

  @override
  State<GradientButton> createState() => _GradientButtonState();
}

class _GradientButtonState extends State<GradientButton> {
  bool isLoading = false;

  void func(){
    setState(() {
      isLoading = true;
    });
    widget.press();
    Future.delayed(const Duration(seconds: 10), () {
      setState(() {
        isLoading = false;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 60,
        padding: const EdgeInsets.symmetric(vertical: 0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(widget.radius)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: const Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2)
            ],
            gradient: const LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color.fromARGB(255, 72, 185, 251),
                  Color.fromARGB(255, 43, 125, 247)
                ])),
        child:  !isLoading ? Text(
          widget.textto,
          style: const TextStyle(fontSize: 20, color: Colors.white),
        ) : const CircularProgressIndicator(color: Colors.white,),
      ),
    );
  }
}
