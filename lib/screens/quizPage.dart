// ignore_for_file: file_names
// import 'package:diet_app/answer.dart';
// import 'package:diet_app/question.dart';
import 'package:health_app/screens/answer.dart';
import 'package:health_app/screens/question.dart';
import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  final String chapter;
  const QuizPage({super.key, required this.chapter});

  @override
  State<StatefulWidget> createState() {
    return _QuizPageState();
  }
}

class _QuizPageState extends State<QuizPage> {
  var _questionId = -1;
  var _totalScore = 0;
  bool _showFinalScore = false;
  var questions = [
    {
      'questionText': 'How much salt should be consumed on a daily basis?',
      'answers': [
        {'text': '1 Teaspoon', 'isCorrect': false},
        {'text': '1/2 Teaspoon', 'isCorrect': true},
        {'text': '1/4 Teaspoon', 'isCorrect': false},
        {'text': '2 Teaspoons', 'isCorrect': false}
      ]
    },
    {
      'questionText':
          'What is the normal Blood Pressure Level of a Healthy Person?',
      'answers': [
        {'text': '<120/80', 'isCorrect': true},
        {'text': '>120/80', 'isCorrect': false},
        {'text': '>130/90', 'isCorrect': false},
        {'text': '>140/100', 'isCorrect': false}
      ]
    },
    {
      'questionText':
          'Which of the following labelled food items should a person suffering from High BP Levels should eat',
      'answers': [
        {'text': 'Low Sodium', 'isCorrect': true},
        {'text': 'High Sodium', 'isCorrect': false},
        {'text': 'Caffeine', 'isCorrect': false}
      ]
    },
    {
      'questionText': 'What is the recommended daily water intake for adults?',
      'answers': [
        {'text': '8 cups', 'isCorrect': false},
        {'text': '6 cups', 'isCorrect': false},
        {'text': '10 cups', 'isCorrect': true},
        {'text': '12 cups', 'isCorrect': false}
      ]
    },
  ];

  void _answerQuestion(bool isCorrect) {
    if (isCorrect) {
      setState(() {
        _totalScore++;
      });
    }
    setState(() {
      _questionId++;
      if (_questionId >= questions.length) {
        _showFinalScore = true;
      }
    });
  }

  void _skipQuestion() {
    setState(() {
      _questionId++;
      if (_questionId >= questions.length) {
        _showFinalScore = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          '${widget.chapter} Quiz',
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
          child: Center(
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _showFinalScore
                      ? [
                          Center(
                            child: Text(
                              'Quiz complete! You scored $_totalScore out of ${questions.length}',
                              style: TextStyle(
                                fontSize: 20 *
                                    MediaQuery.of(context).size.width /
                                    411,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ]
                      : [
                          if (_questionId < 0)
                            Column(
                              children: [
                                Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.08,
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    decoration: BoxDecoration(
                                        color: const Color(0xFF9A5EA2),
                                        borderRadius:
                                            BorderRadius.circular(45)),
                                    child: Center(
                                      child: Text(
                                        'Do you want to start the quiz?',
                                        style: TextStyle(
                                            fontSize: 20 *
                                                MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                411,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white),
                                      ),
                                    )),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.05),
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      _questionId = 0;
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20))),
                                  child: const Text('Start Quiz'),
                                ),
                              ],
                            ),
                          if (_questionId >= 0)
                            Column(
                              children: [
                                Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    width:
                                        MediaQuery.of(context).size.width * 0.6,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(45),
                                        color: const Color(0xFF9A5EA2)),
                                    child: Center(
                                      child: Text(
                                        'Question ${_questionId + 1} of ${questions.length}',
                                        style: TextStyle(
                                            fontSize: 20 *
                                                MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                411,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      ),
                                    )),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.05),
                                Question(
                                    questions[_questionId % questions.length]
                                            ['questionText']
                                        .toString()),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.03),
                                ...((questions[_questionId % questions.length]
                                            ['answers'])
                                        as List<Map<String, Object>>)
                                    .map((answer) {
                                  return Answer(
                                    () => _answerQuestion(
                                        answer['isCorrect'] == true),
                                    answer['text'].toString(),
                                    answer['isCorrect'] == true,
                                  );
                                }).toList(),
                                const SizedBox(height: 10),
                              ],
                            ),
                        ],
                ),
                Positioned(
                  bottom: MediaQuery.of(context).size.height * 0.1,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      if (_questionId >= 0 && _questionId < questions.length)
                        ElevatedButton(
                          onPressed: () {
                            _skipQuestion();
                          },
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(45))),
                          child: const Text('Next'),
                        ),
                      if (_questionId >= 0)
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(45))),
                          onPressed: () {
                            if (!_showFinalScore) {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('Exit Quiz'),
                                      content: const Text(
                                          'Are you sure you want to exit the quiz?'),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('Exit'),
                                        ),
                                      ],
                                    );
                                  });
                            } else {
                              Navigator.of(context).pop();
                            }
                          },
                          child: const Text('Exit Quiz'),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
