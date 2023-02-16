// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class Profilesetting extends StatelessWidget {
  const Profilesetting({
    Key? key,
    required this.title,
    required this.icon,
    this.endIcon = true,
    required this.press,
    // ignore: non_constant_identifier_names
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback press;
  final bool endIcon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: const Color.fromARGB(255, 235, 238, 241),
        ),
        child: Icon(
          icon,
          color: const Color.fromARGB(255, 78, 116, 243),
        ),
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      trailing: endIcon
          ? Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: const Color.fromARGB(255, 195, 200, 205),
              ),
              child: const Icon(
                LineAwesomeIcons.angle_right,
                size: 18,
                color: Color.fromARGB(255, 15, 14, 14),
              ))
          : null,
    );
  }
}
