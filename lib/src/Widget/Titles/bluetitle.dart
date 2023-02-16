// ignore_for_file: camel_case_types

import 'package:final_year_project/src/constants/image_constants.dart';
import 'package:flutter/material.dart';

class bluetitle extends StatelessWidget {
  const bluetitle({
    Key? key,
    required this.context,
  }) : super(key: key);

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: 100,
      width: size.width * 0.8,
      child: const Image(
        image: AssetImage(logoBlue),
        fit: BoxFit.cover,
      ),
    );
  }
}
