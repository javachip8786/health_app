import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:health_app/screens/HealthyLivingPage.dart';
import 'package:health_app/screens/badgespage.dart';
import 'package:health_app/screens/bmi.dart';
import 'package:health_app/screens/comparePage.dart';
// import 'package:health_app/screens/hypertenstion.dart';
import 'package:health_app/screens/trackprogress.dart';
// import 'package:health_app/screens/hypertenstion.dart';
import 'package:health_app/screens/hypertensionPage.dart';
import 'package:health_app/utils/globals.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  // User? user = _auth.currentUser;

  void navigatetotrackprogress() {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => const ProgressScreen(
              readingProgress: 0.5, readingSpeed: 0.7, quizScore: 0.5)),
    );
  }

  void navigatetoBadgesPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => const BadgesPage(numberOfBadges: 12)),
    );
  }

  void navigatetoBmi() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const BMI1()),
    );
  }

  void healthyLivingPage() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const HealthyLivingPage()),
    );
  }

  void navigatetoHypertenstion() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const HypertensionPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Diet App',
            style: TextStyle(
                color: const Color(0xFF9A5EA2),
                fontSize: 35 * MediaQuery.of(context).size.width / 411),
          ),
          automaticallyImplyLeading: false,
        ),
        body: SafeArea(
            child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/background_img.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                padding: const EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  color: Colors.white,
                                  width: 5 *
                                      MediaQuery.of(context).size.width /
                                      411),
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            elevation: 50,
                            shadowColor: Colors.black,
                            color: const Color(0xFF9A5EA2),
                            child: SizedBox(
                              width:
                                  300 * MediaQuery.of(context).size.width / 411,
                              height: 120,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Your Progress: ',
                                          style: TextStyle(
                                              fontSize: 25 *
                                                  MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  411,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'Cabin Condensed'),
                                        ),

                                        SizedBox(
                                          width: 2 *
                                              MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              411,
                                        ),

                                        MaterialButton(
                                          height: 50.0,
                                          minWidth: 50.0,
                                          onPressed: navigatetotrackprogress,
                                          color: Colors.white,
                                          padding: const EdgeInsets.all(16),
                                          shape: const CircleBorder(),
                                          child: const Text(
                                            '25%', 
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),

                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.02,
                                        ),

                                        // Image.asset('assets/images/trophie.png',height: 30, width: 30,),

                                        GestureDetector(
                                          onTap: navigatetoBadgesPage,
                                          child: Image.asset(
                                              'assets/images/trophie.png',
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.1,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.09),
                                        ),
                                      ],
                                    ),
                                  ],
                                ), //Column
                              ), //Padding
                            ), //SizedBox
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05,
                          ),
                          Column(
                            children: [
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Flexible(
                                        child: Column(
                                          children: [
                                            GestureDetector(
                                              onTap: navigatetoHypertenstion,
                                              child: SizedBox(
                                                width: 140 *
                                                    MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    411,
                                                height: 120 *
                                                    MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    683,
                                                child: Card(
                                                  elevation: 10 *
                                                      MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      411,
                                                  color: Colors.white,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50 *
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width /
                                                                411),
                                                  ),
                                                  child: Image.asset(
                                                    'assets/images/card1.png',
                                                    height: 30 *
                                                        MediaQuery.of(context)
                                                            .size
                                                            .height /
                                                        683,
                                                    width: 30 *
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        411,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10 *
                                                  MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  683,
                                              width: 10 *
                                                  MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  411,
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.4,
                                              decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xFF9A5EA2),
                                                  borderRadius:
                                                      BorderRadius.circular(20 *
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          411)),
                                              padding: EdgeInsets.all(10 *
                                                  MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  411),
                                              child: Center(
                                                child: Text('Hypertension',
                                                    style: TextStyle(
                                                        fontSize: 15 *
                                                            MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            411,
                                                        fontFamily:
                                                            'Cabin Condensed',
                                                        color: Colors.white)),
                                              ),
                                            ),
                                            SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.01)
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.05,
                                      ),
                                      // Column(
                                      //   children: [
                                      //     GestureDetector(
                                      //       onTap: healthyLivingPage,
                                      //       child: Container(
                                      //         width: 140,
                                      //         height: 120,
                                      //         child: Card(
                                      //           elevation: 10,
                                      //           child: Image.asset(
                                      //             'assets/images/card2.png',
                                      //             height: 30,
                                      //             width: 30,
                                      //           ),
                                      //           color: Colors.white,
                                      //           shape: RoundedRectangleBorder(
                                      //             borderRadius:
                                      //                 BorderRadius.circular(50),
                                      //           ),
                                      //         ),
                                      //       ),
                                      //     ),
                                      //     Text('other',
                                      //         style: TextStyle(fontSize: 15)),
                                      //   ],
                                      // ),
                                    ],
                                  ),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.05),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Flexible(
                                        child: Column(
                                          children: [
                                            GestureDetector(
                                              onTap: navigatetoBmi,
                                              child: SizedBox(
                                                width: 140 *
                                                    MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    411,
                                                height: 120 *
                                                    MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    683,
                                                child: Card(
                                                  elevation: 10 *
                                                      MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      411,
                                                  color: Colors.white,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50 *
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width /
                                                                411),
                                                  ),
                                                  child: Image.asset(
                                                    'assets/images/card3.png',
                                                    height: 30 *
                                                        MediaQuery.of(context)
                                                            .size
                                                            .height /
                                                        683,
                                                    width: 30 *
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        411,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10 *
                                                  MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  683,
                                              width: 10 *
                                                  MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  411,
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.4,
                                              decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xFF9A5EA2),
                                                  borderRadius:
                                                      BorderRadius.circular(20 *
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          411)),
                                              padding: EdgeInsets.all(10 *
                                                  MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  411),
                                              child: Center(
                                                child: Text('BMI',
                                                    style: TextStyle(
                                                        fontSize: 15 *
                                                            MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width /
                                                            411,
                                                        fontFamily:
                                                            'Cabin Condensed',
                                                        color: Colors.white)),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20 *
                                            MediaQuery.of(context).size.width /
                                            411,
                                      ),
                                      Column(
                                        children: [
                                          GestureDetector(
                                            onTap: healthyLivingPage,
                                            child: SizedBox(
                                              width: 140 *
                                                  MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  411,
                                              height: 120 *
                                                  MediaQuery.of(context)
                                                      .size
                                                      .height /
                                                  683,
                                              child: Card(
                                                elevation: 10 *
                                                    MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    411,
                                                color: Colors.white,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(50 *
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          411),
                                                ),
                                                child: Image.asset(
                                                  'assets/images/card4.png',
                                                  height: 30 *
                                                      MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      683,
                                                  width: 30 *
                                                      MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      411,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10 *
                                                MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                683,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.4,
                                            decoration: BoxDecoration(
                                                color: const Color(0xFF9A5EA2),
                                                borderRadius:
                                                    BorderRadius.circular(20 *
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        411)),
                                            padding: EdgeInsets.all(10 *
                                                MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                411),
                                            child: Center(
                                              child: Text(
                                                  'Towards Healthy Living',
                                                  style: TextStyle(
                                                      fontSize: 15 *
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          411,
                                                      fontFamily:
                                                          'Cabin Condensed',
                                                      color: Colors.white)),
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ]))));
  }
}