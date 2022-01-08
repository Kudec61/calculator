// ignore_for_file: avoid_print, avoid_unnecessary_containers, prefer_adjacent_string_concatenation, unused_local_variable, unrelated_type_equality_checks, non_constant_identifier_names

// import 'dart:ffi';

import 'dart:developer';

import 'package:calculator_project/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyCalculator());
}

class MyCalculator extends StatefulWidget {
  const MyCalculator({Key? key}) : super(key: key);

  @override
  _MyCalculatorState createState() => _MyCalculatorState();
}

class _MyCalculatorState extends State<MyCalculator> {
  /// HOLDERS
  String initialValue = "0";
  String historyNumber = "";
  String funcOperator = "";
  int counter = 0;
  Color backColor = Colors.black;
  Color textColor = Colors.white;
  bool changeColor = false;
  String themeText = "Light Theme";
  

void themeColorFunc(){
  
  if(changeColor == false){
    setState(() {
    backColor = Colors.white;
    textColor = Colors.black;
    themeText = "Dark Theme";
    changeColor =! changeColor;
    
    });
  } else{
    setState(() {
    backColor = Colors.black;
    textColor = Colors.white;
    themeText = "Light Theme";
     changeColor =! changeColor;
    
    });
  }
}
 
  /// BUTTON CLICK EVENTS

  void enterClicked() {
    if (historyNumber != "") {
      if (funcOperator == "+") {
        setState(() {
          if (initialValue.contains(",") == false &&
              historyNumber.contains(",") == false) {
            initialValue =
                (int.parse(historyNumber) + int.parse(initialValue)).toString();
          } else {
            initialValue = initialValue.replaceAll(",", ".");
            historyNumber = historyNumber.replaceAll(",", ".");
            initialValue =
                (double.parse(historyNumber) + double.parse(initialValue))
                    .toString();
            initialValue = initialValue.replaceAll(".", ",");
          }

          historyNumber = "";
          funcOperator = "";
        });
      } else if (funcOperator == "x") {
        setState(() {
          if (initialValue.contains(",") == false &&
              historyNumber.contains(",") == false) {
            initialValue =
                (int.parse(historyNumber) * int.parse(initialValue)).toString();
          } else {
            initialValue = initialValue.replaceAll(",", ".");
            historyNumber = historyNumber.replaceAll(",", ".");
            initialValue =
                (double.parse(historyNumber) * double.parse(initialValue))
                    .toString();
            initialValue = initialValue.replaceAll(".", ",");
          }

          historyNumber = "";
          funcOperator = "";
        });
      } else if (funcOperator == "÷") {
        setState(() {
          if (initialValue.contains(",") == false &&
              historyNumber.contains(",") == false) {
            initialValue =
                (int.parse(historyNumber) / int.parse(initialValue)).toString();
          } else {
            initialValue = initialValue.replaceAll(",", ".");
            historyNumber = historyNumber.replaceAll(",", ".");
            initialValue =
                (double.parse(historyNumber) / double.parse(initialValue))
                    .toString();
            initialValue = initialValue.replaceAll(".", ",");
          }

          historyNumber = "";
          funcOperator = "";
        });
      } else {
        setState(() {
          if (initialValue.contains(",") == false &&
              historyNumber.contains(",") == false) {
            initialValue =
                (int.parse(historyNumber) - int.parse(initialValue)).toString();
          } else {
            initialValue = initialValue.replaceAll(",", ".");
            historyNumber = historyNumber.replaceAll(",", ".");
            initialValue =
                (double.parse(historyNumber) - double.parse(initialValue))
                    .toString();
            initialValue = initialValue.replaceAll(".", ",");
          }

          historyNumber = "";
          funcOperator = "";
        });
      }
    }
  }

// HOLDER BUTTON VALUE
  void holderButtonValue(String buttonValue) {
    if (buttonValue == "AC") {
      setState(() {
        funcOperator = "";
        initialValue = "0";
        historyNumber = "";
      });
    } else if (buttonValue == "+/-") {
      if (initialValue != "0") {
        setState(() {
          if (initialValue.contains(",") == false) {
            initialValue = (double.parse(initialValue) * -1).toString();
          } else {
            initialValue = initialValue.replaceAll(",", ".");
            initialValue = (double.parse(initialValue) * -1).toString();
            initialValue = initialValue.replaceAll(".", ",");
          }
        });
      }
    } else if (buttonValue == "%") {
      if (double.parse(initialValue) != 0) {
        setState(() {
          initialValue = (double.parse(initialValue) / 100).toString();
          initialValue = initialValue.replaceAll(".", ",");
          if (buttonValue != "%") {
            initialValue = double.parse(initialValue + buttonValue).toString();
          }
        });
      }
    } else if (buttonValue == "<") {
      if (initialValue != "0" || initialValue.length > 1) {
        setState(() {
          initialValue = initialValue.substring(0, initialValue.length - 1);
          if (initialValue == "") {
            initialValue = "0";
          }
        });
      }
    } else if (buttonValue == "x") {
      setState(() {
        if (funcOperator == "") {
          funcOperator = "x";
        } else {
          funcOperator = "";
        }
        if (historyNumber == "") {
          historyNumber = initialValue;
          initialValue = "0";
        } else {
          if (initialValue.contains(",") == false &&
              historyNumber.contains(",") == false) {
            initialValue =
                (int.parse(historyNumber) / int.parse(initialValue)).toString();
          } else {
            initialValue = initialValue.replaceAll(",", ".");
            historyNumber = historyNumber.replaceAll(",", ".");
            initialValue =
                (double.parse(historyNumber) * double.parse(initialValue))
                    .toString();
            initialValue = initialValue.replaceAll(".", ",");
          }

          historyNumber = "";
        }
      });
    } else if (buttonValue == "-") {
      if (funcOperator == "") {
        funcOperator = "-";
      } else {
        funcOperator = "";
      }
      setState(() {
        if (historyNumber == "") {
          historyNumber = initialValue;
          initialValue = "0";
        } else {
          if (initialValue.contains(",") == false &&
              historyNumber.contains(",") == false) {
            initialValue =
                (int.parse(historyNumber) - int.parse(initialValue)).toString();
          } else {
            initialValue = initialValue.replaceAll(",", ".");
            historyNumber = historyNumber.replaceAll(",", ".");
            initialValue =
                (double.parse(historyNumber) * double.parse(initialValue))
                    .toString();
            initialValue = initialValue.replaceAll(".", ",");
          }

          historyNumber = "";
        }
      });
    } else if (buttonValue == "+") {
      setState(() {
        if (funcOperator == "") {
          funcOperator = "+";
        } else {
          funcOperator = "";
        }
        if (historyNumber == "") {
          historyNumber = initialValue;
          initialValue = "0";
        } else {
          if (initialValue.contains(",") == false &&
              historyNumber.contains(",") == false) {
            initialValue =
                (int.parse(historyNumber) + int.parse(initialValue)).toString();
          } else {
            initialValue = initialValue.replaceAll(",", ".");
            historyNumber = historyNumber.replaceAll(",", ".");
            initialValue =
                (double.parse(historyNumber) * double.parse(initialValue))
                    .toString();
            initialValue = initialValue.replaceAll(".", ",");
          }

          historyNumber = "";
        }
      });
    } else if (buttonValue == "÷") {
      if (funcOperator == "") {
        funcOperator = "÷";
      } else {
        funcOperator = "";
      }
      setState(() {
        if (historyNumber == "") {
          historyNumber = initialValue;
          initialValue = "0";
        } else {
          if (initialValue.contains(",") == false &&
              historyNumber.contains(",") == false) {
            initialValue =
                (int.parse(historyNumber) / int.parse(initialValue)).toString();
          } else {
            initialValue = initialValue.replaceAll(",", ".");
            historyNumber = historyNumber.replaceAll(",", ".");
            initialValue =
                (double.parse(historyNumber) * double.parse(initialValue))
                    .toString();
            initialValue = initialValue.replaceAll(".", ",");
          }

          historyNumber = "";
        }
      });
    } else if (buttonValue == ",") {
      setState(() {
        if (initialValue.contains(",") == false) {
          initialValue = initialValue + buttonValue;
        }
      });
    } else if (buttonValue == "00") {
      if (initialValue != "0") {
        setState(() {
          initialValue = initialValue + buttonValue;
        });
      }
    } else {
      setState(() {
        initialValue == "0"
            ? initialValue = buttonValue
            : initialValue = initialValue + buttonValue;

        // double firstInit = double.parse(initialValue + buttonValue);
        // int convertInit = firstInit.toInt();
        // initialValue = convertInit.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: backColor),
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton.icon(
                    onPressed: themeColorFunc,
                    icon: const Icon(
                      Icons.color_lens,
                      color: Colors.white,
                    ),
                    label:  Text(themeText,
                        style: const TextStyle(color: Colors.white, fontSize: 18)))
              ],
            ),
            elevation: 10,
            shadowColor: Colors.white,
            backgroundColor: Colors.black87,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(height: 15),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, right: 20),
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Text(historyNumber,
                        style: GoogleFonts.ubuntu(
                            fontStyle: FontStyle.normal,
                            color: textColor,
                            fontSize: 20)),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, right: 20),
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Text(funcOperator,
                        style: GoogleFonts.ubuntu(
                            fontStyle: FontStyle.normal,
                            color: textColor,
                            fontSize: 20)),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, right: 20),
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Text(initialValue,
                        style: GoogleFonts.ubuntu(
                            fontStyle: FontStyle.normal,
                            color: textColor,
                            fontSize: 20)),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Expanded(
                child: Row(
                  // SATIRDA BUTONLARIN EŞİT ARALIKLARLA YERLEŞMESİNİ SAĞLIYORUZ.
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SpecialButtons(
                      fillColor: Colors.grey.shade400,
                      buttonFunction: holderButtonValue,
                      text: 'AC',
                      textSize: 20,
                      textColor: Colors.black,
                    ),
                    SpecialButtons(
                      fillColor: Colors.grey.shade400,
                      buttonFunction: holderButtonValue,
                      text: '+/-',
                      textSize: 20,
                      textColor: Colors.black,
                    ),
                    SpecialButtons(
                      fillColor: Colors.grey.shade400,
                      buttonFunction: holderButtonValue,
                      text: '%',
                      textSize: 20,
                      textColor: Colors.black,
                    ),
                    SpecialButtons(
                      fillColor: Colors.orange.shade400,
                      buttonFunction: holderButtonValue,
                      text: '<',
                      textSize: 20,
                      textColor: Colors.white,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  // SATIRDA BUTONLARIN EŞİT ARALIKLARLA YERLEŞMESİNİ SAĞLIYORUZ.
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SpecialButtons(
                      fillColor: Colors.grey.shade400,
                      buttonFunction: holderButtonValue,
                      text: '7',
                      textSize: 20,
                      textColor: Colors.black,
                    ),
                    SpecialButtons(
                      fillColor: Colors.grey.shade400,
                      buttonFunction: holderButtonValue,
                      text: '8',
                      textSize: 20,
                      textColor: Colors.black,
                    ),
                    SpecialButtons(
                      fillColor: Colors.grey.shade400,
                      buttonFunction: holderButtonValue,
                      text: '9',
                      textSize: 20,
                      textColor: Colors.black,
                    ),
                    SpecialButtons(
                      fillColor: Colors.orange.shade400,
                      buttonFunction: holderButtonValue,
                      text: 'x',
                      textSize: 20,
                      textColor: Colors.white,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  // SATIRDA BUTONLARIN EŞİT ARALIKLARLA YERLEŞMESİNİ SAĞLIYORUZ.
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SpecialButtons(
                      fillColor: Colors.grey.shade400,
                      buttonFunction: holderButtonValue,
                      text: '4',
                      textSize: 20,
                      textColor: Colors.black,
                    ),
                    SpecialButtons(
                      fillColor: Colors.grey.shade400,
                      buttonFunction: holderButtonValue,
                      text: '5',
                      textSize: 20,
                      textColor: Colors.black,
                    ),
                    SpecialButtons(
                      fillColor: Colors.grey.shade400,
                      buttonFunction: holderButtonValue,
                      text: '6',
                      textSize: 20,
                      textColor: Colors.black,
                    ),
                    SpecialButtons(
                      fillColor: Colors.orange.shade400,
                      buttonFunction: holderButtonValue,
                      text: '-',
                      textSize: 20,
                      textColor: Colors.white,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  // SATIRDA BUTONLARIN EŞİT ARALIKLARLA YERLEŞMESİNİ SAĞLIYORUZ.
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SpecialButtons(
                      fillColor: Colors.grey.shade400,
                      buttonFunction: holderButtonValue,
                      text: '1',
                      textSize: 20,
                      textColor: Colors.black,
                    ),
                    SpecialButtons(
                      fillColor: Colors.grey.shade400,
                      buttonFunction: holderButtonValue,
                      text: '2',
                      textSize: 20,
                      textColor: Colors.black,
                    ),
                    SpecialButtons(
                      fillColor: Colors.grey.shade400,
                      buttonFunction: holderButtonValue,
                      text: '3',
                      textSize: 20,
                      textColor: Colors.black,
                    ),
                    SpecialButtons(
                      fillColor: Colors.orange.shade400,
                      buttonFunction: holderButtonValue,
                      text: '+',
                      textSize: 20,
                      textColor: Colors.white,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  // SATIRDA BUTONLARIN EŞİT ARALIKLARLA YERLEŞMESİNİ SAĞLIYORUZ.
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SpecialButtons(
                      fillColor: Colors.grey.shade400,
                      buttonFunction: holderButtonValue,
                      text: '0',
                      textSize: 20,
                      textColor: Colors.black,
                    ),
                    SpecialButtons(
                      fillColor: Colors.grey.shade400,
                      buttonFunction: holderButtonValue,
                      text: '00',
                      textSize: 20,
                      textColor: Colors.black,
                    ),
                    SpecialButtons(
                      fillColor: Colors.grey.shade400,
                      buttonFunction: holderButtonValue,
                      text: ',',
                      textSize: 20,
                      textColor: Colors.black,
                    ),
                    SpecialButtons(
                      fillColor: Colors.orange.shade400,
                      buttonFunction: holderButtonValue,
                      text: '÷',
                      textSize: 20,
                      textColor: Colors.white,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  // SATIRDA BUTONLARIN EŞİT ARALIKLARLA YERLEŞMESİNİ SAĞLIYORUZ.
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.orange.shade400,
                              borderRadius: BorderRadius.circular(10)),
                          child: TextButton(
                              onPressed: () {
                                enterClicked();
                              },
                              child: const Text(
                                "ENTER",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
