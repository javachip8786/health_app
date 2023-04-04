import 'package:flutter/material.dart';
import 'package:health_app/screens/signup_screen.dart';

import '../utils/colors.dart';
import '../utils/colors.dart';
import '../utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
    void navigatetoSignUp(){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const signupScreen()));
  }

  @override
  Widget build(BuildContext context) {

      return Scaffold(
        body: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/bgtheme.png"),
                fit: BoxFit.cover,
              ),
            ),

            padding: const EdgeInsets.symmetric(horizontal: 32),
            width: double.infinity,

            child: Column(

              mainAxisAlignment: MainAxisAlignment.start,

              children: [
                

                const SizedBox(height: 12,),
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

                  const SizedBox(height: 40,),

                  Card(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    elevation: 50,
                    shadowColor: Colors.black,
                    color: themecolor,
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

                                
                                SizedBox(
                                                width: 5,
                                              ),

                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 2),
                                    shape: BoxShape.circle,
                                    // You can use like this way or like the below line
                                    //borderRadius: new BorderRadius.circular(30.0),
                                    color: Colors.white,
                                  ),
                                  child:Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const <Widget>[
                                      Text('25%',
                                      style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ), ),
                                    ],
                                  ),
                                ),

                                const SizedBox(
                                  width: 20,
                                ),


                                Image.asset('assets/trophie.png',height: 30, width: 30,),



                              ],
                            ),
                          ],
                        ), //Column
                      ), //Padding
                    ), //SizedBox
                  ),
                
                const SizedBox(height: 60,),

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
                                        
                                      onTap: () {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                              SnackBar(content: Text('Gesture Detected!')));             
                                      },
                                      child: Container(
                                        width: 140,
                                        height: 120,
                                        child: Card(
                                          elevation: 10,
                                          child: Image.asset('assets/card1.png',height: 30, width: 30,),
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
                                          child: Image.asset('assets/card2.png',height: 30, width: 30,),
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

                      SizedBox(width: 20,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Column(
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
                                            child: Image.asset('assets/card3.png',height: 30, width: 30,),
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
                                          child: Image.asset('assets/card4.png',height: 30, width: 30,),
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