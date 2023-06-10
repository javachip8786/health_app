// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:health_app/screens/home_screen.dart';

class HealthyLivingPage extends StatefulWidget {
  const HealthyLivingPage({Key? key}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _HealthyLivingPageState createState() => _HealthyLivingPageState();
}

class _HealthyLivingPageState extends State<HealthyLivingPage> {
  bool _isOverlayVisible = false;
  int _selectedSubheadingIndex = -1;

  static const String introheading = 'Towards Healthier Living';
  static const String intro =
      'In today\'s scenario, the availability of information is not an issue. There are umpteen sources and getting information online is only a click away. The abundance of information often makes people feel empowered but leaves them in quandary as to what is right and which is the most authentic source of information. Advice for medical conditions should be provided by those who are well informed.';

  static const String subheading1 = 'The Objective';
  static const String subtopic1 =
      'This app aims to serve only as a quick guide to refer to the general dietary and physical activity guidelines for some common medical conditions. This may be used only as a guideapp only. For providing personalized dietary advice to the patients, co-morbidities (if any), their age, gender, physiological status and a host of other factors also need to be considered. ';

  static const String subheading2 = 'How was information collected?';
  static const String subtopic2 =
      'An effort to put together such information was indeed a herculean task and efforts of several upcoming and established dietitians, nutritionists, academics and researchers have materialized this app. There are several other disease conditions that are not covered in this app and there are a few which are covered but India specific guidelines/research may have been sparse. In such cases the experts have relied on well-researched and well-documented sources from elsewhere. ';

  static const String subheading3 = 'Updation of Information';
  static const String subtopic3 =
      ' Given the dynamic nature of science, there perhaps is a constant and regular need to revisit and update the information provided in this app and this will be our continued effort. FSSAI is of the opinion that eating right is as important as eating safe. ';

  List<Widget> topics = [];
  List<String> subheadings = [
    subheading1,
    subheading2,
    subheading3
    // subheading4,
    // subheading5
  ];
  List<String> subtopics = [
    subtopic1,
    subtopic2,
    subtopic3
    // subtopic4,
    // subtopic5
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
    for (int i = 0; i < subheadings.length; i++) {
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
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const HomeScreen()));
          },
        ),
        title: Text(
          'Healthy Living',
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
