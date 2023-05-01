import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math';

import 'package:health_app/screens/comparePage.dart';
import 'package:health_app/screens/home_screen.dart';

class BMI1 extends StatefulWidget {
  @override
  State<BMI1> createState() => _BMI1State();
}

class _BMI1State extends State<BMI1> {
  TextEditingController _controllerHeight = TextEditingController();
  TextEditingController _controllerWeight = TextEditingController();
  final double _ph = 890.2857142857143, _pw = 411.42857142857144;
  num? height, weight;
  double bmi = 0.0;
  bool showOthers = false;
  BuildContext? _currContext;
  void CalculateButton() async {
    this.showOthers = false;
    this.bmi = 0;
    if (height == null) {
      await showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error!'),
            content: Text('Invalid Height!'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } else if (weight == null) {
      await showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error!'),
            content: Text('Invalid Weight!'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      print("heree");
      setState(() {
        this.bmi =
            (this.weight! / ((this.height! / 100) * (this.height! / 100)));
        this.bmi = double.parse(this.bmi.toStringAsFixed(2));
        this.showOthers = true;
      });
    }
  }

  void NextButton() {}
  void CompareButton() { 
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (context) => comparePage(bmi: this.bmi,)),
      );
  }
  @override
  Widget build(BuildContext context) {
    double lh = MediaQuery.of(context).size.height;
    double lw = MediaQuery.of(context).size.width;

    this._currContext = context;
    return Scaffold(
        // appBar: AppBar(
        //     title: Text(
        //   'Know your BMI',
        //   textAlign: TextAlign.center,
        //   style: TextStyle(
        //       color: Color.fromRGBO(154, 94, 162, 1),
        //       fontFamily: 'CabinCondensed',
        //       fontSize: 20,
        //       fontWeight: FontWeight.normal),
        // )),

        appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomeScreen()));
          },
        ),
        title: Text(
          'BMI',
          style: TextStyle(
              color: const Color(0xFF9A5EA2),
              fontSize: 30 * MediaQuery.of(context).size.width / 411),
        ),
      ),
        body: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(225, 214, 234, 1),
          ),
        ),
        Positioned(
          top: 36.5 * lh / _ph,
          left: 226 * lw / _pw,
          child: SvgPicture.asset("assets/images/rectangle4.svg"),
        ),
        Positioned(
            top: 171.5 * lh / _ph,
            left: 40 * lw / _pw,
            child: Container(
                width: 327 * lw / _pw,
                height: 391 * lh / _ph,
                child: Stack(children: <Widget>[
                  Positioned(
                      top: 0 * lh / _ph,
                      left: 64 * lw / _pw,
                      child: Container(
                          width: 205 * lw / _pw,
                          height: 65 * lh / _ph,
                          child: Stack(children: <Widget>[
                            Positioned(
                                top: 0 * lh / _ph,
                                left: 0 * lw / _pw,
                                child: Container(
                                    width: 205 * lw / _pw,
                                    height: 65 * lh / _ph,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(45),
                                        topRight: Radius.circular(45),
                                        bottomLeft: Radius.circular(45),
                                        bottomRight: Radius.circular(45),
                                      ),
                                      color: Color.fromRGBO(154, 94, 162, 1),
                                    ))),
                            Positioned(
                                top: 18 * lh / _ph,
                                left: 35 * lw / _pw,
                                child: Text(
                                  'Know your BMI',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                      fontFamily: 'CabinCondensed',
                                      fontSize: 25,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.normal,
                                      height: 1),
                                )),
                          ]))),
                  Positioned(
                      top: 332 * lh / _ph,
                      left: 103 * lw / _pw,
                      child: Container(
                          width: 136 * lw / _pw,
                          height: 59 * lh / _ph,
                          child: Stack(children: <Widget>[
                            Positioned(
                                top: 0 * lh / _ph,
                                left: 0 * lw / _pw,
                                child: Container(
                                    width: 136 * lw / _pw,
                                    height: 60 * lh / _ph,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(45),
                                        topRight: Radius.circular(45),
                                        bottomLeft: Radius.circular(45),
                                        bottomRight: Radius.circular(45),
                                      ),
                                      color: Color.fromRGBO(154, 94, 162, 1),
                                    ))),
                            Positioned(
                              top: 0 * lh / _ph,
                              left: 0 * lw / _pw,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    shadowColor: Colors.transparent,
                                    surfaceTintColor: Colors.transparent,
                                    fixedSize:
                                        Size(136 * lw / _pw, 60 * lh / _ph)),
                                onPressed: CalculateButton,
                                child: Text(
                                  'Calculate',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Color.fromRGBO(255, 255, 255, 1),
                                    fontFamily: 'CabinCondensed',
                                    fontSize: 25,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                    height: 1,
                                  ),
                                ),
                              ),
                            ),
                          ]))),
                  Positioned(
                      top: 109 * lh / _ph,
                      left: 0 * lw / _pw,
                      child: Container(
                          width: 327 * lw / _pw,
                          height: 62 * lh / _ph,
                          child: Stack(children: <Widget>[
                            Positioned(
                                top: 0 * lh / _ph,
                                left: 0 * lw / _pw,
                                child: Container(
                                    width: 327 * lw / _pw,
                                    height: 62 * lh / _ph,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(35),
                                        topRight: Radius.circular(35),
                                        bottomLeft: Radius.circular(35),
                                        bottomRight: Radius.circular(35),
                                      ),
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                    ))),
                            Positioned(
                                top: 0 * lh / _ph,
                                left: 10 * lw / _pw,
                                child: SizedBox(
                                  width: 250.0 * lw / _pw,
                                  child: TextField(
                                    obscureText: false,
                                    controller: _controllerHeight,
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      labelText: 'Enter your height',
                                      floatingLabelAlignment:
                                          FloatingLabelAlignment.center,
                                      labelStyle: TextStyle(
                                        color: Color.fromRGBO(154, 94, 162, 1),
                                        fontFamily: 'CabinCondensed',
                                        fontSize: 25,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.normal,
                                        height: 1,
                                      ),
                                    ),
                                    onSubmitted: (String value) async {
                                      this.height = num.tryParse(value);
                                      if (this.height == null) {
                                        await showDialog<void>(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: const Text('Error!'),
                                              content: Text(
                                                  'You typed "$value", which is not a valid number!'),
                                              actions: <Widget>[
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text('OK'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      }
                                    },
                                  ),
                                )),
                            Positioned(
                                top: 9 * lh / _ph,
                                left: 256 * lw / _pw,
                                child: Container(
                                    width: 62 * lw / _pw,
                                    height: 44 * lh / _ph,
                                    child: Stack(children: <Widget>[
                                      Positioned(
                                          top: 0 * lh / _ph,
                                          left: 0 * lw / _pw,
                                          child: Container(
                                              width: 62 * lw / _pw,
                                              height: 44 * lh / _ph,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(45),
                                                  topRight: Radius.circular(45),
                                                  bottomLeft:
                                                      Radius.circular(45),
                                                  bottomRight:
                                                      Radius.circular(45),
                                                ),
                                                color: Color.fromRGBO(
                                                    154, 94, 162, 1),
                                              ))),
                                      Positioned(
                                          top: 7 * lh / _ph,
                                          left: 17 * lw / _pw,
                                          child: Text(
                                            'cm',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    255, 255, 255, 1),
                                                fontFamily: 'CabinCondensed',
                                                fontSize: 25,
                                                letterSpacing: 0,
                                                fontWeight: FontWeight.normal,
                                                height: 1),
                                          )),
                                    ]))),
                          ]))),
                  Positioned(
                      top: 215 * lh / _ph,
                      left: 0 * lw / _pw,
                      child: Container(
                          width: 327 * lw / _pw,
                          height: 62 * lh / _ph,
                          child: Stack(children: <Widget>[
                            Positioned(
                                top: 0 * lh / _ph,
                                left: 0 * lw / _pw,
                                child: Container(
                                    width: 327 * lw / _pw,
                                    height: 62 * lh / _ph,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(35),
                                        topRight: Radius.circular(35),
                                        bottomLeft: Radius.circular(35),
                                        bottomRight: Radius.circular(35),
                                      ),
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                    ))),
                            Positioned(
                                top: 0 * lh / _ph,
                                left: 10 * lw / _pw,
                                child: SizedBox(
                                  width: 250.0 * lw / _pw,
                                  child: TextField(
                                    obscureText: false,
                                    controller: _controllerWeight,
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                      // border: OutlineInputBorder(),
                                      labelText: 'Enter your weight',
                                      floatingLabelAlignment:
                                          FloatingLabelAlignment.center,
                                      labelStyle: TextStyle(
                                        color: Color.fromRGBO(154, 94, 162, 1),
                                        fontFamily: 'CabinCondensed',
                                        fontSize: 25,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.normal,
                                        height: 1,
                                      ),
                                    ),
                                    onSubmitted: (String value) async {
                                      this.weight = num.tryParse(value);
                                      if (this.height == null) {
                                        await showDialog<void>(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: const Text('Error!'),
                                              content: Text(
                                                  'You typed "$value", which is not a valid number!'),
                                              actions: <Widget>[
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text('OK'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      }
                                    },
                                  ),
                                )),
                            Positioned(
                                top: 9 * lh / _ph,
                                left: 257 * lw / _pw,
                                child: Container(
                                    width: 62 * lw / _pw,
                                    height: 44 * lh / _ph,
                                    child: Stack(children: <Widget>[
                                      Positioned(
                                          top: 0 * lh / _ph,
                                          left: 0 * lw / _pw,
                                          child: Container(
                                              width: 62 * lw / _pw,
                                              height: 44 * lh / _ph,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(45),
                                                  topRight: Radius.circular(45),
                                                  bottomLeft:
                                                      Radius.circular(45),
                                                  bottomRight:
                                                      Radius.circular(45),
                                                ),
                                                color: Color.fromRGBO(
                                                    154, 94, 162, 1),
                                              ))),
                                      Positioned(
                                          top: 7 * lh / _ph,
                                          left: 17 * lw / _pw,
                                          child: Text(
                                            'kg',
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    255, 255, 255, 1),
                                                fontFamily: 'CabinCondensed',
                                                fontSize: 25,
                                                letterSpacing: 0,
                                                fontWeight: FontWeight.normal,
                                                height: 1),
                                          )),
                                    ]))),
                          ]))),
                ]))),
        this.showOthers
            ? Positioned(
                top: 650 * lh / _ph,
                left: 40 * lw / _pw,
                child: Container(
                    width: 330 * lw / _pw,
                    height: 146 * lh / _ph,
                    child: Stack(children: <Widget>[
                      Positioned(
                          top: 0 * lh / _ph,
                          left: 0 * lw / _pw,
                          child: Container(
                              width: 327 * lw / _pw,
                              height: 62 * lh / _ph,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(35),
                                  topRight: Radius.circular(35),
                                  bottomLeft: Radius.circular(35),
                                  bottomRight: Radius.circular(35),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(0, 0, 0, 0.25),
                                      offset: Offset(0, 4),
                                      blurRadius: 4)
                                ],
                                color: Color.fromRGBO(225, 214, 234, 1),
                              ))),
                      Positioned(
                          top: 16 * lh / _ph,
                          left: 55 * lw / _pw,
                          child: Text(
                            'Your BMI is: $bmi',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromRGBO(154, 94, 162, 1),
                                fontFamily: 'CabinCondensed',
                                fontSize: 25,
                                letterSpacing:
                                    0 ,
                                fontWeight: FontWeight.normal,
                                height: 1),
                          )),
                      Positioned(
                          top: 99 * lh / _ph,
                          left: 12 * lw / _pw,
                          child: Container(
                              width: 130 * lw / _pw,
                              height: 47 * lh / _ph,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(45),
                                  topRight: Radius.circular(45),
                                  bottomLeft: Radius.circular(45),
                                  bottomRight: Radius.circular(45),
                                ),
                                color: Color.fromRGBO(154, 94, 162, 1),
                              ))),
                      Positioned(
                        top: 99 * lh / _ph,
                        left: 12 * lw / _pw,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              surfaceTintColor: Colors.transparent,
                              fixedSize: Size(130 * lw / _pw, 48 * lh / _ph)),
                          onPressed: CompareButton,
                          child: Text(
                            'Compare',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontFamily: 'CabinCondensed',
                              fontSize: 25,
                              letterSpacing: 0,
                              fontWeight: FontWeight.normal,
                              height: 1,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                          top: 98 * lh / _ph,
                          left: 226 * lw / _pw,
                          child: Container(
                              width: 104 * lw / _pw,
                              height: 47 * lh / _ph,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(45),
                                  topRight: Radius.circular(45),
                                  bottomLeft: Radius.circular(45),
                                  bottomRight: Radius.circular(45),
                                ),
                                color: Color.fromRGBO(154, 94, 162, 1),
                              ))),
                      Positioned(
                          top: 122 * lh / _ph,
                          left: 291 * lw / _pw,
                          child: Transform.rotate(
                            angle: 1.449261851152834e-7 * (3.14159 / 180),
                            child: SvgPicture.asset('assets/images/arrow1.svg',
                                semanticsLabel: 'arrow1'),
                          )),
                      Positioned(
                        top: 98 * lh / _ph,
                        left: 226 * lw / _pw,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              surfaceTintColor: Colors.transparent,
                              fixedSize: Size(104 * lw / _pw, 47 * lh / _ph)),
                          onPressed: NextButton,
                          child: Text(
                            'Next',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontFamily: 'CabinCondensed',
                              fontSize: 25,
                              letterSpacing: 0,
                              fontWeight: FontWeight.normal,
                              height: 1,
                            ),
                          ),
                        ),
                      ),
                    ])))
            : Container(),
      ],
    ));
  }
}