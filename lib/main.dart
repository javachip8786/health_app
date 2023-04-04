import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:health_app/screens/home_screen.dart';
import 'package:health_app/screens/login_screen.dart';
import 'package:health_app/screens/signup_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  final MaterialColor myColor = const MaterialColor(
    0xFFE1D6EA,
    {
      50: Color(0xFFF5F2F7),
      100: Color(0xFFEAE2F0),
      200: Color(0xFFD7BBDF),
      300: Color(0xFFC294CE),
      400: Color(0xFFB082C3),
      500: Color(0xFFA070B8),
      600: Color(0xFF8C60A9),
      700: Color(0xFF7B559D),
      800: Color(0xFF6A4A91),
      900: Color(0xFF56397E),
    },
  );

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'health_app',
      theme: ThemeData(
          primarySwatch: myColor,
          // ignore: prefer_const_constructors
          textTheme: TextTheme(
            titleLarge: const TextStyle(
              fontFamily: 'Cabin Condensed',
              fontSize: 25,
              fontWeight: FontWeight.normal,
            ),
      ),
      ),

      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.active){
            if(snapshot.hasData) {
              return const HomeScreen();
            }
            else if(snapshot.hasError){
              return Center(
                child: Text('${snapshot.error}'),
              );
            }
          }
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(
                color: Colors.white 
                ),
            );
          }
          return const loginScreen();
        }
        )
    );
  }
}

