
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:health_app/resources/auth_methods.dart';
import 'package:health_app/resources/auth_service.dart';
import 'package:health_app/screens/home_screen.dart';
import 'package:health_app/screens/signup_screen.dart';
import 'package:health_app/utils/globals.dart';
import 'package:health_app/utils/utils.dart';
import 'package:health_app/widgets/text_field_input.dart';

import '../utils/colors.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().loginUser(email: _emailController.text, password: _passwordController.text);
    
    if(res == "success"){
      currentUserEmail = _emailController.text;
      Navigator.of(this.context).pushReplacement(MaterialPageRoute(builder: (context) => const HomeScreen()));
    }
    else{
      showSnackBar(res, this.context);
    }
    setState(() {
      _isLoading = false;
    });
  }


  // signInWithGoogle() async {
  //   final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

  //   final GoogleSignInAuthentication gAuth = await gUser!.authentication;

  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: gAuth.accessToken,
  //     idToken: gAuth.idToken,
  //   );

  //   return await FirebaseAuth.instance.signInWithCredential(credential);
  // }

  void navigatetoSignUp(){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const signupScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background_img.png"),
            fit: BoxFit.cover,
          ),
        ),
          padding: const EdgeInsets.symmetric(horizontal: 32),


          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(child: Container(), flex: 2,),

              Text("Login", style: TextStyle(color: themecolor, fontSize: 32, fontWeight: FontWeight.bold),),

              const SizedBox(height: 24,),

              textFieldInput(
                textEditingController: _emailController, 
                hintText: "Enter Your Email", 
                textInputType: TextInputType.emailAddress,
              ),

              const SizedBox(height: 24,),

              textFieldInput(
                textEditingController: _passwordController, 
                hintText: "Enter Your Password", 
                textInputType: TextInputType.text,
                isPass: true,
              ),

              const SizedBox(height: 24,),

              InkWell(
                onTap: loginUser,
                child: Container(
                  child: _isLoading ? 
                  const Center(child: CircularProgressIndicator( color: Colors.white,),) 
                  : const Text("Log in"),
                  width: 200,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    color: themecolor
                  ),
                ),
              ),

              const SizedBox(height: 12,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: const Text("Not a user yet?"),
                  ),

                  GestureDetector(
                    onTap: navigatetoSignUp,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: const Text("Sign up.", style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                  ),
                ],
              ),

              Column(
                children: [
                  GestureDetector(
                    onTap: () => AuthService().signInWithGoogle(),
                    // onTap: () {
                    //                   ScaffoldMessenger.of(context).showSnackBar(
                    //                         SnackBar(content: Text('Gesture Detected!')));             
                    //                 },
                    child: Image.asset('assets/images/google_logo.png', height: 30, width: 30,),
                  ),
                ],
              ),

              const SizedBox(height: 12,),

              Container(
                child: const Text("Sign In using your Google Account"),
              ),

              Flexible(child: Container(), flex: 2,),
            ]
          ),
        ),
      ),
    );
  }

}