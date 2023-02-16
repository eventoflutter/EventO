// ignore_for_file: file_names

import 'dart:math';

import 'package:flutter/material.dart';

import 'customClipper.dart';

class BezierContainer extends StatelessWidget {
  const BezierContainer({Key ?key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -pi / 3.5, 
      child: ClipPath(
      clipper: ClipPainter(),
      child: Container(
        height: MediaQuery.of(context).size.height *.5,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color.fromARGB(255, 72, 185, 251), Color.fromARGB(255, 43, 125, 247)]
            )
          ),
      ),
    ),
    );
  }
}