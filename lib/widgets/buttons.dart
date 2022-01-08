// ignore_for_file: avoid_unnecessary_containers, must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SpecialButtons extends StatelessWidget {
  String text;
  double textSize;
  Color textColor;
  Color fillColor;
  Function buttonFunction;
  

   SpecialButtons({
    Key? key,
    required this.text,
    required this.textSize,
    required this.textColor,
    required this.fillColor,
    required this.buttonFunction,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: fillColor, 
          borderRadius: BorderRadius.circular(70)),
      child: SizedBox(
          height: 50,
          width: 50,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: TextButton(
              onPressed: (){
                buttonFunction(text);
              },
              child: Text(
                text,
                  style: GoogleFonts.ubuntu(
                      fontStyle: FontStyle.normal,
                      color: textColor,
                      fontSize: textSize)),
            ),
          )),
    );
  }
}
