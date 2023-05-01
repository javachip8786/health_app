import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:health_app/resources/auth_methods.dart';
import 'package:health_app/screens/home_screen.dart';
import 'package:health_app/screens/login_screen.dart';
import 'package:health_app/utils/colors.dart';
import 'package:health_app/utils/utils.dart';

import 'package:health_app/widgets/text_field_input.dart';
import 'package:image_picker/image_picker.dart';

import '../resources/auth_service.dart';

class signupScreen extends StatefulWidget {
  const signupScreen({super.key});

  @override
  State<signupScreen> createState() => _signupScreenState();
}

class _signupScreenState extends State<signupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  // final TextEditingController _bioController = TextEditingController();
  // final TextEditingController _usernameController = TextEditingController();
  // Uint8List? _image;
  bool _isLoading = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    // _bioController.dispose();
    // _usernameController.dispose();
  }

  void selectImage() async {
    Uint8List im =  await pickImage(ImageSource.gallery);
    setState(() {
      // _image = im;
    });
  }

  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });

    String res = await AuthMethods().signUpUser(
      email: _emailController.text, 
      password: _passwordController.text, 
      // username: _usernameController.text, 
      // bio: _bioController.text,
      // file: _image!,
    );

    if(res == "success"){
      Navigator.of(this.context).pushReplacement(MaterialPageRoute(builder: (context) => const HomeScreen()));
    }
    else{
      showSnackBar(res, this.context);
    }
    setState(() {
      _isLoading = false;
    });
  }

   void navigatetoSignIn(){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const loginScreen()));
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

              // Stack(
              //   children: [ 
              // _image != null ? 
              //     CircleAvatar(
              //           radius: 64,
              //           backgroundImage: MemoryImage(_image!),
              //     ) :
              //     CircleAvatar(
              //       radius: 64,
              //       backgroundImage: NetworkImage('https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'),
              //     ),
              //     Positioned(bottom: -10, left: 80, child: IconButton(onPressed: selectImage, icon: const Icon(Icons.add_a_photo)),),
              //   ],
              // ),

              Text("Register", style: TextStyle(color: themecolor, fontSize: 32, fontWeight: FontWeight.bold),),

              const SizedBox(height: 24,),

              // textFieldInput(
              //   textEditingController: _usernameController, 
              //   hintText: "Enter Your Username", 
              //   textInputType: TextInputType.text,
              // ),

              // const SizedBox(height: 24,),

              // textFieldInput(
              //   textEditingController: _bioController, 
              //   hintText: "Enter Your Bio", 
              //   textInputType: TextInputType.text,
              // ),

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
                onTap: signUpUser,
                child: Container(
                  child: _isLoading 
                    ? const Center(child: CircularProgressIndicator(
                      color: Colors.white,
                    ),) 
                    : const Text("Sign Up"),
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
                    child: const Text("Already a user?"),
                  ),

                  GestureDetector(
                    onTap: navigatetoSignIn,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: const Text("Log in.", style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                  ),
                ],
              ),

              Column(
                children: [
                  GestureDetector(
                    onTap: () => AuthService().signInWithGoogle(),
                    child: Image.asset('assets/images/google_logo.png', height: 30, width: 30,),
                  ),
                ],
              ),

              const SizedBox(height: 12,),

              Container(
                child: const Text("Sign up using your Google Account"),
              ),

              Flexible(child: Container(), flex: 2,),
            
            ]
          ),
        ),
      ),
    );
  }
}