// ignore_for_file: file_names
// import 'package:diet_app/quizPage.dart';
import 'package:health_app/screens/home_screen.dart';
import 'package:health_app/screens/quizPage.dart';

import 'package:flutter/material.dart';

class HypertensionPage extends StatefulWidget {
  const HypertensionPage({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _HypertensionPageState createState() => _HypertensionPageState();
}

class _HypertensionPageState extends State<HypertensionPage> {
  bool _isOverlayVisible = false;
  int _selectedSubheadingIndex = -1;

  static const String introheading = 'Understanding Hypertension and Its Risks';
  static const String intro =
      'Hypertension, also known as high blood pressure, is a condition that affects millions of people worldwide. Often referred to as the "silent killer," hypertension is notorious for being asymptomatic, making it difficult to detect without routine monitoring. If left untreated, hypertension can lead to serious health complications, including heart disease, stroke, and kidney disease. In this article, we will explore what hypertension is, its risk factors, how it can be diagnosed, and what measures can be taken to manage it.';

  static const String subheading1 = 'What is Hypertension?';
  static const String subtopic1 =
      'Hypertension occurs when the blood pressure is persistently elevated above normal levels. Blood pressure is classified into different categories, including normal, elevated, hypertension stage 1, and hypertension stage 2, based on the readings obtained from a blood pressure monitor. In this section, we will discuss what hypertension is, its symptoms, and how it can be diagnosed.';

  static const String subheading2 = 'Who is at Risk of Hypertension?';
  static const String subtopic2 =
      'Although anyone can develop hypertension, certain groups of people are more prone to developing it. In this section, we will explore the risk factors associated with hypertension, including obesity, smoking, stress, poor dietary habits, and advancing age.';

  static const String subheading3 = 'Assessing Your Risk of Hypertension';
  static const String subtopic3 =
      'Regular monitoring of blood pressure is essential for detecting hypertension. In this section, we will discuss the tests that can be done to assess your risk of developing hypertension, including fasting blood glucose levels, lipid profile, and urinary-albumin to creatinine ratio.';

  static const String subheading4 = 'Secondary Hypertension';
  static const String subtopic4 =
      'While primary hypertension is the most common form of hypertension, secondary hypertension can also occur as a result of an underlying medical condition. In this section, we will explore the different pre-existing conditions that can lead to secondary hypertension.';

  static const String subheading5 =
      'Managing Hypertension through Diet and Lifestyle Changes';
  static const String subtopic5 =
      'The management of hypertension involves a combination of lifestyle changes, medication, and monitoring. In this section, we will discuss the different dietary and lifestyle changes that can be made to manage hypertension, including the DASH diet, regular exercise, and stress management techniques.';
  List<Widget> topics = [];
  List<String> subheadings = [
    subheading1,
    subheading2,
    subheading3,
    subheading4,
    subheading5
  ];
  List<String> subtopics = [
    subtopic1,
    subtopic2,
    subtopic3,
    subtopic4,
    subtopic5
  ];

  List<Widget> _buildSubheadingWidgets() {
    List<Widget> subheadingWidgets = [];
    for (int i = 0; i < subheadings.length; i++) {
      subheadingWidgets.add(
        GestureDetector(
          onTap: () {
            setState(() {
              _selectedSubheadingIndex = i;
            });
          },
          child: Container(
            height: MediaQuery.of(context).size.height * 0.08,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(45),
              color: Colors.white,
            ),
            child: Center(
              child: Text(
                subheadings[i],
                style: TextStyle(
                  fontSize: 18 * MediaQuery.of(context).size.width / 411,
                  fontFamily: 'Cabin Condensed',
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      );
      subheadingWidgets.add(
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.01,
        ),
      );
    }
    return subheadingWidgets;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < 5; i++) {
      topics.add(
        Container(
            height: MediaQuery.of(context).size.height * 0.08,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(45),
              color: Colors.white,
            ),
            child: Center(
              child: Text(
                subheadings[i],
                style: TextStyle(
                  fontSize: 20 * MediaQuery.of(context).size.width / 411,
                  fontFamily: 'Cabin Condensed',
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            )),
      );
      topics.add(SizedBox(
        height: MediaQuery.of(context).size.height * 0.01,
      ));
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomeScreen()));
          },
        ),
        title: Text(
          'Hypertension',
          style: TextStyle(
              color: const Color(0xFF9A5EA2),
              fontSize: 30 * MediaQuery.of(context).size.width / 411),
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background_img.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isOverlayVisible = true;
                    });
                  },
                  child: Container(
                      height: MediaQuery.of(context).size.height * 0.08,
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                          color: const Color(0xFF9A5EA2),
                          borderRadius: BorderRadius.circular(45)),
                      child: Center(
                          child: Text(
                        introheading,
                        style: TextStyle(
                            fontSize:
                                20 * MediaQuery.of(context).size.width / 411,
                            fontFamily: 'Cabin Condensed',
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ))),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _buildSubheadingWidgets())
              ],
            ),
          ),
          Align(
            alignment: FractionalOffset.bottomRight,
            child: Padding(
              padding:
                  EdgeInsets.all(MediaQuery.of(context).size.height * 0.05),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          const QuizPage(chapter: 'Hypertension'),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    backgroundColor: const Color(0xFF9A5EA2)),
                child: const Text(
                  'Take A Quiz',
                  style: TextStyle(
                      color: Colors.white, fontFamily: 'Cabin Condensed'),
                ),
              ),
            ),
          ),
          if (_isOverlayVisible)
            GestureDetector(
              onTap: () {
                setState(() {
                  _isOverlayVisible = false;
                });
              },
              child: Center(
                child: Container(
                    padding: const EdgeInsets.all(20),
                    height: MediaQuery.of(context).size.height * 0.7,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(45),
                      color: const Color(0xFF9A5EA2).withOpacity(0.5),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.width * 0.8,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(45),
                              color: const Color(0xFF9A5EA2)),
                          child: Center(
                              child: Text(
                            introheading,
                            style: TextStyle(
                                fontSize: 18 *
                                    MediaQuery.of(context).size.width /
                                    411,
                                fontFamily: 'Cabin Condensed',
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          )),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          height: MediaQuery.of(context).size.height * 0.5,
                          width: MediaQuery.of(context).size.width * 0.8,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(45),
                              color: Colors.white),
                          child: Center(
                            child: Text(
                              intro,
                              style: TextStyle(
                                fontSize: 18 *
                                    MediaQuery.of(context).size.width /
                                    411,
                                fontFamily: 'Cabin Condensed',
                                fontWeight: FontWeight.w400,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                      ],
                    )),
              ),
            ),
          if (_selectedSubheadingIndex != -1)
            GestureDetector(
              onTap: () {
                setState(() {
                  _selectedSubheadingIndex = -1;
                });
              },
              child: Center(
                  child: Container(
                      padding: const EdgeInsets.all(20),
                      height: MediaQuery.of(context).size.height * 0.7,
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(45),
                        color: const Color(0xFF9A5EA2).withOpacity(0.5),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.1,
                            width: MediaQuery.of(context).size.width * 0.8,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(45),
                                color: const Color(0xFF9A5EA2)),
                            child: Center(
                                child: Text(
                              subheadings[_selectedSubheadingIndex],
                              style: TextStyle(
                                  fontSize: 18 *
                                      MediaQuery.of(context).size.width /
                                      411,
                                  fontFamily: 'Cabin Condensed',
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                              textAlign: TextAlign.center,
                            )),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Container(
                            padding: const EdgeInsets.all(30),
                            height: MediaQuery.of(context).size.height * 0.5,
                            width: MediaQuery.of(context).size.width * 0.8,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(45),
                                color: Colors.white),
                            child: Center(
                              child: Text(
                                subtopics[_selectedSubheadingIndex],
                                style: TextStyle(
                                  fontSize: 18 *
                                      MediaQuery.of(context).size.width /
                                      411,
                                  fontFamily: 'Cabin Condensed',
                                  fontWeight: FontWeight.w400,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )
                        ],
                      ))),
            )
        ],
      ),
    );
  }
}
