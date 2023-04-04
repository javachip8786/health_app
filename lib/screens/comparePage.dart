// ignore: file_names
import 'package:flutter/material.dart';
import 'package:health_app/screens/home_screen.dart';

// ignore: camel_case_types
class comparePage extends StatefulWidget {
  final double bmi;
  const comparePage({Key? key, required this.bmi}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _comparePageState createState() => _comparePageState();
}

// ignore: camel_case_types
class _comparePageState extends State<comparePage> {
  String imageName = 'assets/images/obese.png';
  String range = 'Obese';
  bool _isOverlayVisible = false;

  @override
  void initState() {
    super.initState();
    updateImageAndRange();
  }

  void updateImageAndRange() {
    double bmi = widget.bmi;
    if (bmi < 18.5) {
      imageName = 'assets/images/underweight.png';
      range = 'Underweight';
    } else if (bmi >= 18.5 && bmi <= 22.9) {
      imageName = 'assets/images/normal.png';
      range = 'Normal';
    } else if (bmi >= 23.0 && bmi <= 24.5) {
      imageName = 'assets/images/overweight.png';
      range = 'Overweight';
    } else {
      imageName = 'assets/images/obese.png';
      range = 'Obese';
    }
  }

  @override
  Widget build(BuildContext context) {
    double bmi = widget.bmi;
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
          'Compare Yourself',
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
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.width * 0.5,
                    decoration: BoxDecoration(
                        color: const Color(0xFF9A5EA2),
                        borderRadius: BorderRadius.circular(45)),
                    child: Center(
                      child: Text(
                        'Your BMI is $bmi.',
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
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                Image.asset(
                  imageName,
                  width: MediaQuery.of(context).size.width * 0.8,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                        color: const Color(0xFFD7BCEC),
                        borderRadius: BorderRadius.circular(45)),
                    child: Center(
                      child: Text(
                        'You are in $range range.',
                        // ignore: prefer_const_constructors
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Cabin Condensed',
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF9A5EA2)),
                      ),
                    ),
                  ),
                ),
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
                    setState(() {
                      _isOverlayVisible = !_isOverlayVisible;
                    });
                  },
                  // ignore: sort_child_properties_last
                  child: Text(
                    _isOverlayVisible ? "Go back" : "Check Range",
                    style: const TextStyle(
                        color: Colors.white, fontFamily: 'Cabin Condensed'),
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      backgroundColor: const Color(0xFF9A5EA2)),
                ),
              )),
          if (_isOverlayVisible)
            GestureDetector(
                onTap: () {
                  setState(() {
                    _isOverlayVisible = false;
                  });
                },
                child: Center(
                  child: Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(45),
                        color: const Color(0xFF9A5EA2).withOpacity(0.5),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.05),
                          Center(
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.08,
                              width: MediaQuery.of(context).size.width * 0.75,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: const Color(0xFF9A5EA2)),
                              child: const Center(
                                child: Text(
                                  'Asian-Indian Specific Range for BMI',
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
                              height:
                                  MediaQuery.of(context).size.height * 0.05),
                          Center(
                            child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.3,
                                width: MediaQuery.of(context).size.width * 0.7,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(40)),
                                padding: const EdgeInsets.all(16.0),
                                child: Center(
                                  child: Table(
                                    border: const TableBorder(
                                      verticalInside: BorderSide(
                                          width: 2.0, color: Colors.black),
                                    ),
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                      const TableRow(
                                        children: [
                                          TableCell(
                                            child: Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Text(
                                                'Underweight',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontFamily:
                                                        'Cabin Condensed',
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ),
                                          TableCell(
                                            child: Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Text(
                                                'BMI < 18.5',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontFamily:
                                                        'Cabin Condensed',
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      // ignore: prefer_const_constructors
                                      TableRow(
                                        children: const [
                                          TableCell(
                                            child: Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Text(
                                                'Normal',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontFamily:
                                                        'Cabin Condensed',
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ),
                                          TableCell(
                                            child: Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Text(
                                                '18.5 - 22.9',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontFamily:
                                                        'Cabin Condensed',
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const TableRow(
                                        children: [
                                          TableCell(
                                            child: Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Text(
                                                'Overweight',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontFamily:
                                                        'Cabin Condensed',
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ),
                                          TableCell(
                                            child: Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Text(
                                                '23.0- 24.5',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontFamily:
                                                        'Cabin Condensed',
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const TableRow(
                                        children: [
                                          TableCell(
                                            child: Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Text(
                                                'Obese',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontFamily:
                                                        'Cabin Condensed',
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ),
                                          TableCell(
                                            child: Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Text(
                                                'BMI ≥ 25.0',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontFamily:
                                                        'Cabin Condensed',
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.black),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )),
                          )
                        ],
                      )),
                ))
        ],
      ),
    );
  }
}