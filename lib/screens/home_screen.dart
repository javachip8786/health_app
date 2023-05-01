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

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  // User? user = _auth.currentUser;


  void navigatetotrackprogress(){
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (context) => const ProgressScreen(
                readingProgress: 0.5, readingSpeed: 0.7, quizScore: 0.5)),
      );
  }

  void navigatetoBadgesPage(){
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (context) => const BadgesPage(
                numberOfBadges: 12)),
      );
  }

  void navigatetoBmi(){
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (context) => BMI1()),
      );
  }

  void healthyLivingPage(){
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (context) => HealthyLivingPage()),
      );
  }



    void navigatetoHypertenstion(){
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (context) => const HypertensionPage()),
      );
  }


  @override
  Widget build(BuildContext context) {

      return Scaffold(
        body: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background_img.png"),
                fit: BoxFit.cover,
              ),
            ),

            padding: const EdgeInsets.symmetric(horizontal: 30),
            width: double.infinity,

            child: Column(

              mainAxisAlignment: MainAxisAlignment.start,

              children: [
                

                SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                // mainAxisAlignment: MainAxisAlignment.start,

                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children:  [
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Icon(Icons.home),

                      Text(
                            "Home",
                            style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        "Welcome",
                        style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  

                  

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Icon(Icons.person),
                      Text(
                        "Ayush",
                        style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),





                  Row(

                    children: const [
                        

                    ]
                  ),

                  SizedBox(height: MediaQuery.of(context).size.height*0.05,),

                  Card(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: Colors.white,
                        width: 5
                      ),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    elevation: 50,
                    shadowColor: Colors.black,
                    color: const Color(0xFF9A5EA2),
                    child: SizedBox(
                      width: 300,
                      height: 120,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text(
                                    'Your Progress: ',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ), 
                                ), 

                                
                                const SizedBox(
                                                width: 5,
                                              ),


                                MaterialButton(
                                  height: 50.0, 
                                  minWidth: 50.0, 
                                  onPressed: navigatetotrackprogress,
                                  color: Colors.white,
                                  padding: const EdgeInsets.all(16),
                                  shape: const CircleBorder(),
                                  child:
                                    const Text('25%',
                                      style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ), ),
                                ),

                                SizedBox(width: MediaQuery.of(context).size.width * 0.05,),


                                // Image.asset('assets/images/trophie.png',height: 30, width: 30,),

                                GestureDetector(
                                  onTap: navigatetoBadgesPage,
                                  child: Image.asset('assets/images/trophie.png',height: MediaQuery.of(context).size.height*0.05, width: MediaQuery.of(context).size.height*0.05),
                                ),
                              ],
                            ),
                          ],
                        ), //Column
                      ), //Padding
                    ), //SizedBox
                  ),
                
                SizedBox(height: MediaQuery.of(context).size.height * 0.05,),

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
                                        
                                      onTap: navigatetoBmi,
                                      child: SizedBox(
                                        width: 140,
                                        height: 120,
                                        child: Card(
                                          elevation: 10,
                                          color: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(50),
                                          ),
                                          child: Image.asset('assets/images/card1.png',height: 30, width: 30,),
                                        ),
                                      ),
                                  ),
                                  
                                
                                const Text('other', style: TextStyle(fontSize: 15)),
                              ],
                            ),
                          ),
                          

                          SizedBox(width: MediaQuery.of(context).size.width*0.05,),

                          Column(
                            children: [
                              GestureDetector(
              
                                    onTap: healthyLivingPage,
                                    child: Container(
                                      width: 140,
                                      height: 120,
                                        child: Card(
                                          elevation: 10,
                                          child: Image.asset('assets/images/card2.png',height: 30, width: 30,),
                                          color: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(50),
                                          ),
                                        ),
                                    ),
                                ),
                              Text('other', style: TextStyle(fontSize: 15)),
                            
                            ],
                          ),
                        ],
                      ),

                      SizedBox(width: MediaQuery.of(context).size.width*0.05),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Column(
                              children: [
                                GestureDetector(
                                        
                                      onTap: navigatetoHypertenstion,
                                      child: Container(
                                        width: 140,
                                        height: 120,
                                          child: Card(
                                            elevation: 10,
                                            child: Image.asset('assets/images/card3.png',height: 30, width: 30,),
                                            color: Colors.white,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(50),
                                            ),
                                          ),
                                      ),
                                  ),
                                Text('other', style: TextStyle(fontSize: 15)),
                              ],
                            ),
                          ),

                          SizedBox(width: 20,),

                          Column(
                            children: [
                              GestureDetector(
                                    onTap: () {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(content: Text('Gesture Detected!')));             
                                    },
                                    child: Container(
                                      width: 140,
                                      height: 120,
                                        child: Card(
                                          elevation: 10,
                                          child: Image.asset('assets/images/card4.png',height: 30, width: 30,),
                                          color: Colors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(50),
                                          ),
                                        ),
                                    ),
                                ),
                              Text('other', style: TextStyle(fontSize: 15)),
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
              ]
            )



          )
        )
      );
  }
}