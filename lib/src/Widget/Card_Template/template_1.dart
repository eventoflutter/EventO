import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

// ignore: camel_case_types
class Template_1 extends StatelessWidget {
  const Template_1({
    super.key,
    required this.height,
    required this.width,
    required this.date,
    required this.invitedBy,
    required this.eventName,
    required this.address,
    required this.isQR,
    required this.scans,
  });

  final double height;
  final double width;
  final DateTime date;
  final String invitedBy;
  final String eventName;
  final String address;
  final bool isQR;
  final int scans;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height*0.8,
      width: width*0.8,
      padding: EdgeInsets.all(height * 0.0256410256410256),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        image:DecorationImage(
          image: const AssetImage("assets/images/card_demo_4.jpg"),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode( Colors.black.withOpacity(0.3), BlendMode.multiply)
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            width: height *0.2,
            padding:  EdgeInsets.symmetric(vertical: height * 0.0256410256410256),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8),
              borderRadius: BorderRadius.all(Radius.circular(height * 0.0128205128205128)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DateFormat('d').format(date),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: height * 0.1025641025641026,
                        height: 1,
                      ),
                    ),
                    RotatedBox(
                      quarterTurns: -1,
                      child: Text(
                        DateFormat('MMM').format(date),
                        textHeightBehavior: const TextHeightBehavior(
                          applyHeightToFirstAscent: false,
                          applyHeightToLastDescent: false,
                        ),
                        style: TextStyle(
                          color: Colors.redAccent,
                          fontSize: height * 0.041025641025641,
                          decoration: TextDecoration.overline,
                          fontWeight: FontWeight.bold,
                          height: 0.8,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      DateFormat('EEEE').format(date),
                      style: Theme.of(context).textTheme.displayMedium?.apply(
                        fontSizeFactor: height * 5.128205128205128e-4,
                        color: Colors.black.withOpacity(0.8),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(height * 0.0256410256410256),
            child: Column(
              children: [
                Text(
                  invitedBy,
                  style: GoogleFonts.greatVibes(
                    color: Colors.white,
                    fontSize: height * 0.0641025641025641,
                    shadows:  [
                      Shadow(
                        color: Colors.redAccent.withOpacity(1),
                        offset: const Offset(0, 0),
                        blurRadius: 20,
                      ),
                      Shadow(
                        color: Colors.redAccent.withOpacity(0.6),
                        offset: const Offset(0, 0),
                        blurRadius: 30,
                      ),
                      Shadow(
                        color: Colors.redAccent.withOpacity(0.4),
                        offset: const Offset(0, 0),
                        blurRadius: 40,
                      ),
                      Shadow(
                        color: Colors.redAccent.withOpacity(0.2),
                        offset: const Offset(0, 0),
                        blurRadius: 50,
                      ),
                    ]
                  )
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: height * 0.0128205128205128),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    "welcomes you to",
                    style: GoogleFonts.greatVibes(
                      color: Colors.white,
                      fontSize: height * 0.0384615384615385,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: height * 0.0128205128205128,vertical: height * 0.0064102564102564),
                  margin: EdgeInsets.only(top: height * 0.0128205128205128),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(height * 0.0064102564102564),
                  ),
                  child: Text(
                    eventName,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.monoton(
                      color: Colors.red,
                      fontSize: height * 0.0384615384615385,
                      wordSpacing: height * 0.0064102564102564,
                      shadows:  [
                        Shadow(
                          color: Colors.redAccent.withOpacity(0.6),
                          offset: const Offset(0, 0),
                          blurRadius: height * 0.0384615384615385,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: height * 0.0128205128205128),
            child: Row(
              mainAxisAlignment: isQR ? MainAxisAlignment.spaceAround  : MainAxisAlignment.center,
              children: [
                isQR 
                ? SizedBox(
                  width: ((width * 0.8)/2) - (height * 0.0282051282051282),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/SampleQR.png',
                        fit: BoxFit.cover,
                        height: height * 0.15,
                        width: height * 0.15,
                      )
                    ],
                  ),
                ) : Container(),
                isQR
                ? Container(
                  width: height * 0.0051282051282051,
                  height: height * 0.15,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(height * 0.0025641025641026)
                  ),
                )
                : Container(),
                Container(
                  width: ((width * 0.8)/2) - (height * 0.0282051282051282),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(height * 0.0064102564102564)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Venue:",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: height * 0.0179487179487179,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        address,
                        textAlign: TextAlign.center,
                        softWrap: true,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: height * 0.0179487179487179,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(
                        height: height * 0.0128205128205128,
                      ),
                      Text(
                        DateFormat('At h:mm a').format(date),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: height * 0.0179487179487179,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: height * 0.0256410256410256 ),
            child: Text(
              "* This pass can be scanned only $scans${(scans > 1) ? " times" : " time"}",
              style: TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.white.withOpacity(0.6),
                fontSize: height * 0.0153846153846154,
              ),
            ),
          )
        ],
      ),
    );
  }
}
