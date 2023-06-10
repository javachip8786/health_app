import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math';

import 'package:health_app/screens/comparePage.dart';
import 'package:health_app/screens/home_screen.dart';

class BMI1 extends StatefulWidget {
  const BMI1({super.key});

  @override
  State<BMI1> createState() => _BMI1State();
}

class _BMI1State extends State<BMI1> {
  final TextEditingController _controllerHeight = TextEditingController();
  final TextEditingController _controllerWeight = TextEditingController();
  final double _ph = 890.2857142857143, _pw = 411.42857142857144;
  num? height, weight;
  double bmi = 0.0;
  bool showOthers = false;
  String font = 'Cabin Condensed';
  // ignore: non_constant_identifier_names
  void CalculateButton() async {
    bmi = 0;

    if (height == null) {
      await showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error!'),
            content: const Text('Invalid Height!'),
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
            content: const Text('Invalid Weight!'),
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
      setState(() {
        bmi = (weight! / ((height! / 100) * (height! / 100)));
        bmi = double.parse(bmi.toStringAsFixed(2));
        Future.delayed(const Duration(milliseconds: 50), () {
          showOthers = true;
        });
      });
    }
  }

  // ignore: non_constant_identifier_names
  void NextButton() {}
  // ignore: non_constant_identifier_names
  void CompareButton() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
          builder: (context) => comparePage(
                bmi: bmi,
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    double lh = MediaQuery.of(context).size.height;
    double lw = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
            },
          ),
          title: Text(
            'BMI',
            style: TextStyle(
                color: const Color(0xFF9A5EA2),
                fontSize: 30 * MediaQuery.of(context).size.width / 411),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background_img.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: 327 * lw / _pw,
                  height: 391 * lh / _ph,
                  child: Column(children: [
                    SizedBox(
                      width: 205 * lw / _pw,
                      height: 65 * lh / _ph,
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF9A5EA2),
                          borderRadius: BorderRadius.circular(
                              45 * MediaQuery.of(context).size.width / 411),
                        ),
                        child: Center(
                          child: Text(
                            'Know your BMI',
                            style: TextStyle(
                                color: const Color.fromRGBO(255, 255, 255, 1),
                                fontFamily: 'Cabin Condensed',
                                fontSize: 25 *
                                    MediaQuery.of(context).size.width /
                                    411,
                                letterSpacing: 0,
                                fontWeight: FontWeight.normal,
                                height: 1),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30 * lh / _ph,
                    ),
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35 * lw / _pw),
                            color: Colors.white),
                        padding: EdgeInsets.all(10 * lw / _pw),
                        width: 320 * lw / _pw,
                        height: 65 * lh / _ph,
                        child: Row(children: [
                          SizedBox(
                            width: 230.0 * lw / _pw,
                            child: TextField(
                              obscureText: false,
                              controller: _controllerHeight,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: const Color.fromRGBO(154, 94, 162, 1),
                                fontFamily: 'Cabin Condensed',
                                fontSize: 25 * lw / _pw,
                                letterSpacing: 0,
                                fontWeight: FontWeight.normal,
                              ),
                              decoration: InputDecoration(
                                  hintText: 'Enter your height',
                                  border: InputBorder.none,
                                  hintStyle: TextStyle(
                                    color:
                                        const Color.fromRGBO(154, 94, 162, 1),
                                    fontFamily: 'Cabin Condensed',
                                    fontSize: 25 * lw / _pw,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: -65 * lh / _ph * 0.5)),
                              onChanged: (String value) async {
                                height = num.tryParse(value);
                                if (height == null) {
                                  await showDialog<void>(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text('Error!'),
                                        content: Text(
                                          'You typed "$value", which is not a valid number!',
                                        ),
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
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(154, 94, 162, 1),
                                borderRadius:
                                    BorderRadius.circular(45 * lw / _pw)),
                            width: 62 * lw / _pw,
                            height: 44 * lh / _ph,
                            child: Text(
                              'cm',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: const Color.fromRGBO(255, 255, 255, 1),
                                  fontFamily: 'Cabin Condensed',
                                  fontSize: 25 * lw / _pw,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            ),
                          ),
                        ])),
                    SizedBox(
                      height: 20 * lh / _ph,
                    ),
                    Container(
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(255, 255, 255, 1),
                            borderRadius: BorderRadius.circular(35 * lw / _pw)),
                        padding: EdgeInsets.all(10 * lw / _pw),
                        width: 320 * lw / _pw,
                        height: 65 * lh / _ph,
                        child: Row(children: [
                          SizedBox(
                            width: 230.0 * lw / _pw,
                            child: TextField(
                              obscureText: false,
                              controller: _controllerWeight,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: const Color.fromRGBO(154, 94, 162, 1),
                                fontFamily: 'Cabin Condensed',
                                fontSize: 25 * lw / _pw,
                                letterSpacing: 0,
                                fontWeight: FontWeight.normal,
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Enter your weight',
                                hintStyle: TextStyle(
                                  color: const Color.fromRGBO(154, 94, 162, 1),
                                  fontFamily: 'Cabin Condensed',
                                  fontSize: 25 * lw / _pw,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.normal,
                                  height: 1,
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: -65 * lh / _ph * 0.5),
                              ),
                              onChanged: (String value) async {
                                weight = num.tryParse(value);
                                if (height == null) {
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
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(154, 94, 162, 1),
                                borderRadius:
                                    BorderRadius.circular(45 * lw / _pw)),
                            width: 62 * lw / _pw,
                            height: 44 * lh / _ph,
                            child: Text(
                              'kg',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: const Color.fromRGBO(255, 255, 255, 1),
                                  fontFamily: 'Cabin Condensed',
                                  fontSize: 25 * lw / _pw,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.normal,
                                  height: 1),
                            ),
                          ),
                        ])),
                    SizedBox(
                      height: 20 * lh / _ph,
                    ),
                    SizedBox(
                      width: 136 * lw / _pw,
                      height: 59 * lh / _ph,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(45),
                            ),
                            backgroundColor:
                                const Color.fromRGBO(154, 94, 162, 1)),
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                          CalculateButton();
                        },
                        child: Text(
                          'Calculate',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontFamily: 'Cabin Condensed',
                            fontSize: 25 * lw/_pw,  //do this
                            letterSpacing: 0,
                            fontWeight: FontWeight.normal,
                            height: 1,
                          ),
                        ),
                      ),
                    ),
                  ])),
              showOthers
                  ? SizedBox(
                      width: _pw,
                      height: 146 * lh / _ph,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                                width: 327 * lw / _pw,
                                height: 62 * lh / _ph,
                                decoration: const BoxDecoration(
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
                                ),
                                child: Center(
                                  child: Text(
                                    'Your BMI is: $bmi',
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color: Color.fromRGBO(154, 94, 162, 1),
                                        fontFamily: 'CabinCondensed',
                                        fontSize: 25,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.normal,
                                        height: 1),
                                  ),
                                )),
                            SizedBox(height: 20 * lh / _ph),
                            ElevatedButton(
                              onPressed: CompareButton,
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(45 * lw / _pw)),
                                backgroundColor: const Color(0xFF9A5EA2),
                              ),
                              child: Text(
                                'Compare',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: const Color.fromRGBO(255, 255, 255, 1),
                                  fontFamily: 'Cabin Condensed',
                                  fontSize: 25 * lw / _pw,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.normal,
                                  height: 1,
                                ),
                              ),
                            ),
                          ]))
                  : Container(),
            ],
          ),
        ));
  }
}