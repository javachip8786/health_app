import 'package:flutter/material.dart';

class LeaderboardPage extends StatelessWidget {
  final List<String> names;
  final int rank;

  const LeaderboardPage({Key? key, required this.names, required this.rank})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // ignore: prefer_const_constructors
          title: Text(
            'Leaderboard',
            style: const TextStyle(color: Color(0xFF9A5EA2), fontSize: 30),
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
                          'Your rank is: $rank.',
                          // ignore: prefer_const_constructors
                          style: TextStyle(
                            fontSize: 25,
                            fontFamily: 'Cabin Condensed',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                      color: const Color(0xFF9A5EA2).withOpacity(0.4),
                      borderRadius: BorderRadius.circular(45),
                    ),
                    child: Column(children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03),
                      Center(
                        child: Container(
                            height: MediaQuery.of(context).size.height * 0.05,
                            width: MediaQuery.of(context).size.width * 0.5,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(45),
                            ),
                            // ignore: prefer_const_constructors
                            child: Center(
                              // ignore: prefer_const_constructors
                              child: Text(
                                'Our Top 10 Readers',
                                style: const TextStyle(
                                    fontFamily: 'Cabin Condensed'),
                              ),
                            )),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03),
                      Center(
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.35,
                          width: MediaQuery.of(context).size.width * 0.7,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(45),
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: ListView.builder(
                                itemCount: names.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                      title: Row(
                                    children: [
                                      const SizedBox(width: 10),
                                      Container(
                                        height: 30,
                                        width: 30,
                                        // ignore: prefer_const_constructors
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: const Color(0xFF9A5EA2),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '${index + 1}',
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Cabin Condensed'),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(names[index]),
                                    ],
                                  ));
                                },
                              ),
                            ),
                          ),
                        ),
                      )
                    ]),
                  )
                ],
              ),
            )
          ],
        ));
  }
}