import 'package:flutter/material.dart';

class Widgets extends StatefulWidget {
  const Widgets({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _WidgetsState createState() => _WidgetsState();
}

class _WidgetsState extends State<Widgets> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = (9 / 16) * height;

    debugPrint("$height");
    return Scaffold(
      body: SizedBox(
        height: height,
        width: width,
        // child: Center(
        //   child: Column(
        //                                   children: [
        //                                     Container(
        //                                       height: 320,
        //                                       width: double.maxFinite,
        //                                       margin: const EdgeInsets.only(
        //                                           top: 6, left: 6, right: 6),
        //                                       clipBehavior: Clip.hardEdge,
        //                                       decoration: BoxDecoration(
        //                                         borderRadius:
        //                                             BorderRadius.circular(20),
        //                                       ),
        //                                       child: Stack(
        //                                         alignment: Alignment.center,
        //                                         children: [
        //                                           Image.asset(
        //                                             element['image'],
        //                                             fit: BoxFit.cover,
        //                                             height: 320,
        //                                             width: double.maxFinite,
        //                                           ),
        //                                           controller.selectedIndex ==
        //                                                   element
        //                                               ? const Positioned(
        //                                                   top: 20,
        //                                                   right: 20,
        //                                                   child: Icon(
        //                                                     Icons.check_circle,
        //                                                     color:
        //                                                         Color.fromARGB(
        //                                                             255,
        //                                                             101,
        //                                                             255,
        //                                                             107),
        //                                                     size: 40,
        //                                                     shadows: [
        //                                                       Shadow(
        //                                                           color: Colors
        //                                                               .black,
        //                                                           offset:
        //                                                               Offset(
        //                                                                   1, 2),
        //                                                           blurRadius:
        //                                                               15)
        //                                                     ],
        //                                                   ))
        //                                               : Container(),
        //                                         ],
        //                                       ),
        //                                     ),
        //                                     const SizedBox(
        //                                       height: 20,
        //                                     ),
        //                                     Text(
        //                                       controller.startTime.value.text,
        //                                       style: const TextStyle(
        //                                           fontSize: 16,
        //                                           fontWeight: FontWeight.bold),
        //                                     ),
        //                                     const SizedBox(
        //                                       height: 20,
        //                                     ),
        //                                     Text(
        //                                       element['description'],
        //                                       style: TextStyle(
        //                                           fontSize: 14,
        //                                           color: Colors.grey.shade600),
        //                                     ),
        //                                   ],
        //                                 ),,
        // ),
        child: const Center(
          // child: Template_1(height: height, width: width),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
