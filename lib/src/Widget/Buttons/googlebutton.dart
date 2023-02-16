// ignore_for_file: camel_case_types

import 'package:final_year_project/src/constants/image_constants.dart';
import 'package:flutter/material.dart';

class googlebutton extends StatelessWidget {
  const googlebutton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(vertical: 0),
      alignment: Alignment.center,
      decoration:  BoxDecoration(
        border: Border.all(),
        borderRadius: const BorderRadius.all(Radius.circular(50)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Image(image: AssetImage(googlelogo), width: 50,),
          Text('Sign-in with Google', style: TextStyle(fontSize: 15),),
        ],
      ),
      // child: OutlinedButton.icon(
      //   onPressed: () {}, 
      //   label: const Text('Sign-in with Google', style: TextStyle(fontSize: 18, color: Colors.black54),),
      //   icon : const Image(image: AssetImage(googlelogo), width: 40,), 
      //   ),
    ); 
  }
}

