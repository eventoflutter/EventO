// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class verifyoption extends StatelessWidget {
  const verifyoption({
    Key? key,
    required this.btnIcon,
    required this.title,
    required this.subtitle,
    required this.tap,
  }) : super(key: key);

  final IconData btnIcon;
  final String title, subtitle;
  final VoidCallback tap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade200,
          boxShadow: const [BoxShadow(color: Color.fromARGB(66, 109, 109, 109), blurRadius: 5, spreadRadius: 0, offset: Offset(0, 4))],
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Icon(
            btnIcon,
            color: Colors.black54,
            size: 60,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.bodyMedium,
              )
            ],
          )
        ]),
      ),
    );
  }
}
