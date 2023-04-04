// ignore: file_names
import 'package:flutter/material.dart';
import 'package:health_app/screens/home_screen.dart';

class BadgesPage extends StatelessWidget {
  final int numberOfBadges;

  const BadgesPage({Key? key, required this.numberOfBadges}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_constructors
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomeScreen()));
          },
        ),
        title: const Text(
          'Your Badges',
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
                    height: MediaQuery.of(context).size.height * 0.8,
                    width: MediaQuery.of(context).size.width * 0.7,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(45)),
                    child: Column(children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Center(
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.08,
                          width: MediaQuery.of(context).size.width * 0.26,
                          decoration: BoxDecoration(
                            color: const Color(0xFF9A5EA2),
                            borderRadius: BorderRadius.circular(45),
                          ),
                          // ignore: prefer_const_constructors
                          child: Center(
                            // ignore: prefer_const_constructors
                            child: Text(
                              '$numberOfBadges/15',
                              // ignore: prefer_const_constructors
                              style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Cabin Condensed',
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03),
                      Wrap(
                        alignment: WrapAlignment.center,
                        children: List.generate(15, (index) {
                          final isUnlocked = index < numberOfBadges;
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'assets/images/badge_${index + 1}${isUnlocked ? "" : "_greyed"}.png',
                              height: MediaQuery.of(context).size.height * 0.1,
                              width: MediaQuery.of(context).size.height * 0.1,
                            ),
                          );
                        }),
                      )
                    ]),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}