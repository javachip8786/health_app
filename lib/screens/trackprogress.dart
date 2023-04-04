// ignore_for_file: file_names

import 'package:health_app/screens/home_screen.dart';
import 'package:health_app/screens/leaderboard.dart';
import 'package:flutter/material.dart';

//The progress screen through which user can track progress.
class ProgressScreen extends StatelessWidget {
  const ProgressScreen(
      {super.key,
      required this.readingProgress,
      required this.quizScore,
      required this.readingSpeed});
  final double readingProgress;
  final double quizScore;
  final double readingSpeed;

  @override
  Widget build(BuildContext context) {
    final totalProgress = (readingProgress + quizScore) / 2;

    String gradeText = '';
    if (totalProgress >= 0.9) {
      gradeText = 'According to us, you are an \n                A+ reader';
    } else if (totalProgress >= 0.8) {
      gradeText = 'According to us, you are an \n                A reader';
    } else if (totalProgress >= 0.7) {
      gradeText = 'According to us, you are a \n                B reader';
    } else if (totalProgress >= 0.6) {
      gradeText = 'According to us, you are a \n                C reader';
    } else if (totalProgress >= 0.5) {
      gradeText = 'According to us, you are a \n                D reader';
    } else {
      gradeText = 'You need to work harder to improve your reading skills';
    }

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomeScreen()));
              // Navigator.pop(context);
            },
          ),
          title: const Text(
            'Track your progress',
            style: TextStyle(color: Color(0xFF9A5EA2), fontSize: 30),
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
                      fit: BoxFit.cover),
                ),
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    Center(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.15,
                        width: MediaQuery.of(context).size.width * 0.7,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(45),
                        ),
                        child: Center(
                          child: Text(
                            gradeText,
                            // ignore: prefer_const_constructors
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Cabin Condensed',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    Center(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(45),
                        ),
                        child: _buildProgressIndicator(
                            title: 'Reading Progress', value: readingProgress),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    Center(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(45),
                        ),
                        child: _buildProgressIndicator(
                            title: 'Av. Quiz Score', value: quizScore),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    Center(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(45),
                        ),
                        child: _buildProgressIndicator(
                            title: 'Reading Speed', value: readingSpeed),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    Center(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(45),
                        ),
                        child: _buildProgressIndicator(
                            title: 'Total Progress', value: totalProgress),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  ],
                )),
            Align(
              alignment: FractionalOffset.bottomRight,
              child: Padding(
                padding:
                    EdgeInsets.all(MediaQuery.of(context).size.height * 0.05),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            // ignore: prefer_const_constructors
                            builder: (context) => LeaderboardPage(
                                  // ignore: prefer_const_literals_to_create_immutables
                                  names: [
                                    'John',
                                    'Jane',
                                    'Bob',
                                    'Alice',
                                    'Tom',
                                    'Jerry',
                                    'Mike',
                                    'Sally',
                                    'Peter',
                                    'Emily'
                                  ],
                                  rank: 289,
                                )));
                  },
                  // ignore: sort_child_properties_last
                  child: const Text(
                    'Check Leaderboard',
                    style: TextStyle(
                        color: Colors.white, fontFamily: 'Cabin Condensed'),
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      backgroundColor: const Color(0xFF9A5EA2)),
                ),
              ),
            )
          ],
        ));
  }

  Widget _buildProgressIndicator({
    required String title,
    required double value,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            '$title: ',
            style: const TextStyle(fontFamily: 'Cabin Condensed', fontSize: 16),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: const Color(0xFFE1D6EA),
              borderRadius: BorderRadius.circular(20)),
          child: SizedBox(
              width: 150,
              height: 20,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: LinearProgressIndicator(
                  value: value,
                  backgroundColor: const Color(0xFFE1D6EA),
                  valueColor:
                      const AlwaysStoppedAnimation<Color>(Color(0xFF9A5EA2)),
                ),
              )),
        )
      ],
    );
  }
}